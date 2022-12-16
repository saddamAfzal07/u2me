import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

class SelectedButtonItem extends StatelessWidget {
  const SelectedButtonItem({
    Key? key,
    required this.text,
    this.width = double.infinity,
    this.onTap,
    this.color,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;
  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 52,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
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
