import 'package:flutter/material.dart';

class CustomPickImage extends StatelessWidget {
  const CustomPickImage(
      {super.key, required this.image, required this.onPress});
  final ImageProvider<Object>? image;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: image,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: onPress,
            icon: const Icon(Icons.add_a_photo),
          ),
        ),
      ],
    );
  }
}
