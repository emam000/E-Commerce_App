import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/checkout/view/widgets/change_address_button_checkout_view_widget.dart';
import 'package:store/features/checkout/view_model/cubit/checkout_cubit.dart';

class AddressSecttionCheckoutViewWidget extends StatelessWidget {
  const AddressSecttionCheckoutViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutCubit checkoutCubit = context.read<CheckoutCubit>();
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      shape: Border(bottom: BorderSide(width: .1)),
      title: Text(
        checkoutCubit.address,
        style: TextStyle(
          color: checkoutCubit.addressController.text.isEmpty
              ? Colors.grey
              : Colors.black,
        ),
      ),
      trailing:
          ChangeAddressButtonCheckoutViewWidget(checkoutCubit: checkoutCubit),
    );
  }
}
