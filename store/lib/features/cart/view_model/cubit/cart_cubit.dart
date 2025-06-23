import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/features/cart/model/cart_model.dart';
import 'package:store/features/products/model/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

//! get all Cart ....

  List<CartModel> cartProducts = [];
  Set<String> cartID = {};

  num subTotal = 0;
  num discount = 0;
  num deliveryFees = 250.0;
  num total = 0;

  void calculateSubTotal() {
    subTotal = 0;

    for (var cartItem in cartProducts) {
      subTotal += cartItem.productModel.price * cartItem.quantity;
    }

    emit(CartSubTotalUpdated(subTotal: subTotal));
  }

  void calculateDiscount() {
    discount = 0;
    for (var cartItem in cartProducts) {
      final old = cartItem.productModel.oldPrice;
      final current = cartItem.productModel.price;
      discount += (old - current) * cartItem.quantity;
    }
  }

  void calculateTotal() {
    total = (subTotal + deliveryFees) - discount;

    emit(CartTotalUpdated(total: total));
  }

  void updateCartCalculations() {
    calculateSubTotal();
    calculateDiscount();
    calculateTotal();
  }

  Stream<List<CartModel>> getAllCartProducts() async* {
    String? docUserID = await getUserDocId();

    yield* FirebaseFirestore.instance
        .collection("users")
        .doc(docUserID)
        .collection("cart")
        .snapshots()
        .map((snapshot) {
      cartProducts =
          snapshot.docs.map((doc) => CartModel.fromJson(doc.data())).toList();

      cartID = cartProducts.map((doc) => doc.productModel.productId).toSet();
      updateCartCalculations();
      emit(GetAllCartProductsSuccess());

      return cartProducts;
    });
  }

//! add or Remove Products From Cart ...

  addorRemoveProductsFromCart(ProductModel proudcts) async {
    try {
      String? docUserID = await getUserDocId();
      log("User ID: $docUserID");
      CollectionReference cart = FirebaseFirestore.instance
          .collection("users")
          .doc(docUserID)
          .collection("cart");

      bool isAlreadyInCart = cartID.contains(proudcts.productId);
      if (isAlreadyInCart) {
        var snapshot = await cart
            .where("productModel.product_id", isEqualTo: proudcts.productId)
            .get();
        for (var doc in snapshot.docs) {
          await doc.reference.delete();
        }

        cartID.remove(proudcts.productId);
        calculateSubTotal();
        calculateTotal();
        log("cart deleted");
      } else {
        await cart.add(CartModel(productModel: proudcts, quantity: 1).toMap());

        cartID.add(proudcts.productId);
        calculateSubTotal();
        calculateTotal();
        log("cart added");
      }
      // getAllCartProducts().listen((_) {});
      if (cartProducts.isEmpty) {
        emit(CartProductsListIsEmpty());
      } else {
        emit(AddOrRemoveproductToCartSuccess());
      }
    } catch (e) {
      emit(AddOrRemoveproductToCartError(message: e.toString()));
    }
  }

  //! increase Quantity ..
  Future<void> increaseQuantity(CartModel cartModel) async {
    try {
      String? docUserID = await getUserDocId();
      final cart = FirebaseFirestore.instance
          .collection("users")
          .doc(docUserID)
          .collection("cart");

      final snapshot = await cart
          .where("productModel.product_id",
              isEqualTo: cartModel.productModel.productId)
          .get();

      for (var doc in snapshot.docs) {
        await doc.reference.update({
          "quantity": cartModel.quantity + 1,
        });
      }
      emit(CartQuantityUpdateSuccess());
    } catch (e) {
      emit(CartQuantityUpdateError(message: e.toString()));
    }
  }

//! decrease Quantity ...

  Future<void> decreaseQuantity(CartModel cartModel) async {
    try {
      if (cartModel.quantity <= 1) {
        return;
      }

      String? docUserID = await getUserDocId();
      final cart = FirebaseFirestore.instance
          .collection("users")
          .doc(docUserID)
          .collection("cart");

      final snapshot = await cart
          .where("productModel.product_id",
              isEqualTo: cartModel.productModel.productId)
          .get();

      for (var doc in snapshot.docs) {
        await doc.reference.update({
          "quantity": cartModel.quantity - 1,
        });
      }
      emit(CartQuantityUpdateSuccess());
    } catch (e) {
      emit(CartQuantityUpdateError(message: e.toString()));
    }
  }

  //! clear Cart ...

  Future<void> clearCart() async {
    try {
      final userId = await getUserDocId();
      var snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("cart")
          .get();

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      cartProducts.clear();
      cartID.clear();
      updateCartCalculations();

      emit(DeleteCartSuccess());
      log("Cart Deleted");
      log(cartID.length.toString());
      log(cartProducts.length.toString());
    } catch (e) {
      emit(DeleteCartError(message: e.toString()));
      log("Error to delete Cart");
    }
  }
}
