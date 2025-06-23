import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class BuildTitleInProfileWidget extends StatelessWidget {
  const BuildTitleInProfileWidget({
    super.key,
    required this.onTap,
    required this.leadingIcon,
    required this.title,
  });
  final void Function()? onTap;

  final IconData leadingIcon;

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minVerticalPadding: ScreenSize.height / 30,
      shape: Border(
        bottom: BorderSide(
          width: .4,
          color: Colors.grey,
        ),
      ),
      leading: Icon(
        leadingIcon,
        color: kPrimaryColor,
      ),
      title: Text(title),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kPrimaryColor,
      ),
    );
  }
}
