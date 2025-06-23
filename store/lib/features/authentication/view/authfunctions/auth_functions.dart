import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/features/authentication/view/signin_view.dart';
import 'package:store/features/authentication/view_model/cubit/auth_cubit.dart';
import 'package:store/features/home/view/home_bottom_nav_bar.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

//! sign In Listener State ...

void signInListenerState(
    AuthState state, BuildContext context, AuthCubit authCubit) {
  if (state is SignInSuccess) {
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      customScaffoldMessenger(
          backgroundColor: kPrimaryColor,
          context: context,
          content: Text(
            "SignIn Successfuly",
            style: TextStyle(color: Colors.black),
          ));
      authCubit.emailIn.clear();
      authCubit.passwordIn.clear();

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeBottomNavBar()));
    } else {
      customDialog(
          dismissOnTouchOutside: true,
          context: context,
          stylishDialogType: StylishDialogType.ERROR,
          title: Text("Error"),
          content: Text(
            "Please Verify your Email",
            textAlign: TextAlign.center,
          )).show();
    }
  } else if (state is SignInError) {
    customDialog(
        dismissOnTouchOutside: true,
        context: context,
        stylishDialogType: StylishDialogType.ERROR,
        title: Text("Error"),
        content: Text(
          state.message,
          textAlign: TextAlign.center,
        )).show();
  } else if (state is SigninWithGoogleSuccess) {
    customScaffoldMessenger(
        backgroundColor: kPrimaryColor,
        context: context,
        content: Text(
          "SignIn Successfuly",
          style: TextStyle(color: Colors.black),
        ));

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeBottomNavBar()));
  } else if (state is SigninWithGoogleError) {
    customDialog(
        dismissOnTouchOutside: true,
        context: context,
        stylishDialogType: StylishDialogType.ERROR,
        title: Text("Error"),
        content: Center(
            child: Text(
          state.message,
          textAlign: TextAlign.center,
        ))).show();
  } else if (state is ResetPasswordSuccess) {
    customDialog(
        dismissOnTouchOutside: true,
        context: context,
        stylishDialogType: StylishDialogType.INFO,
        title: Text("Done...!"),
        content: Text(
          "If this email exists, a reset link has been sent,So Please Check Your Email",
          textAlign: TextAlign.center,
        )).show();
  } else if (state is ResetPasswordError) {
    customDialog(
        dismissOnTouchOutside: true,
        context: context,
        stylishDialogType: StylishDialogType.ERROR,
        title: Text("Error"),
        content: Text(
          state.message,
          textAlign: TextAlign.center,
        )).show();
  }
}

//! sign up Listener State ...

void signUpListenerState(
    AuthState state, BuildContext context, AuthCubit authCubit) {
  if (state is SignUpSuccess) {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SigninView()));
    customDialog(
        dismissOnTouchOutside: true,
        context: context,
        stylishDialogType: StylishDialogType.INFO,
        title: Text("Done..."),
        content: Center(
            child: Text(
          "Please Confirm Your Email",
          textAlign: TextAlign.center,
        ))).show();
    authCubit.nameUp.clear();
    authCubit.phoneUp.clear();
    authCubit.emailUp.clear();
    authCubit.passwordUp.clear();
  } else if (state is SignUpError) {
    customDialog(
        dismissOnTouchOutside: true,
        context: context,
        stylishDialogType: StylishDialogType.ERROR,
        title: Text("Error"),
        content: Center(
            child: Text(
          state.message,
          textAlign: TextAlign.center,
        ))).show();
  }
}
