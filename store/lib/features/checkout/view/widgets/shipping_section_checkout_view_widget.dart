import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/constants/shipping_type.dart';
import 'package:store/features/checkout/view/widgets/change_shipping_type_button_checkout_view_widget.dart';
import 'package:store/features/checkout/view_model/cubit/checkout_cubit.dart';

class ShippingSectionCheckoutViewWidget extends StatelessWidget {
  const ShippingSectionCheckoutViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutCubit checkoutCubit = context.read<CheckoutCubit>();
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      shape: Border(bottom: BorderSide(width: .1)),
      title: Text(
        checkoutCubit.shippingType == ShippingType.standard
            ? "Standard Shipping"
            : "Express Shipping",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: ChangeShippingTypeButtonCheckoutViewWidget(
          checkoutCubit: checkoutCubit),
    );
  }
}
