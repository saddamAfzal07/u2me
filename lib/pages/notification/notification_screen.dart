import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
      body: ListView.builder(
          itemCount: listRender.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                horizontalTitleGap: 6,
                dense: true,
                visualDensity: const VisualDensity(vertical: -2),
                leading: Image.asset(
                  listRender[index].image.toString(),
                  width: 70,
                  height: 50,
                ),
                title: Text(listRender[index].title.toString()),
                subtitle: Text(listRender[index].subtitle.toString()),
                tileColor: AppColor.white,
                trailing: Container(
                  margin: const EdgeInsets.only(right: 6),
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    color: listRender[index].colorValue == true
                        ? Colors.red
                        : AppColor.primary,
                  ),
                  child: Center(
                    child: Text(
                      listRender[index].seen == "Seen"
                          ? "Seen"
                          : listRender[index].colorValue == true
                              ? "Open"
                              : listRender[index].buttontitle.toString(),
                      style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Render {
  String? title;
  String? subtitle;
  String? buttontitle;
  String? image;
  bool? colorValue;
  String? seen;
  Render(
      {required this.title,
      required this.subtitle,
      required this.buttontitle,
      required this.image,
      required this.colorValue,
      required this.seen});
}

final List<Render> listRender = [
  Render(
      title: 'Urgadnja Parketa',
      subtitle: '1 day and 11 days',
      buttontitle: 'Accepted',
      colorValue: false,
      image: "assets/images/pic1.png",
      seen: "Not seen"),
  Render(
      title: 'vexen pradoa have in ',
      subtitle: 'few days back ',
      buttontitle: ' Accepted',
      colorValue: false,
      image: "assets/images/pic2.png",
      seen: "Not seen"),
  Render(
      title: 'Its third title am writing',
      subtitle: 'third sub title',
      buttontitle: 'Accepted',
      colorValue: true,
      image: "assets/images/pic3.png",
      seen: "Not seen"),
  Render(
      title: 'fourth title am writing',
      subtitle: 'fourth sub title',
      buttontitle: 'Accepted',
      colorValue: false,
      image: "assets/images/pic1.png",
      seen: "Seen"),
];
