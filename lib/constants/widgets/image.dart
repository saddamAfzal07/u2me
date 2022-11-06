import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/logo.png",
        height: 55,
        width: 110,
        fit: BoxFit.contain,
      ),
    );
  }
}
