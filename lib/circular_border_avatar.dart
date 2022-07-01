import 'package:flutter/material.dart';

class CircularBorderAvatar extends StatelessWidget {
  const CircularBorderAvatar(this.image,
      {Key? key, this.size = 32, required this.borderColor}) // class constructor default value
      : super(key: key);
  final String image;
  final double size;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          backgroundBlendMode: BlendMode.clear,
          border: Border.all(color: borderColor, width: 2),
          image: DecorationImage(image: NetworkImage(image))), // ImageProvider 를 위해 NetworkImage 를 사용하자.
      width: size,
      height: size,
    );
  }
}
