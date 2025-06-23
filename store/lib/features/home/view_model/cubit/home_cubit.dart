import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/features/home/model/banner_model.dart';
import 'package:store/features/products/model/product_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<BannerModel> banners = [];

  Future<List<BannerModel>> getAllBanners() async {
    try {
      emit(GetAllBannersLoading());
      var snapShot =
          await FirebaseFirestore.instance.collection("banners").get();
      for (var banner in snapShot.docs) {
        banners.add(BannerModel.fromJson(banner.data()));
      }
      if (banners.isEmpty) {
        emit(GetAllBannersEmpty());
        return [];
      }
      log("banersssss${banners.length.toString()}");
      emit(GetAllBannersSuccsess());
      return banners;
    } on FirebaseException catch (e) {
      emit(GetAllBannersError(messge: e.toString()));
      throw Exception(e.toString());
    } catch (e) {
      emit(GetAllProductsError(messge: e.toString()));
      throw Exception(e.toString());
    }
  }

  //!  get all Products ...
  List<ProductModel> products = [];
  Future<List<ProductModel>> getAllProducts() async {
    try {
      emit(GetAllProductsLoading());

      products.clear();
      var snapShot =
          await FirebaseFirestore.instance.collection("products").get();
      for (var item in snapShot.docs) {
        products.add(ProductModel.fromJson(item.data()));
      }
      if (products.isEmpty) {
        emit(GetAllProductsEmpty());
        return [];
      }
      log("productssssssss${products.length.toString()}");
      emit(GetAllProductsSuccsess());
      return products;
    } on FirebaseException catch (e) {
      emit(GetAllProductsError(messge: e.toString()));
      throw Exception(e.toString());
    } catch (e) {
      emit(GetAllProductsError(messge: e.toString()));
      throw Exception(e.toString());
    }
  }
//!
  // Stream<List<ProductModel>> getAllProducts() async* {
  //   try {
  //     emit(GetAllProductsLoading());

  //     yield* FirebaseFirestore.instance
  //         .collection("products")
  //         .snapshots()
  //         .map((snapshot) {
  //       products = snapshot.docs
  //           .map((doc) => ProductModel.fromJson(doc.data()))
  //           .toList();

  //       if (products.isEmpty) {
  //         emit(GetAllProductsEmpty());
  //       } else {
  //         emit(GetAllProductsSuccsess());
  //       }

  //       return products;
  //     });
  //   } on FirebaseException catch (e) {
  //     emit(GetAllProductsError(messge: e.toString()));
  //     throw Exception(e.toString());
  //   } catch (e) {
  //     emit(GetAllProductsError(messge: e.toString()));
  //     throw Exception(e.toString());
  //   }
  // }

//! filter products ...

  List<ProductModel> filterAllProduct = [];
  TextEditingController searchController = TextEditingController();
  void filterProuducts({required String input}) {
    if (input.isEmpty) {
      filterAllProduct = [];
    } else {
      filterAllProduct = products
          .where((e) => e.name.toLowerCase().startsWith(input.toLowerCase()))
          .toList();
    }
    log("Filtered: ${filterAllProduct.length}");
    emit(FilterProductsSuccess());
  }
//! Clear search bar ....

  void clearSearchBar() {
    searchController.clear();
    filterAllProduct.clear();
    emit(ClearSearchBar());
  }

  //! is liked product ....
  isliked(ProductModel product) {
    return isLikedProduct(product);
  }
}
