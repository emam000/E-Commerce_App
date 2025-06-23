import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/favorite/view_model/cubit/favorites_cubit.dart';
import 'package:store/features/products/model/product_model.dart';
import 'package:store/features/products/view/widgets/add_to_cart_product_details_widget.dart';
import 'package:store/features/products/view/widgets/back_icon_product_details_widget.dart';
import 'package:store/features/products/view/widgets/image_product_details_widget.dart';
import 'package:store/features/products/view/widgets/product_description_product_details_widget.dart';
import 'package:store/features/products/view/widgets/product_name_product_details_widget.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    FavoritesCubit favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(ScreenSize.width / 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ImageProductDetailsWidget(
                        productModel: widget.productModel),
                    Positioned(
                      left: 0,
                      top: 10,
                      child: BackIconProductDetailsWidget(),
                    ),
                    Positioned(
                      right: 0,
                      top: 10,
                      child: BlocBuilder<FavoritesCubit, FavoritesState>(
                        builder: (context, state) {
                          return CircleAvatar(
                            radius: ScreenSize.width / 20,
                            backgroundColor: Colors.grey.shade100,
                            child: IconButton(
                              onPressed: () {
                                favoritesCubit.addorRemoveProductsFromFavorites(
                                    widget.productModel);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: favoritesCubit.favoriteID
                                        .contains(widget.productModel.productId)
                                    ? kPrimaryColor
                                    : Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                spaceVertical(height: ScreenSize.height / 30),
                ProductNameProductDetailsWidget(
                    productModel: widget.productModel),
                spaceVertical(height: ScreenSize.height / 60),
                Text(
                  "Product Details :",
                  style: TextStyle(fontSize: ScreenSize.width / 20),
                ),
                spaceVertical(height: ScreenSize.height / 60),
                ProductDescriptionProductDetailsWidget(
                    productModel: widget.productModel),
                spaceVertical(height: ScreenSize.height / 60),
                AddToCartProductDetailsWidget(
                    productModel: widget.productModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
