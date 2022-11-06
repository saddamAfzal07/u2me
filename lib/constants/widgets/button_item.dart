import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    Key? key,
    required this.text,
    this.width = double.infinity,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary,
      height: 52,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColor.primary,
          ),
        ),
        onPressed: onTap,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
