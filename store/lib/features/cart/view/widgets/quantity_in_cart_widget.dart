import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/model/cart_model.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class QuantityInCartWidget extends StatelessWidget {
  const QuantityInCartWidget({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return Row(
      children: [
        InkWell(
          onTap: () async {
            if (cartModel.quantity <= 1) {
              customDialog(
                dismissOnTouchOutside: true,
                context: context,
                stylishDialogType: StylishDialogType.ERROR,
                content: Text(
                  "Quantity can't be less than 1",
                  style: TextStyle(
                    fontSize: ScreenSize.width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Text(
                  "Error",
                  style: TextStyle(
                    fontSize: ScreenSize.width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ).show();
            } else {
              await cartCubit.decreaseQuantity(cartModel);
            }
          },
          child: Container(
            width: ScreenSize.width / 15,
            height: ScreenSize.height / 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenSize.width / 60),
              color: Colors.grey.shade200,
              border: Border.all(color: kPrimaryColor),
            ),
            child: Icon(
              Icons.remove,
              size: ScreenSize.width / 20,
            ),
          ),
        ),
        spaceHorizontal(width: ScreenSize.width / 40),
        Text(
          cartModel.quantity.toString(),
          style: TextStyle(
            fontSize: ScreenSize.width / 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        spaceHorizontal(width: ScreenSize.width / 40),
        InkWell(
          onTap: () async {
            await cartCubit.increaseQuantity(cartModel);
          },
          child: Container(
            width: ScreenSize.width / 15,
            height: ScreenSize.height / 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenSize.width / 60),
              color: Colors.grey.shade200,
              border: Border.all(color: kPrimaryColor),
            ),
            child: Icon(
              Icons.add,
              size: ScreenSize.width / 20,
            ),
          ),
        ),
      ],
    );
  }
}
