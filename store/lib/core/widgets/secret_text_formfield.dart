import 'package:flutter/material.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class SecretTextFormfield extends StatefulWidget {
  const SecretTextFormfield({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.type,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType? type;

  @override
  State<SecretTextFormfield> createState() => _SecretTextFormfieldState();
}

class _SecretTextFormfieldState extends State<SecretTextFormfield> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: TextStyle(
                fontSize: ScreenSize.width / 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: ScreenSize.height / 60,
        ),
        TextFormField(
          obscureText: obscureText,
          style: TextStyle(
            color: Colors.black,
          ),
          keyboardType: widget.type,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                ScreenSize.width / 40,
              ),
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: ScreenSize.width / 25,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                obscureText = !obscureText;
                setState(() {});
              },
              icon: obscureText
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Your ${widget.label}';
            }
            return null;
          },
        ),
        spaceVertical(height: ScreenSize.height / 50),
      ],
    );
  }
}
