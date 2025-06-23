import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/model/cart_model.dart';
import 'package:store/features/cart/view/widgets/name_and_price_product_in_cart_widget.dart';
import 'package:store/features/cart/view/widgets/product_image_in_cart_widget.dart';
import 'package:store/features/cart/view/widgets/quantity_and_delete_product_in_cart_widget.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:store/features/products/view/product_details_view.dart';

class ProductInCartWidget extends StatefulWidget {
  const ProductInCartWidget({super.key, required this.cartModel});

  final CartModel cartModel;
  @override
  State<ProductInCartWidget> createState() => _ProductInCartWidgetState();
}

class _ProductInCartWidgetState extends State<ProductInCartWidget> {
  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsView(
                    productModel: widget.cartModel.productModel)));
      },
      child: Container(
        padding: EdgeInsets.all(ScreenSize.width / 120),
        height: ScreenSize.height / 5.5,
        decoration: BoxDecoration(
          color: kbackcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kPrimaryColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProductImageInCartWidget(
              product: widget.cartModel.productModel,
            ),
            NameAndPriceProductInCartWidget(
              product: widget.cartModel.productModel,
            ),
            QuantityAndDeleteProductInCartWidget(
              cartCubit: cartCubit,
              product: widget.cartModel.productModel,
              cartModel: widget.cartModel,
            ),
          ],
        ),
      ),
    );
  }
}
