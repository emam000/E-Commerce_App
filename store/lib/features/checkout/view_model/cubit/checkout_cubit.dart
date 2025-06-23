import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:store/core/utils/constants/payment_methods.dart';
import 'package:store/core/utils/constants/shipping_type.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:store/features/order/view_model/cubit/order_cubit.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

//! updat eAddress ...

  String address = 'Building , Street , Governorate , Country';

  TextEditingController addressController = TextEditingController();

  void updateAddress(String newAddress) {
    address = newAddress;
    emit(CheckoutAddressUpdated(address: address));
  }

  //! change Shipping Type...

  ShippingType shippingType = ShippingType.standard;

  void changeShippingType(ShippingType newType) {
    shippingType = newType;
    emit(ShippingTypeChanged(newType));
  }

//! change Payment Method  ...

  PaymentMethod? selectedPaymentMethod;

  void changePaymentMethod(PaymentMethod method) {
    selectedPaymentMethod = method;
    emit(CheckoutPaymentMethodChanged(selectedMethod: method));
  }

  void confirmPayment({
    required CartCubit cartCubit,
    required CheckoutCubit checkoutCubit,
    required OrderCubit orderCubit,
  }) {
    if (selectedPaymentMethod == null) {
      log("Please select a payment method");
      return;
    }

    switch (selectedPaymentMethod!) {
      case PaymentMethod.creditCard:
        handleCreditCard();
        break;
      case PaymentMethod.paypal:
        handlePaypal();
        break;
      case PaymentMethod.cashOnDelivery:
        handleCashOnDelivery(
            cartCubit: cartCubit,
            checkoutCubit: checkoutCubit,
            orderCubit: orderCubit);
        break;
    }
  }

  void handleCreditCard() {
    log("Processing Credit Card...");
  }

  void handlePaypal() {
    log("Processing PayPal...");
  }

  void handleCashOnDelivery(
      {required OrderCubit orderCubit,
      required CartCubit cartCubit,
      required CheckoutCubit checkoutCubit}) async {
    emit(PaymentWithCashOnDelivaryLoading());
    await orderCubit.createOrder(
        cartCubit: cartCubit, checkoutCubit: checkoutCubit);
    log("Cash on Delivery selected. Placing order...");
    await cartCubit.clearCart();
    emit(PaymentWithCashOnDelivarySuccess());
  }
}
