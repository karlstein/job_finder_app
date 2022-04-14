import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/dashboard/dashboard_controller.dart';
import 'package:newsanbercode/routing/routes_named.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.find<DashboardController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
                "${c.myProfile.value!.firstName} ${c.myProfile.value!.lastName}"),
            accountEmail: Text("${c.myProfile.value!.email}"),
            // currentAccountPicture: ,
          ),
          ListTile(
            dense: true,
            title: Text(
              "My Account",
              style: kFontRegular.copyWith(fontSize: 14),
            ),
            leading: Icon(Icons.account_circle),
            onTap: () {
              Get.toNamed(RoutesName.account_my_account);
            },
          ),
          ListTile(
            dense: true,
            title: Text(
              "Sign Out",
              style: kFontRegular.copyWith(fontSize: 14),
            ),
            leading: Icon(Icons.logout),
            onTap: () => c.authFirebase.logOut(),
          ),
          ListTile(
            dense: true,
            title: Text(
              "Other",
              style: kFontRegular.copyWith(fontSize: 14),
            ),
            leading: Icon(Icons.flag),
            onTap: () async {
              print(c.myProfile.value!.address!.address1);
            },
          ),
        ],
      ),
    );
  }
}
