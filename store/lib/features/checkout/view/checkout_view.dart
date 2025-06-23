import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/checkout/view/payment_methods_view.dart';
import 'package:store/features/checkout/view/widgets/address_secttion_checkout_view_widget.dart';
import 'package:store/features/checkout/view/widgets/custom_button_checkout_feature_widget.dart';
import 'package:store/features/checkout/view/widgets/order_list_section_checkout_view_widge.dart';
import 'package:store/features/checkout/view/widgets/shipping_section_checkout_view_widget.dart';
import 'package:store/features/checkout/view/widgets/custom_title_checkout_feature_widget.dart';
import 'package:store/features/checkout/view_model/cubit/checkout_cubit.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutCubit checkoutCubit = context.read<CheckoutCubit>();
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kbackcolor,
          appBar: AppBar(
            title: const Text('Checkout'),
          ),
          body: Padding(
            padding: EdgeInsets.all(ScreenSize.width / 25),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTitleCheckoutFeatureWidget(
                            title: "Delivery Address"),
                        AddressSecttionCheckoutViewWidget(),
                        spaceVertical(height: ScreenSize.height / 35),
                        CustomTitleCheckoutFeatureWidget(
                            title: "Shipping Type"),
                        ShippingSectionCheckoutViewWidget(),
                        spaceVertical(height: ScreenSize.height / 35),
                        CustomTitleCheckoutFeatureWidget(title: "Order List"),
                        OrderListSectionCheckoutViewWidget(),
                      ],
                    ),
                  ),
                ),
                CustomButtonCheckoutFeatureWidget(
                  title: "Continue to Payment",
                  onPressed: () async {
                    if (checkoutCubit.addressController.text.isEmpty) {
                      customDialog(
                        context: context,
                        stylishDialogType: StylishDialogType.ERROR,
                        content: Text("Please Enter Your Address first"),
                        title: Text("Error"),
                        dismissOnTouchOutside: true,
                      ).show();

                      return;
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethodsView()));
                      // await orderCubit.createOrder(
                      //     cartCubit: cartCubit, checkoutCubit: checkoutCubit);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
