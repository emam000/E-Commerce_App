import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class NoOrdersWidget extends StatelessWidget {
  const NoOrdersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            cartEmpty,
            height: ScreenSize.height / 5,
            width: ScreenSize.width / 2,
          ),
          spaceVertical(height: ScreenSize.height / 20),
          Text(
            " No Orders Yet !",
            style: TextStyle(
              fontSize: ScreenSize.width / 15,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
