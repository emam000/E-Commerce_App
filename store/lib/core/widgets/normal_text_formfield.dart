import 'package:flutter/material.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class NormalTextFormfield extends StatelessWidget {
  const NormalTextFormfield(
      {super.key,
      required this.label,
      required this.hint,
      required this.type,
      required this.controller});
  final String label;
  final String hint;
  final TextInputType? type;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
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
          style: TextStyle(
            color: Colors.black,
          ),
          keyboardType: type,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                ScreenSize.width / 40,
              ),
            ),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: ScreenSize.width / 25,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Your $label';
            }
            return null;
          },
        ),
        spaceVertical(height: ScreenSize.height / 50),
      ],
    );
  }
}
