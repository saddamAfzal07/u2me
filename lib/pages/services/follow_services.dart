import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/services/select_category/home_page_category_screen.dart';

class FollowServices extends StatelessWidget {
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
                  childAspectRatio: 13 / 4,
                ),
                itemCount: followServicesitems.length,
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4, right: 1.5, left: 1.5),
                      child: Container(
                        color: followServicesitems[index].value
                            ? AppColor.primary
                            : AppColor.greyBackgroun,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          child: Text(
                            followServicesitems[index].title,
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryHomepage()));
                  },
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

class Service {
  String title;
  bool value;
  Service({required this.title, required this.value});
}

final List<Service> followServicesitems = [
  Service(
    title: "Appliance Services",
    value: true,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Attic Insulation",
    value: false,
  ),
  Service(
    title: "Attic Insulation",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: true,
  ),
  Service(
    title: "Bath Tub Installation and Finishing",
    value: true,
  ),
  Service(
    title: "Appliance Services",
    value: true,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Attic Insulation",
    value: false,
  ),
  Service(
    title: "Attic Insulation",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: true,
  ),
  Service(
    title: "Bath Tub Installation and Finishing",
    value: true,
  ),
  Service(
    title: "Appliance Services",
    value: true,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Attic Insulation",
    value: false,
  ),
  Service(
    title: "Attic Insulation",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: true,
  ),
  Service(
    title: "Bath Tub Installation and Finishing",
    value: true,
  ),
  Service(
    title: "Appliance Services",
    value: true,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: false,
  ),
  Service(
    title: "Attic Insulation",
    value: false,
  ),
  Service(
    title: "Attic Insulation",
    value: false,
  ),
  Service(
    title: "Asphalt/Paving",
    value: true,
  ),
  Service(
    title: "Bath Tub Installation and Finishing",
    value: true,
  ),
];
