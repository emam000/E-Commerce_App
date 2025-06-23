import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/checkout/view/widgets/save_address_button_widget.dart';
import 'package:store/features/checkout/view_model/cubit/checkout_cubit.dart';

class ChangeAddressButtonCheckoutViewWidget extends StatelessWidget {
  const ChangeAddressButtonCheckoutViewWidget({
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
          isScrollControlled: true,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: ScreenSize.height / 30,
                  top: ScreenSize.height / 30,
                  left: ScreenSize.width / 30,
                  right: ScreenSize.width / 30,
                ),
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
                    border: Border(
                        top: BorderSide(color: kPrimaryColor, width: 2))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Enter New Address",
                      style: TextStyle(
                        fontSize: ScreenSize.width / 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: checkoutCubit.addressController,
                      decoration: InputDecoration(
                        hintText: "Type your new address...",
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 2,
                    ),
                    SaveAddressButtonWidget(checkoutCubit: checkoutCubit),
                  ],
                ),
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
