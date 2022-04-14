import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/dashboard/dashboard_controller.dart';
import 'package:newsanbercode/widgets/drawer_list.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              padding:
                  EdgeInsets.only(top: 15, left: 12, right: 12, bottom: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD9D9D9)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      Positioned(
                        top: 162,
                        left: 202,
                        child: Container(
                          child: Icon(
                            Icons.camera_enhance,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 9,
                    color: Color(0xFFC4C4C4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 160,
                        child: Text("First Name"),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 160,
                        child: Text("Last Name"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            initialValue: c.myProfile.value!.firstName,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFC4C4C4), width: 1))),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            initialValue: c.myProfile.value!.lastName,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFC4C4C4), width: 1))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 160,
                    child: Text("Address 1"),
                  ),
                  TextFormField(
                    initialValue: c.myProfile.value!.address!.address1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFC4C4C4)))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 160,
                    child: Text("Address 2"),
                  ),
                  TextFormField(
                    initialValue: c.myProfile.value!.address!.address2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFC4C4C4)))),
                  ),
                  DropdownSearch<String>(
                    selectedItem: c.allCityList.value
                        .firstWhere((e) =>
                            e.kota == c.myProfile.value!.address!.city &&
                            e.provinsi == c.myProfile.value!.address!.region)
                        .search_string,
                    mode: Mode.MENU,
                    showSearchBox: true,
                    showSelectedItems: true,
                    items: c.allCityList.value
                        .map((e) => e.search_string!)
                        .toList(),
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Region",
                      hintText: "Region",
                    ),
                    onChanged: print,
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 50,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: c.myProfile.value!.instagram,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC4C4C4)))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        alignment: Alignment.center,
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.black,
                        ),
                        child: Text(
                          "in",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: c.myProfile.value!.linkedIn,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC4C4C4)))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.web,
                        size: 50,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: c.myProfile.value!.website,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC4C4C4)))),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
