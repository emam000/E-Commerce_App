part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class GetAllCartProductsLoading extends CartState {}

class GetAllCartProductsSuccess extends CartState {}

class GetAllCartProductsError extends CartState {
  final String message;

  GetAllCartProductsError({required this.message});
}

class AddOrRemoveproductToCartLoading extends CartState {}

class AddOrRemoveproductToCartSuccess extends CartState {}

class AddOrRemoveproductToCartError extends CartState {
  final String message;

  AddOrRemoveproductToCartError({required this.message});
}

class CartProductsListIsEmpty extends CartState {}

class CartSubTotalUpdated extends CartState {
  final num subTotal;

  CartSubTotalUpdated({required this.subTotal});
}

class CartTotalUpdated extends CartState {
  final num total;

  CartTotalUpdated({required this.total});
}

class CartQuantityUpdateSuccess extends CartState {}

class CartQuantityUpdateError extends CartState {
  final String message;

  CartQuantityUpdateError({required this.message});
}

class DeleteCartSuccess extends CartState {}

class DeleteCartError extends CartState {
  final String message;

  DeleteCartError({required this.message});
}
