import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/service_provider_role/post_job.dart';

class SelectCategory extends StatelessWidget {
  SelectCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.background,
        actions: [
          Image.asset(
            "assets/images/drawer.png",
            // width: 7,
            // height: 12,
          ),
        ],
        leading: Image.asset(
          "assets/images/notification.png",
          width: 7,
          height: 12,
        ),
        title: const Text(
          "Select category",
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            children: [
              padding32,
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
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: followServicesitems.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const PlaceOrderScreen()));
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              color: followServicesitems[index].selection ==
                                      "Selected"
                                  ? AppColor.primary
                                  : AppColor.greyBackground,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text(
                                  followServicesitems[index].text.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 15, color: AppColor.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 3,
                          color: AppColor.background,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 80,
                          color:
                              followServicesitems[index].selection == "Selected"
                                  ? AppColor.primary
                                  : AppColor.greyBackground,
                          height: 40,
                          child: Text(
                            followServicesitems[index].selection.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: followServicesitems[index].selection ==
                                        "Selected"
                                    ? AppColor.white
                                    : AppColor.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),

              // padding32,
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: ButtonItem(
              //     text: "Continue",
              //     onTap: () {},
              //   ),
              // ),
              padding16,
            ],
          ),
        ),
      ),
    );
  }
}

class SelectedCategory {
  String? text;
  String? selection;
  SelectedCategory({required this.text, required this.selection});
}

final List<SelectedCategory> followServicesitems = [
  SelectedCategory(
    selection: "Selected",
    text: "Appliance Services",
  ),
  SelectedCategory(
    selection: "Selected",
    text: "Asphalt/Paving",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Assembly Services",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Attic Insulation",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Auto Detailing",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Assembly Services",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Assembly Services",
  ),
  SelectedCategory(
    selection: "Selected",
    text: "Basement Renovation",
  ),
  SelectedCategory(
    selection: "Selected",
    text: "Bath Tub Installation and Finishing",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Basement Renovation",
  ),
  SelectedCategory(
    selection: "Select",
    text: "BBQ Services",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Brick/Masonry Service",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Cabinetry",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Basement Renovation",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Basement Renovation",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Brick/Masonry Service",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Cabinetry",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Basement Renovation",
  ),
  SelectedCategory(
    selection: "Select",
    text: "Basement Renovation",
  ),
];
