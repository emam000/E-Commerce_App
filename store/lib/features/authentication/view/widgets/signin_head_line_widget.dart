import 'package:flutter/material.dart';

class SignInHeadLineWidget extends StatelessWidget {
  const SignInHeadLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Sign in",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
