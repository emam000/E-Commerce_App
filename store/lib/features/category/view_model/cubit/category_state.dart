part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class GetAllCategoriesEmpty extends CategoryState {}

class GetAllCategoryLoading extends CategoryState {}

class GetAllCategorySuccess extends CategoryState {}

class GetAllCategoryError extends CategoryState {
  final String message;

  GetAllCategoryError({required this.message});
}
