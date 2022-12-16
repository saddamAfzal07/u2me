import 'package:flutter/widgets.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/padding.dart';

class SettingScreenWidget extends StatelessWidget {
  String title;
  String description;
  SettingScreenWidget(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padding48,
        Text(
          title,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
        padding10,
        Text(
          description,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: AppColor.greyBackground,
          ),
        ),
        padding12,
        Text(
          title,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
        padding10,
        Text(
          description,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: AppColor.greyBackground,
          ),
        ),
      ],
    );
  }
}
