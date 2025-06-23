import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/features/checkout/view_model/cubit/checkout_cubit.dart';

class SaveAddressButtonWidget extends StatelessWidget {
  const SaveAddressButtonWidget({
    super.key,
    required this.checkoutCubit,
  });

  final CheckoutCubit checkoutCubit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
      onPressed: () {
        if (checkoutCubit.addressController.text.isNotEmpty) {
          checkoutCubit.updateAddress(checkoutCubit.addressController.text);
          Navigator.pop(context);
        }
      },
      child: Text(
        "Save",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
