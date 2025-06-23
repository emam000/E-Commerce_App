import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/favorite/view/widgets/favorite_empty_widget.dart';
import 'package:store/features/favorite/view_model/cubit/favorites_cubit.dart';
import 'package:store/features/home/view/widgets/get_all_products_widget.dart';
import 'package:store/features/products/model/product_model.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({
    super.key,
  });
  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
          body: context.read<FavoritesCubit>().favoritesProducts.isEmpty ||
                  state is FavoriteProductsListIsEmpty
              ? FavoriteEmptyWidget()
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      StreamBuilder<List<ProductModel>>(
                        stream: BlocProvider.of<FavoritesCubit>(context)
                            .getAllFavoriteProducts(),
                        builder: (context, snapshot) {
                          // if (snapshot.connectionState == ConnectionState.waiting) {
                          //   return Center(
                          //     child: CircularProgressIndicator(
                          //       color: kPrimaryColor,
                          //     ),
                          //   );
                          // } else
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.hasData) {
                            return GetAllProductsWidget(
                                products: snapshot.data!);
                          } else {
                            return SizedBox(
                              child: Text("No Data"),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
