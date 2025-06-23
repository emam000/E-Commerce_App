import 'package:flutter/material.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/features/authentication/view_model/cubit/auth_cubit.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
    required this.authCubit,
  });

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (authCubit.emailIn.text.isEmpty) {
          customDialog(
              dismissOnTouchOutside: true,
              context: context,
              stylishDialogType: StylishDialogType.ERROR,
              title: Text("Error"),
              content: Text(
                "Please Enter Your Email Then Press on Reset Your Password ...",
                textAlign: TextAlign.center,
              )).show();
        } else {
          authCubit.resetPassword();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Forget Your Password?"),
        ],
      ),
    );
  }
}
