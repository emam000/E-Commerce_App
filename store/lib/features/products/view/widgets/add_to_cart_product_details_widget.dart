import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:store/features/products/model/product_model.dart';

class AddToCartProductDetailsWidget extends StatelessWidget {
  const AddToCartProductDetailsWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return Container(
      width: double.infinity,
      height: ScreenSize.height / 5,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(ScreenSize.width / 20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "price: ",
                style: TextStyle(
                  fontSize: ScreenSize.width / 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${productModel.price.toString()} EGP",
                style: TextStyle(
                  fontSize: ScreenSize.width / 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              spaceHorizontal(width: ScreenSize.width / 50),
              Text(
                "${productModel.oldPrice.toString()} EGP",
                style: TextStyle(
                    fontSize: ScreenSize.width / 20,
                    // fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.red),
              ),
            ],
          ),
          spaceVertical(height: ScreenSize.height / 40),
          InkWell(
            onTap: () {
              cartCubit.addorRemoveProductsFromCart(productModel);
            },
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Container(
                  height: ScreenSize.height / 15,
                  width: ScreenSize.width / 2,
                  decoration: BoxDecoration(
                    color: cartCubit.cartID.contains(productModel.productId)
                        ? kPrimaryColor
                        : Colors.black,
                    borderRadius: BorderRadius.circular(ScreenSize.width / 20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: ScreenSize.height / 20,
                        color: Colors.white,
                      ),
                      Text(
                        cartCubit.cartID.contains(productModel.productId)
                            ? "Added to cart"
                            : "Add to Cart",
                        style: TextStyle(
                          fontSize: ScreenSize.width / 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
