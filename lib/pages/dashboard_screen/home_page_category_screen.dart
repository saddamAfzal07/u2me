import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/pages/services/select_category/category_screen.dart';
import 'package:u2me/pages/services/select_category/maps_screen.dart';
import 'package:u2me/pages/services/select_category/my_jobs_screen.dart';
import 'package:u2me/pages/services/select_category/profile_screen.dart';

class CategoryHomepage extends StatefulWidget {
  const CategoryHomepage({super.key});

  @override
  State<CategoryHomepage> createState() => _CategoryHomepageState();
}

class _CategoryHomepageState extends State<CategoryHomepage> {
  int selecteditem = 0;
  List page = [
    const CategoryPage(),
    const MapsScreen(),
    const MyJobsScreen(),
    const MyProfielScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColor.background,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage(
                    "assets/images/category.png",
                  ),
                  color: selecteditem == 0 ? AppColor.primary : AppColor.white,
                ),
                label: 'Category'),
            BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage(
                  "assets/images/location.png",
                ),
                color: selecteditem == 1 ? AppColor.primary : AppColor.white,
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage(
                  "assets/images/job.png",
                ),
                color: selecteditem == 2 ? AppColor.primary : AppColor.white,
              ),
              label: 'My jobs',
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage(
                    "assets/images/user.png",
                  ),
                  color: selecteditem == 3 ? AppColor.primary : AppColor.white,
                ),
                label: 'Profile'),
          ],
          currentIndex: selecteditem,
          onTap: (setValue) {
            setState(() {
              selecteditem = setValue;
            });
          },
          backgroundColor: AppColor.background,
          elevation: 0,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: AppColor.white,
          selectedFontSize: 14,
          unselectedFontSize: 12,
        ),
      ),
      backgroundColor: AppColor.background,
      body: page.elementAt(selecteditem),
    );
  }
}
