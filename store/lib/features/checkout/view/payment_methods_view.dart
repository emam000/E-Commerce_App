import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:store/features/checkout/view/widgets/add_card_section_payment_method_view_widget.dart';
import 'package:store/features/checkout/view/widgets/custom_button_checkout_feature_widget.dart';
import 'package:store/features/checkout/view/widgets/payment_options_section_payment_view_widget.dart';
import 'package:store/features/checkout/view/widgets/custom_title_checkout_feature_widget.dart';
import 'package:store/features/checkout/view_model/cubit/checkout_cubit.dart';
import 'package:store/features/home/view/home_bottom_nav_bar.dart';
import 'package:store/features/order/view/my_orders_view.dart';
import 'package:store/features/order/view_model/cubit/order_cubit.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    OrderCubit orderCubit = context.read<OrderCubit>();
    CheckoutCubit checkoutCubit = context.read<CheckoutCubit>();
    CartCubit cartCubit = context.read<CartCubit>();
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is PaymentWithCashOnDelivarySuccess) {
          customDialog(
            dismissOnTouchOutside: false,
            context: context,
            stylishDialogType: StylishDialogType.INFO,
            content: Text("Order Added Successfully"),
            title: Text("Done !"),
            confirmButton: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeBottomNavBar()),
                  (route) => false,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrdersView()),
                );
              },
              child: Text(
                "View Orders",
                style: TextStyle(color: Colors.white),
              ),
            ),
            cancelButton: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeBottomNavBar()),
                  (route) => false,
                );
              },
              child: Text(
                "Go Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ).show();
        }

        // else if (state is ){}
      },
      builder: (context, state) {
        return
            //  PopScope(
            //   canPop: true,
            //   onPopInvokedWithResult: (didPop, result) async {
            //     if (didPop) {
            //       await orderCubit.deleteOrder();
            //     }
            //   },
            //   child:

            ModalProgressHUD(
          inAsyncCall: state is PaymentWithCashOnDelivaryLoading,
          progressIndicator: CircularProgressIndicator(
            color: kPrimaryColor,
          ),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Payment Methods'),
            ),
            body: Padding(
              padding: EdgeInsets.all(ScreenSize.width / 25),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTitleCheckoutFeatureWidget(
                              title: "Credit & Debit Card"),
                          spaceVertical(height: ScreenSize.height / 60),
                          AddCardSectionPaymentMethodViewWidget(),
                          spaceVertical(height: ScreenSize.height / 30),
                          CustomTitleCheckoutFeatureWidget(
                              title: "More Payment Options"),
                          spaceVertical(height: ScreenSize.height / 30),
                          PaymentOptionsSectionPaymentViewWidget(
                              checkoutCubit: checkoutCubit),
                        ],
                      ),
                    ),
                  ),
                  CustomButtonCheckoutFeatureWidget(
                    title: "Confirm Payment",
                    onPressed: () async {
                      if (checkoutCubit.selectedPaymentMethod == null) {
                        customDialog(
                          dismissOnTouchOutside: true,
                          context: context,
                          stylishDialogType: StylishDialogType.ERROR,
                          content: Text("Please Select Your Payment Method"),
                          title: Text("Error"),
                        ).show();
                      } else {
                        checkoutCubit.confirmPayment(
                            cartCubit: cartCubit,
                            checkoutCubit: checkoutCubit,
                            orderCubit: orderCubit);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    // );
  }
}
