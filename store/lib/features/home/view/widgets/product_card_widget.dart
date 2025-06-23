import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:store/features/favorite/view_model/cubit/favorites_cubit.dart';
import 'package:store/features/home/view/widgets/favorite_icon_product_in_home_widget.dart';
import 'package:store/features/home/view/widgets/image_product_in_home_widget.dart';
import 'package:store/features/home/view/widgets/name_product_in_home_widget.dart';
import 'package:store/features/home/view/widgets/price_and_old_price_and_cart_icon_product_in_home_widget.dart';
import 'package:store/features/products/model/product_model.dart';
import 'package:store/features/products/view/product_details_view.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({super.key, required this.products});
  final ProductModel products;
  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  StreamSubscription? favSubscription;
  StreamSubscription? cartSubscription;
  @override
  void initState() {
    super.initState();

    favSubscription = BlocProvider.of<FavoritesCubit>(context)
        .getAllFavoriteProducts()
        .listen((event) {
      if (mounted) {
        setState(() {});
      }
    });
    cartSubscription = BlocProvider.of<CartCubit>(context)
        .getAllCartProducts()
        .listen((event) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    favSubscription?.cancel();
    cartSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    FavoritesCubit favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsView(productModel: widget.products)));
      },
      child: Container(
        padding: EdgeInsets.all(ScreenSize.width / 70),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ScreenSize.width / 30,
          ),
          color: kbackcolor,
        ),
        child: Column(
          children: [
            Stack(alignment: Alignment.topRight, children: [
              ImageProductInHomeWidget(product: widget.products),
              FavoriteIconProductInHomeWidget(
                favoritesCubit: favoritesCubit,
                product: widget.products,
              ),
            ]),
            spaceVertical(height: ScreenSize.height / 200),
            NameProductInHomeWidget(
              product: widget.products,
            ),
            PriceAndOldPriceAndCartIconProductInHomeWidget(
                product: widget.products, cartCubit: cartCubit),
          ],
        ),
      ),
    );
  }
}
