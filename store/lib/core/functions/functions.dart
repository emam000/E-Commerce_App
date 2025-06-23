import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/core/database/cache/cache_helper.dart';
import 'package:store/features/authentication/view/signin_view.dart';
import 'package:store/features/home/view/home_bottom_nav_bar.dart';
import 'package:store/features/onboarding/view/onboarding_view.dart';
import 'package:store/features/products/model/product_model.dart';
import 'package:store/features/profile/model/user_model.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

//! space fun for horizental  and vertical ...
Widget spaceVertical({required double height}) {
  return SizedBox(
    height: height,
  );
}

Widget spaceHorizontal({required double width}) {
  return SizedBox(
    width: width,
  );
}

//! pick image from my phone ...

Future<File?> pickImageFromGallery() async {
  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image != null) {
    return File(image.path);
  }
  return null;
}

//! get doc id  ....

Future<String?> getUserDocId() async {
  var usreSnapshot = await FirebaseFirestore.instance.collection("users").get();

  for (var doc in usreSnapshot.docs) {
    if (doc["uid"] == FirebaseAuth.instance.currentUser!.uid) {
      return doc.id;
    }
  }
  return null;
}

//! get user data ...

Future<UserModel> getUserData() async {
  try {
    String? docID = await getUserDocId();

    var usreSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(docID).get();
    UserModel user = UserModel.fromJson(usreSnapshot.data());
    return user;
  } catch (e) {
    throw Exception(e.toString());
  }
}

//! check Onboarding And Auth ...

Widget checkOnboardingAndAuth() {
  if (FirebaseAuth.instance.currentUser == null &&
      CacheHelper.getData(key: "isVisited") == true) {
    return SigninView();
  } else if (FirebaseAuth.instance.currentUser != null) {
    return HomeBottomNavBar();
  } else {
    return OnboardingView();
  }
}

//! custom Stylis hDialog...
StylishDialog customDialog({
  required BuildContext context,
  required StylishDialogType stylishDialogType,
  required Widget? content,
  required Widget? title,
  required bool dismissOnTouchOutside,
  Widget? cancelButton,
  Widget? confirmButton,
}) {
  return StylishDialog(
    context: context,
    alertType: stylishDialogType,
    style: DefaultStyle(),
    title: title,
    content: content,
    cancelButton: cancelButton,
    confirmButton: confirmButton,
    dismissOnTouchOutside: dismissOnTouchOutside,
  );
}

//! custom Scaffold Messenger...
void customScaffoldMessenger(
    {required BuildContext context,
    required Widget content,
    required Color backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: content,
    backgroundColor: backgroundColor,
  ));
}

//! get position lat and lang ...

Future<Position> getCurrentPosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  Position position;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return Future.error('Location services are disabled.');
    }
  }
  position = await Geolocator.getCurrentPosition();
  return position;
}
//! is liked Product

Future<bool> isLikedProduct(ProductModel product) async {
  String? docUserID = await getUserDocId();
  var snapshot = await FirebaseFirestore.instance
      .collection("users")
      .doc(docUserID)
      .collection("favorites")
      .get();

  for (var doc in snapshot.docs) {
    if (doc["product_id"] == product.productId) {
      return true;
    }
  }
  return false;
}

Future<bool> isAddedProductInCart(ProductModel product) async {
  String? docUserID = await getUserDocId();
  var snapshot = await FirebaseFirestore.instance
      .collection("users")
      .doc(docUserID)
      .collection("cart")
      .get();

  for (var doc in snapshot.docs) {
    if (doc["product_id"] == product.productId) {
      return true;
    }
  }
  return false;
}
