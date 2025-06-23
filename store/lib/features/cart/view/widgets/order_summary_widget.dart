import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/view/widgets/build_row_summary_widget.dart';
import 'package:store/features/cart/view/widgets/proceed_to_checkout_button_widget.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:store/features/checkout/view/checkout_view.dart';

class OrderSummaryWidget extends StatefulWidget {
  const OrderSummaryWidget({super.key});

  @override
  State<OrderSummaryWidget> createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget> {
  @override
  Widget build(BuildContext context) {
    return ProceedToCheckoutButtonWidget(
      title: "View Summary",
      onPressed: () {
        showModalBottomSheet(
          barrierColor: Colors.black12,
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(ScreenSize.width / 20),
              height: ScreenSize.height / 3,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Order Summary",
                    style: TextStyle(
                      fontSize: ScreenSize.width / 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BuildRowSummaryWidget(
                      title: "Sub-Totla",
                      value: "${context.read<CartCubit>().subTotal} EGP"),
                  BuildRowSummaryWidget(
                      title: "Delivery Fees",
                      value: "${context.read<CartCubit>().deliveryFees} EGP"),
                  BuildRowSummaryWidget(
                      title: "Discount",
                      value: "${context.read<CartCubit>().discount} EGP"),
                  spaceVertical(height: ScreenSize.height / 120),
                  Divider(
                    height: 20,
                    color: kPrimaryColor,
                  ),
                  BuildRowSummaryWidget(
                      title: "Totla Cost",
                      value: "${context.read<CartCubit>().total} EGP"),
                  spaceVertical(height: ScreenSize.height / 100),
                  ProceedToCheckoutButtonWidget(
                    title: "Proceed To Checkout",
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutView()));
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
