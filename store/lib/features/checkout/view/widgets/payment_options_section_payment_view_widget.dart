import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/constants/payment_methods.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/checkout/view_model/cubit/checkout_cubit.dart';

class PaymentOptionsSectionPaymentViewWidget extends StatelessWidget {
  const PaymentOptionsSectionPaymentViewWidget({
    super.key,
    required this.checkoutCubit,
  });

  final CheckoutCubit checkoutCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height / 4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(
          ScreenSize.width / 20,
        ),
      ),
      child: Column(
        children: [
          RadioListTile<PaymentMethod>(
            activeColor: kPrimaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cash On Delivery",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.attach_money,
                  color: Colors.green,
                ),
              ],
            ),
            value: PaymentMethod.cashOnDelivery,
            groupValue: checkoutCubit.selectedPaymentMethod,
            onChanged: (value) {
              if (value != null) {
                checkoutCubit.changePaymentMethod(value);
              }
            },
          ),
          Divider(),
          RadioListTile<PaymentMethod>(
            activeColor: kPrimaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Credit Card",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.credit_card,
                  color: Colors.grey,
                ),
              ],
            ),
            value: PaymentMethod.creditCard,
            groupValue: checkoutCubit.selectedPaymentMethod,
            onChanged: (value) {
              if (value != null) {
                checkoutCubit.changePaymentMethod(value);
              }
            },
          ),
          Divider(),
          RadioListTile<PaymentMethod>(
            activeColor: kPrimaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PayPal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image(
                  image: AssetImage("assets/images/paypallogo.webp"),
                  width: ScreenSize.width / 10,
                  height: ScreenSize.height / 18,
                ),
              ],
            ),
            value: PaymentMethod.paypal,
            groupValue: checkoutCubit.selectedPaymentMethod,
            onChanged: (value) {
              if (value != null) {
                checkoutCubit.changePaymentMethod(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
