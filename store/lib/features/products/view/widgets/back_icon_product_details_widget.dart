import 'package:flutter/material.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class BackIconProductDetailsWidget extends StatelessWidget {
  const BackIconProductDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: ScreenSize.width / 20,
      backgroundColor: Colors.grey.shade100,
      child: IconButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: Colors.grey,
        ),
      ),
    );
  }
}
