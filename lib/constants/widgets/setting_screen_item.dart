import 'package:flutter/material.dart';

import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/padding.dart';

// ignore: must_be_immutable
class SettingScreenItem extends StatefulWidget {
  SettingScreenItem({
    Key? key,
    this.onTap,
    required this.image,
    required this.title,
  }) : super(key: key);
  final VoidCallback? onTap;

  String image;

  String title;
  @override
  State<SettingScreenItem> createState() => _SettingScreenItemState();
}

class _SettingScreenItemState extends State<SettingScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.image,
                    width: 20,
                    height: 20,
                  ),
                  padding16,
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColor.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 13,
                ),
                child: Image.asset(
                  "assets/images/forward.png",
                  width: 10,
                  height: 15,
                ),
              ),
            ],
          ),
        ),
        padding8,
        Container(
          height: 1.2,
          color: AppColor.white,
        ),
        padding32,
      ],
    );
  }
}
