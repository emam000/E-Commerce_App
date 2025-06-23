import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:store/core/database/cache/cache_helper.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/features/profile/model/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //! pick image from gallery ...
  File? profileImage;
  pickImage() async {
    try {
      emit(PickImageLoading());
      File? image = await pickImageFromGallery();
      if (image != null) {
        profileImage = image;
        emit(PickImageSuccess());
      } else {
        emit(PickImageError(message: "No image selected."));
      }
    } catch (e) {
      emit(PickImageError(message: e.toString()));
    }
  }

//! Sign Up function  with Firebase  ...

  TextEditingController nameUp = TextEditingController();
  TextEditingController phoneUp = TextEditingController();
  TextEditingController emailUp = TextEditingController();
  TextEditingController passwordUp = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  addUser(UserModel userModel) async {
    await users.add(userModel.toMap());
  }

  Future<void> signUp() async {
    try {
      emit(SignUpLoading());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailUp.text,
        password: passwordUp.text,
      );
      Position position = await getCurrentPosition();
      UserModel user = UserModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
        name: nameUp.text,
        email: emailUp.text,
        phone: phoneUp.text,
        lat: position.latitude,
        long: position.longitude,
      );
      await addUser(user);
      log("User Added");
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignUpError(message: "Firebase Error: ${e.message}"));
    } catch (e) {
      emit(SignUpError(message: e.toString()));
    }
  }

  //! sign in function with firebase .....

  TextEditingController emailIn = TextEditingController();
  TextEditingController passwordIn = TextEditingController();

  signIn() async {
    try {
      emit(SignInLoading());
      UserModel user = await getUserData();
      await CacheHelper.saveData(key: "id", value: user.uid);
      await CacheHelper.saveData(key: "name", value: user.name);
      await CacheHelper.saveData(key: "email", value: user.email);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailIn.text,
        password: passwordIn.text,
      );

      emit(SignInSuccess(message: "Sign In successfully"));
    } on FirebaseAuthException catch (e) {
      emit(SignInError(message: e.toString()));
    } catch (e) {
      emit(SignInError(message: e.toString()));
    }
  }

//! sign in with google ....

  signInWithGoogle() async {
    try {
      emit(SigninWithGoogleLoading());
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        emit(UncompleteSigninWithGoogle());
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      await CacheHelper.saveData(key: "id", value: userCredential.user!.uid);
      await CacheHelper.saveData(
          key: "name", value: userCredential.user!.displayName);
      await CacheHelper.saveData(
          key: "email", value: userCredential.user!.email);
      await CacheHelper.saveData(
          key: "profileImage", value: userCredential.user!.photoURL);

      Position position = await getCurrentPosition();

      String? docID = await getUserDocId();

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .get();
      if (!userDoc.exists && docID == null) {
        UserModel user = UserModel(
          uid: userCredential.user!.uid,
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          phone: "Update Your Phone Number",
          lat: position.latitude,
          long: position.longitude,
        );
        await addUser(user);
        log("user added");
        emit(SigninWithGoogleSuccess());
      } else {
        emit(SigninWithGoogleSuccess());
      }
    } on FirebaseAuthException catch (e) {
      emit(SigninWithGoogleError(message: e.toString()));
    } catch (e) {
      emit(SigninWithGoogleError(message: e.toString()));
    }
  }

  //! Reset Password => Email ....
  resetPassword() async {
    try {
      emit(ResetPasswordLoading());

      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailIn.text);

      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordError(
          message: "Something went wrong. Please try again. ${e.toString()}"));
    }
  }

  //! logOut from google ...

  logoutFromGoogle() async {
    // GoogleSignIn googleSignIn = GoogleSignIn();
    // googleSignIn.disconnect();
    await GoogleSignIn().signOut();
    await GoogleSignIn().disconnect();
    emit(LogoutSuccess());
  }

//! logOut from native provider ...

  logoutfromNativeProvider() async {
    await FirebaseAuth.instance.signOut();
    emit(LogoutSuccess());
  }
}
