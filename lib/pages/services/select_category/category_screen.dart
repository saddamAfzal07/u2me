import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:u2me/constants/app_url.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/userinfo.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/models/jobs_list_model.dart';
import 'package:u2me/pages/notification/notification_screen.dart';
import 'package:u2me/pages/services/select_category.dart';
import 'package:u2me/pages/settings/setting_screen.dart';
import 'package:http/http.dart' as http;

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Data> listJobs = [];

  getAllJobs() async {
    print("Enter into  api");

    String token = UserInfo.token;
    print(token);
    var response = await http.get(Uri.parse("${AppUrl.baseUrl}all/jobs"),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print(response.body);
    Map data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (int i = 0; i < data["data"].length; i++) {
        Map obj = data["data"][i];
        Data pos = Data();
        pos = Data.fromJson(obj);
        listJobs.add(pos);
      }
      setState(() {});
      print("===>>>>>>>>>${listJobs}");
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.background,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()));
            },
            child: Image.asset(
              "assets/images/drawer.png",
              // width: 7,
              // height: 12,
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
          },
          child: Image.asset(
            "assets/images/notification.png",
            width: 7,
            height: 12,
          ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 6 / 8,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemCount: listJobs.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectCategory(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   // height: 100,
                      //   child: Image.network(
                      //     "https://vinciflow.com/api/v1/user${listJobs[index].jobMedias![0].basePath.toString()}",
                      //     width: double.infinity,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      SizedBox(
                        // height: 100,
                        child: Image.asset(
                          "assets/images/pic1.png",
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, top: 8),
                        child: Text(
                          listJobs[index].jobTitle.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, top: 3),
                        child: Text(
                          listJobs[index].shortDescription.toString(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, top: 3),
                        child: Text(
                          "\$${listJobs[index].budget.toString()}",
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 28,
                        width: double.infinity,
                        color: AppColor.primary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: Text(
                                'OPEN DETAILS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.white,
                              size: 20,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
