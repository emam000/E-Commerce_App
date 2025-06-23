part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

class GetAllFavoriteProductsLoading extends FavoritesState {}

class GetAllFavoriteProductsSuccess extends FavoritesState {}

class GetAllFavoriteProductsError extends FavoritesState {
  final String message;

  GetAllFavoriteProductsError({required this.message});
}

class GetAllFavoriteProductsEmpty extends FavoritesState {}

class AddOrRemoveproductToFavoriteLoading extends FavoritesState {}

class AddOrRemoveproductToFavoriteSuccess extends FavoritesState {}

class AddOrRemoveproductToFavoriteError extends FavoritesState {
  final String message;

  AddOrRemoveproductToFavoriteError({required this.message});
}

class FavoriteProductsListIsEmpty extends FavoritesState {}
