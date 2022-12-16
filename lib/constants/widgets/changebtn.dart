import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

class ChangeButtonItem extends StatelessWidget {
  const ChangeButtonItem({
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(""),
                Text(
                  text.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColor.white,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
