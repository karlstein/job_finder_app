import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/dashboard/dashboard_controller.dart';
import 'package:newsanbercode/widgets/drawer_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var c = Get.put(DashboardController());
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
          child: Obx(
        () => ListView.builder(
            itemCount: c.jobs == null ? 0 : c.jobs.length,
            itemBuilder: (context, index) {
              var items = c.jobs;
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 250,
                              child: items[index].companyLogo == ""
                                  ? Text("No Image")
                                  : Image.network(
                                      items[index].companyLogo.toString()),
                            ),
                            Container(
                              child: Icon(Icons.bookmark_border),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          child: Container(
                            child: Text(
                              items[index].title.toString(),
                              style: kFontDefault.copyWith(
                                  fontSize: 16, color: Colors.blueAccent),
                            ),
                          ),
                          onTap: () {
                            c.goto.goToDetailPage(items[index]);
                          },
                        ),
                        Container(
                          child: Text(
                            items[index].companyName.toString(),
                            style: kFontLight.copyWith(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            items[index].location.toString(),
                            style: kFontDefault.copyWith(
                                fontSize: 15, color: Colors.black),
                          ),
                        ),
                        Container(
                          child: items[index].content == []
                              ? Text("")
                              : Column(
                                  children: c.description.descriptionList(
                                      items[index].criteria!, false),
                                ),
                        ),
                      ],
                    )),
              );
            }),
      )),
    );
  }
}

// Center(
// child: Container(
// child: Column(
// children: [
// SizedBox(height: 20),
// ToggleButtons(
// children: [
// TextButton(
// child: Text("asd"),
// onPressed: () {},
// ),
// TextButton(
// child: Text("aws"),
// onPressed: () {},
// ),
// TextButton(
// child: Text("zxc"),
// onPressed: () {},
// ),
// ],
// color: Colors.greenAccent,
// selectedColor: Colors.amberAccent,
// fillColor: Colors.purple,
// highlightColor: Colors.purpleAccent,
// splashColor: Colors.lightBlue,
// isSelected: isSelected,
// onPressed: (int index) {
// setState(() {
// isSelected[index] = !isSelected[index];
// });
// },
// )
// ],
// ),
// ),
// ),

// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 50,
// height: 50,
// child: items[index].companyLogo == ""
// ? Text("No Img")
// : Image.network(
// items[index].companyLogo.toString(),
// ),
// ),
// Expanded(
// child: Container(
// padding: EdgeInsets.only(bottom: 8),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding:
// EdgeInsets.symmetric(horizontal: 8),
// child: Text(
// items[index].companyName.toString(),
// style:
// kFontDefault.copyWith(fontSize: 16),
// ),
// ),
// Padding(
// padding:
// EdgeInsets.symmetric(horizontal: 8),
// child: Text(
// items[index].location.toString()),
// )
// ],
// ),
// ),
// )
// ],
// ),
