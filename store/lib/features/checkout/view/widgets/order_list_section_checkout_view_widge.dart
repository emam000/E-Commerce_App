import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';

class OrderListSectionCheckoutViewWidget extends StatelessWidget {
  const OrderListSectionCheckoutViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: cartCubit.cartProducts.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          shape: Border(
            bottom: BorderSide(width: .1),
          ),
          leading: Image.network(
            cartCubit.cartProducts[index].productModel.image,
            width: ScreenSize.width / 4,
            fit: BoxFit.fill,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartCubit.cartProducts[index].productModel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: ScreenSize.width / 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "x${cartCubit.cartProducts[index].quantity}",
                style: TextStyle(
                  fontSize: ScreenSize.width / 20,
                ),
              ),
              Text(
                "${cartCubit.cartProducts[index].productModel.price} EGP",
                style: TextStyle(
                  fontSize: ScreenSize.width / 20,
                ),
              ),
            ],
          ),
          // subtitle:
          // trailing:
        );
      },
    );
  }
}
