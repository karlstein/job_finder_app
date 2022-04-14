import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/controller/dashboard/dashboard_controller.dart';
import 'package:newsanbercode/widgets/drawer_list.dart';

class JobDetailPage extends StatelessWidget {
  var c = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Apply this job"),
        icon: Icon(Icons.work_outline),
      ),
      endDrawer: DrawerList(),
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      height: 150,
                      width: double.infinity,
                      child: Center(
                        child: c.jobDetail.value.companyLogo == ""
                            ? Text("No Image")
                            : Image.network(
                                c.jobDetail.value.companyLogo.toString()),
                      )),
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: Color(0xFFC4C4C4),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 5, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "${c.jobDetail.value.title}",
                                style: TextStyle(
                                    overflow: TextOverflow.visible,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              width: 20,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.bookmark_border),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${c.jobDetail.value.companyName}",
                          style: TextStyle(overflow: TextOverflow.visible),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${c.jobDetail.value.location}",
                          style: TextStyle(
                              fontSize: 12,
                              overflow: TextOverflow.visible,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 21,
                          child: Text(
                            "${c.jobDetail.value.time}",
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10),
                  //   height: 2,
                  //   width: double.infinity,
                  //   color: Color(0xFFC4C4C4),
                  // ),
                  JobDescription(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget JobDescription() => Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              c.jobDetail.value.jobDesc!.length == 0 ? "" : "Job Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: c.description
                    .descriptionList(c.jobDetail.value.jobDesc!, true),
              ),
            ),
            SizedBox(height: 15),
            Text(c.jobDetail.value.criteria!.length == 0 ? "" : "Criteria",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: c.description
                    .descriptionList(c.jobDetail.value.criteria!, true),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      );
}
