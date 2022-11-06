import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/padding.dart';

class FollowServices extends StatelessWidget {
  final List followServicesitems = [
    "Appliance Services",
    "Asphalt/Paving",
    "Assembly Services",
    "Attic Insulation",
    "Bath Tub Installation and Finishing",
    "BBQ Services",
    "Appliance Services",
    "Asphalt/Paving",
    "Assembly Services",
    "Attic Insulation",
    "Bath Tub Installation and Finishing",
    "BBQ Services",
    "Appliance Services",
    "Asphalt/Paving",
    "Assembly Services",
    "Attic Insulation",
    "Bath Tub Installation and Finishing",
    "BBQ Services",
    "Appliance Services",
    "Asphalt/Paving",
    "Assembly Services",
    "Attic Insulation",
    "Bath Tub Installation and Finishing",
    "BBQ Services",
    "Appliance Services",
    "Asphalt/Paving",
    "Assembly Services",
    "Attic Insulation",
    "Bath Tub Installation and Finishing",
    "BBQ Services",
    "Appliance Services",
    "Asphalt/Paving",
    "Assembly Services",
    "Attic Insulation",
    "Bath Tub Installation and Finishing",
    "BBQ Services",
  ];

  FollowServices({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            children: [
              padding72,
              const Text(
                "Follow Services",
                style: TextStyle(
                  fontSize: 20.0,
                  color: AppColor.white,
                ),
              ),
              padding4,
              const Text(
                "Selected 23",
                style: TextStyle(
                  fontSize: 15,
                  color: AppColor.primary,
                ),
              ),
              padding32,
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 16 / 4,
                ),
                itemCount: followServicesitems.length,
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4, right: 1.5, left: 1.5),
                      child: Container(
                        color: AppColor.primary,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          child: Text(
                            followServicesitems[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15, color: AppColor.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              padding32,
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonItem(
                  text: "Continue",
                  onTap: () {},
                ),
              ),
              padding16,
            ],
          ),
        ),
      ),
    );
  }
}
