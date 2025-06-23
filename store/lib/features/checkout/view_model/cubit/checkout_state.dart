part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

class CheckoutAddressUpdated extends CheckoutState {
  final String address;
  CheckoutAddressUpdated({required this.address});
}

class ShippingTypeChanged extends CheckoutState {
  final ShippingType shippingType;
  ShippingTypeChanged(this.shippingType);
}

class CheckoutPaymentMethodChanged extends CheckoutState {
  final PaymentMethod selectedMethod;

  CheckoutPaymentMethodChanged({required this.selectedMethod});
}

class PaymentWithCashOnDelivaryLoading extends CheckoutState {}

class PaymentWithCashOnDelivarySuccess extends CheckoutState {}
