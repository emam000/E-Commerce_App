import 'package:flutter/material.dart';

class SignUpHeadLineWidget extends StatelessWidget {
  const SignUpHeadLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "SignUp",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
