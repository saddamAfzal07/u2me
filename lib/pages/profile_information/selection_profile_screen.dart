import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/services/follow_services.dart';
import 'package:u2me/pages/services/select_category.dart';

class SelectionProfile extends StatelessWidget {
  const SelectionProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.background,
        leading: Image.asset(
          "assets/images/backarrow.png",
          width: 7,
          height: 12,
        ),
        title: Image.asset(
          "assets/images/logo.png",
          height: 30,
          width: 60,
          fit: BoxFit.contain,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    padding72,
                    const Text(
                      "You Are ?",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: AppColor.white,
                      ),
                    ),
                    padding120,
                    ButtonItem(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FollowServices()));
                      },
                      text: "looking for a service",
                    ),
                    padding4,
                    ButtonItem(
                      onTap: () {},
                      text: "provide service",
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ButtonItem(
                          text: "Continue",
                          onTap: () {},
                        ),
                      ),
                    ),
                    padding16,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
