import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:store/features/category/model/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

//! get all Category ...

  List<CategoryModel> categories = [];

  Future<List<CategoryModel>> getAllCategory() async {
    try {
      emit(GetAllCategoryLoading());
      categories.clear();
      var snapShot =
          await FirebaseFirestore.instance.collection("categories").get();
      for (var category in snapShot.docs) {
        categories.add(CategoryModel.fromJson(category.data()));
      }
      if (categories.isEmpty) {
        emit(GetAllCategoriesEmpty());
        return [];
      }
      log("categoryyyyyyyy${categories.length.toString()}");
      emit(GetAllCategorySuccess());
      return categories;
    } on FirebaseException catch (e) {
      emit(GetAllCategoryError(message: e.toString()));
      throw Exception(e.toString());
    } catch (e) {
      emit(GetAllCategoryError(message: e.toString()));
      throw Exception(e.toString());
    }
  }
}
