import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/padding.dart';
import 'package:u2me/pages/notification/notification_screen.dart';
import 'package:u2me/pages/services/select_category.dart';
import 'package:u2me/pages/settings/onclick/chat/chat_screen.dart';
import 'package:u2me/pages/settings/setting_screen.dart';

class MyJobsScreen extends StatelessWidget {
  const MyJobsScreen({super.key});

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
            appBar:
            AppBar(
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
            );
          },
          child: Image.asset(
            "assets/images/notification.png",
            width: 7,
            height: 12,
          ),
        ),
        title: const Text(
          "My jobs",
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 7 / 10,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemCount: listRender.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatPage()));
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        // height: 100,
                        child: Image.asset(
                          listRender[index].image.toString(),
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, top: 8),
                        child: Text(
                          listRender[index].title.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, top: 6),
                        child: Text(
                          listRender[index].subtitle.toString(),
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

class Render {
  String? title;
  String? subtitle;
  String? buttontitle;
  String? image;
  Render(
      {required this.title,
      required this.subtitle,
      required this.buttontitle,
      required this.image});
}

final List<Render> listRender = [
  Render(
      title: 'Urgadnja Parketa',
      subtitle: '3 days left • Uciteljska 11,Beograd • \$50-85',
      buttontitle: 'FINISHED',
      image: "assets/images/pic1.png"),
  Render(
      title: 'vexen pradoa have in ',
      subtitle: '3 days left • Uciteljska 11,Beograd • \$50-85',
      buttontitle: 'FINISHED',
      image: "assets/images/pic2.png"),
  Render(
      title: 'Urgadnja Parketa',
      subtitle: '3 days left • Uciteljska 11,Beograd • \$50-85',
      buttontitle: 'FINISHED',
      image: "assets/images/pic3.png"),
];
