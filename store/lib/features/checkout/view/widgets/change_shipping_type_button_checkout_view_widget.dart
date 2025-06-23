import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/constants/shipping_type.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/checkout/view_model/cubit/checkout_cubit.dart';

class ChangeShippingTypeButtonCheckoutViewWidget extends StatelessWidget {
  const ChangeShippingTypeButtonCheckoutViewWidget({
    super.key,
    required this.checkoutCubit,
  });

  final CheckoutCubit checkoutCubit;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: kPrimaryColor),
      ),
      onPressed: () {
        showModalBottomSheet(
          barrierColor: Colors.black12,
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(ScreenSize.width / 20),
              height: ScreenSize.height / 4,
              decoration: BoxDecoration(
                  color: kbackcolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      ScreenSize.width / 20,
                    ),
                    topRight: Radius.circular(
                      ScreenSize.width / 20,
                    ),
                  ),
                  border:
                      Border(top: BorderSide(color: kPrimaryColor, width: 2))),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Choose Shipping Type",
                    style: TextStyle(
                      fontSize: ScreenSize.width / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RadioListTile<ShippingType>(
                    activeColor: kPrimaryColor,
                    title: Text("Standard Shipping"),
                    value: ShippingType.standard,
                    groupValue: checkoutCubit.shippingType,
                    onChanged: (value) {
                      if (value != null) {
                        checkoutCubit.changeShippingType(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  RadioListTile<ShippingType>(
                    activeColor: kPrimaryColor,
                    title: Text("Express Shipping"),
                    value: ShippingType.express,
                    groupValue: checkoutCubit.shippingType,
                    onChanged: (value) {
                      if (value != null) {
                        checkoutCubit.changeShippingType(value);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Text(
        "Change",
        style: TextStyle(color: kPrimaryColor),
      ),
    );
  }
}
