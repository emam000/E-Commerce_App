import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/features/checkout/view/add_card_view.dart';

class AddCardSectionPaymentMethodViewWidget extends StatelessWidget {
  const AddCardSectionPaymentMethodViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddCardView()));
      },
      child: Card(
        elevation: 0,
        child: ListTile(
          leading: Icon(
            Icons.payment,
            color: kPrimaryColor,
          ),
          title: Text(
            "Add Card",
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
