part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class GetAllProductsByCategoryLoading extends ProductState {}

class GetAllProductsByCategorySuccess extends ProductState {}

class GetAllProductsByCategoryError extends ProductState {
  final String message;

  GetAllProductsByCategoryError({required this.message});
}

class GetProductDetailsLoading extends ProductState {}

class GetProductDetailsSuccess extends ProductState {}

class GetProductDetailsError extends ProductState {
  final String message;

  GetProductDetailsError({required this.message});
}
