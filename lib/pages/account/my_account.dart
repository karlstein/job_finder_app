import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/dashboard/dashboard_controller.dart';
import 'package:newsanbercode/routing/routes_named.dart';
import 'package:newsanbercode/widgets/drawer_list.dart';
import 'package:newsanbercode/widgets/my_account_menu_card.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2196F3),
        title: Container(
          width: double.infinity,
          height: 37,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                hintStyle: kFontDefault.copyWith(fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      endDrawer: DrawerList(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding:
                  EdgeInsets.only(top: 15, left: 12, right: 12, bottom: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD9D9D9)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Positioned(
                        child: Container(
                          height: 260,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 149,
                        color: Color(0xFF5E5CE4),
                      ),
                      Positioned(
                        top: 95,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(width: 5, color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: Color(0xFFC4C4C4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 9,
                    color: Color(0xFFC4C4C4),
                  ),
                  AccountBar(
                    leading: Icons.history_rounded,
                    title: "Application History",
                    trailing: Icons.chevron_right_outlined,
                  ),
                  AccountBar(
                    leading: Icons.bookmark_outlined,
                    title: "Saved Jobs",
                    trailing: Icons.chevron_right_outlined,
                  ),
                  AccountBar(
                    leading: Icons.event_note_outlined,
                    title: "Resume",
                    trailing: Icons.chevron_right_outlined,
                  ),
                  AccountBar(
                    leading: Icons.school,
                    title: "Eduacation",
                    trailing: Icons.chevron_right_outlined,
                  ),
                  AccountBar(
                    leading: Icons.work_outlined,
                    title: "Experience",
                    trailing: Icons.chevron_right_outlined,
                  ),
                  AccountBar(
                    leading: Icons.engineering_outlined,
                    title: "Skill",
                    trailing: Icons.chevron_right_outlined,
                    onPressed: () => Get.toNamed(RoutesName.account_skill),
                  ),
                  AccountBar(
                    leading: Icons.account_box_outlined,
                    title: "Profile",
                    trailing: Icons.chevron_right_outlined,
                    onPressed: () => Get.toNamed(RoutesName.account_profile),
                  ),
                  AccountBar(
                    leading: Icons.settings,
                    title: "Account Setting",
                    trailing: Icons.chevron_right_outlined,
                    onPressed: () => Get.toNamed(RoutesName.account_setting),
                  ),
                  Container(
                    height: 9,
                    color: Color(0xFFC4C4C4),
                  ),
                  AccountBar(
                    leading: Icons.logout,
                    title: "Sign Out",
                    trailing: Icons.chevron_right_outlined,
                    onPressed: () => controller.authFirebase.logOut(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
