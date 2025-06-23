import 'package:flutter/material.dart';
import 'package:store/core/database/cache/cache_helper.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class NameInProfileWidget extends StatelessWidget {
  const NameInProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Welcome, \n",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: ScreenSize.width / 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "${CacheHelper.getData(key: "name")} !",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenSize.width / 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Text(
          "${CacheHelper.getData(key: "email")}",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
