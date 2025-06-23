import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/favorite/view_model/cubit/favorites_cubit.dart';
import 'package:store/features/products/model/product_model.dart';

class FavoriteIconProductInHomeWidget extends StatelessWidget {
  const FavoriteIconProductInHomeWidget({
    super.key,
    required this.favoritesCubit,
    required this.product,
  });

  final FavoritesCubit favoritesCubit;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: InkWell(
        onTap: () {
          favoritesCubit.addorRemoveProductsFromFavorites(product);
        },
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return CircleAvatar(
              radius: ScreenSize.width / 30,
              backgroundColor: Colors.grey.shade100,
              child: Icon(
                Icons.favorite,
                size: ScreenSize.height / 45,
                color: favoritesCubit.favoriteID.contains(product.productId)
                    ? kPrimaryColor
                    : Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
