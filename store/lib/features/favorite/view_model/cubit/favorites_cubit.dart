import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/features/products/model/product_model.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  //! get all favorites ....
  List<ProductModel> favoritesProducts = [];
  Set<String> favoriteID = {};

  Stream<List<ProductModel>> getAllFavoriteProducts() async* {
    String? docUserID = await getUserDocId();

    yield* FirebaseFirestore.instance
        .collection("users")
        .doc(docUserID)
        .collection("favorites")
        .snapshots()
        .map((snapshot) {
      favoritesProducts = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      favoriteID = favoritesProducts.map((doc) => doc.productId).toSet();

      emit(GetAllFavoriteProductsSuccess());

      return favoritesProducts;
    });
  }

//! add or Remove Products From Favorites ...

  addorRemoveProductsFromFavorites(ProductModel products) async {
    try {
      String? docUserID = await getUserDocId();
      CollectionReference favorites = FirebaseFirestore.instance
          .collection("users")
          .doc(docUserID)
          .collection("favorites");

      bool isAlreadyFavorite = favoriteID.contains(products.productId);
      if (isAlreadyFavorite) {
        var snapshot = await favorites
            .where('product_id', isEqualTo: products.productId)
            .get();
        for (var doc in snapshot.docs) {
          await doc.reference.delete();
        }

        favoriteID.remove(products.productId);
        log("fav deleted");
      } else {
        await favorites.add(products.toMap());

        favoriteID.add(products.productId);
        log("fav add");
      }

      if (favoritesProducts.isEmpty) {
        emit(FavoriteProductsListIsEmpty());
      } else {
        emit(AddOrRemoveproductToFavoriteSuccess());
      }
    } catch (e) {
      emit(AddOrRemoveproductToFavoriteError(message: e.toString()));
    }
  }
}
