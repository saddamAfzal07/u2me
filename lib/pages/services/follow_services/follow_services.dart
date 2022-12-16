import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:u2me/constants/app_url.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/userinfo.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/models/follow_services.dart';
import 'package:u2me/pages/dashboard_screen/home_page_category_screen.dart';
import 'package:http/http.dart' as http;

class FollowServices extends StatefulWidget {
  const FollowServices({Key? key}) : super(key: key);

  @override
  State<FollowServices> createState() => _FollowServicesState();
}

class _FollowServicesState extends State<FollowServices> {
  List<FollowServicesModel> followServices = [];
  bool isLoading = false;

  categoriesItem() async {
    setState(() {
      isLoading = true;
    });
    String token = UserInfo.token;
    var response = await http.get(
      Uri.parse("${AppUrl.baseUrl}all/categories"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);

      for (int i = 0; i < responseData["response"].length; i++) {
        Map obj = responseData["response"][i];
        FollowServicesModel pos = FollowServicesModel();
        pos = FollowServicesModel.fromJson(obj);
        followServices.add(pos);
      }
    } else {}
  }

  @override
  void initState() {
    super.initState();
    categoriesItem();
  }

  List selectedItems = [];
  void doMultiSelection(String path) {
    setState(() {
      if (selectedItems.contains(path)) {
        selectedItems.remove(path);
      } else {
        selectedItems.add(path);
      }
    });
  }

  saveServices({
    required String userId,
    required List selectedCategories,
  }) async {
    String token = UserInfo.token;
    final response = await http.post(
      Uri.parse("${AppUrl.baseUrl}save/categories"),
      body: {
        'user_id': userId,
        'category_id': selectedCategories.toString(),
      },
      headers: {
        'Authorization': 'Bearer $token',
        "accept": "application/json",
      },
    );
    print(response.body);
    Map<String, dynamic> data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      if (data["response"] == "Categories are added in user list") {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategoryHomepage()));
      } else {}
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Something went wrong!"),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            )
          : Padding(
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
                  Text(
                    "Selected ${selectedItems.length}",
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColor.primary,
                    ),
                  ),
                  padding32,
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 13 / 4,
                    ),
                    itemCount: followServices.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          doMultiSelection(followServices[index].id.toString());
                        },
                        child: GridTile(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 4, right: 1.5, left: 1.5),
                            child: Container(
                              color: selectedItems.contains(
                                      followServices[index].id.toString())
                                  ? AppColor.primary
                                  : AppColor.greyBackground,
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 2),
                                child: Text(
                                  followServices[index].categoryName.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 15, color: AppColor.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  padding32,
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonItem(
                        text: "Continue",
                        onTap: () {
                          if (selectedItems.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("Category must be Selected"),
                              backgroundColor: Colors.red.shade400,
                              behavior: SnackBarBehavior.floating,
                            ));
                          } else {
                            saveServices(
                              selectedCategories: selectedItems,
                              userId: UserInfo.userId.toString(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  padding16,
                ],
              ),
            ),
    );
  }
}
