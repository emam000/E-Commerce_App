part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

class CreateOrderLoading extends OrderState {}

class CreateOrderSuccess extends OrderState {}

class CreateOrderError extends OrderState {
  final String message;

  CreateOrderError({required this.message});
}

class DeleteOrderSuccess extends OrderState {}

class DeleteOrderError extends OrderState {
  final String message;

  DeleteOrderError({required this.message});
}

class UpdateOrderSuccess extends OrderState {}

class UpdateOrderError extends OrderState {
  final String message;

  UpdateOrderError({required this.message});
}

class DeleteOldOrderSuccess extends OrderState {}

class DeleteOldOrderError extends OrderState {
  final String message;

  DeleteOldOrderError({required this.message});
}

class DeleteCartSuccess extends OrderState {}

class DeleteCartError extends OrderState {
  final String message;

  DeleteCartError({required this.message});
}

class GetAllOrdersLoading extends OrderState {}

class GetAllOrdersEmpty extends OrderState {}

class GetAllOrdersSuccess extends OrderState {}

class GetAllOrdersError extends OrderState {
  final String message;

  GetAllOrdersError({required this.message});
}
