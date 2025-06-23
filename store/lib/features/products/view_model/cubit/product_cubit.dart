import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:store/features/products/model/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  List<ProductModel> productsByCategory = [];
  Future<List<ProductModel>> getProductsByCategory(
      {required String categoryId}) async {
    try {
      emit(GetAllProductsByCategoryLoading());
      productsByCategory.clear();
      var snapshot = await FirebaseFirestore.instance
          .collection("products")
          .where("category_id", isEqualTo: categoryId)
          .get();
      productsByCategory = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      emit(GetAllProductsByCategorySuccess());
      return productsByCategory;
    } on FirebaseException catch (e) {
      emit(GetAllProductsByCategoryError(message: e.toString()));
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

//   ProductModel? product;
//   Future<ProductModel> getProductDetails({required productId}) async {
//     try {
//       emit(GetProductDetailsLoading());
//       var snapshot =
//           await FirebaseFirestore.instance.collection("products").get();

//       for (var doc in snapshot.docs) {
//         if (doc["product_id"] == productId) {
//           product = ProductModel.fromJson(doc.data());
//         }

//       }

//       return product!;
//     } on FirebaseException catch (e) {
//       emit(GetProductDetailsError(message: e.toString()));
//       throw Exception(e.toString());
//     } catch (e) {
//       emit(GetProductDetailsError(message: e.toString()));
//       throw Exception(e.toString());
//     }
//   }
}
