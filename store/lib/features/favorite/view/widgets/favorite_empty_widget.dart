import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class FavoriteEmptyWidget extends StatelessWidget {
  const FavoriteEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            favoriteEmpty,
            height: ScreenSize.height / 5,
            width: ScreenSize.width / 2,
          ),
          spaceVertical(height: ScreenSize.height / 20),
          Text(
            "Favorite Empty",
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
