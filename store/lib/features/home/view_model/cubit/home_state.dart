part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

//! LogOut States ....

class LogoutLoading extends HomeState {}

class LogoutSuccess extends HomeState {
  final String message;

  LogoutSuccess({required this.message});
}

class LogoutError extends HomeState {
  final String message;

  LogoutError({required this.message});
}

class ChangeCurrentNavBarIndex extends HomeState {}

class GetAllProductsLoading extends HomeState {}

class GetAllProductsSuccsess extends HomeState {}

class GetAllProductsError extends HomeState {
  final String messge;

  GetAllProductsError({required this.messge});
}

class GetAllProductsEmpty extends HomeState {}

class GetAllBannersEmpty extends HomeState {}

class GetAllBannersLoading extends HomeState {}

class GetAllBannersSuccsess extends HomeState {}

class GetAllBannersError extends HomeState {
  final String messge;

  GetAllBannersError({required this.messge});
}

class FilterProductsSuccess extends HomeState {}

class ClearSearchBar extends HomeState {}
