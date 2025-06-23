import 'package:flutter/material.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:store/features/products/model/product_model.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class DeleteInCartWidget extends StatelessWidget {
  const DeleteInCartWidget({
    super.key,
    required this.cartCubit,
    required this.product,
  });

  final CartCubit cartCubit;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customDialog(
          dismissOnTouchOutside: true,
          context: context,
          stylishDialogType: StylishDialogType.INFO,
          content: Text("Do you want to Delete Item ??"),
          title: Text("confirmation"),
          cancelButton: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: kPrimaryColor,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
          confirmButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
            ),
            onPressed: () {
              cartCubit.addorRemoveProductsFromCart(product);
              Navigator.pop(context);
            },
            child: Text(
              "Delete",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ).show();
      },
      child: Container(
        width: ScreenSize.width / 7,
        height: ScreenSize.height / 30,
        // height: 25,
        // width: 50,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(ScreenSize.width / 60),
        ),
        child: Icon(
          Icons.delete,
          size: ScreenSize.width / 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
