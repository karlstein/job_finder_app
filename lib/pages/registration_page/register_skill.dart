import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/globalkey/globalkey_formstate.dart';
import 'package:newsanbercode/controller/registration/registration_controller.dart';
import 'package:newsanbercode/controller/registration/regskill_controller.dart';
import 'package:newsanbercode/models/skill_model.dart';
import 'package:newsanbercode/routing/routes_named.dart';
import 'package:newsanbercode/widgets/confirmation_button.dart';
import 'package:newsanbercode/widgets/container_form.dart';

class RegisterSkill extends StatelessWidget {
  RegisterSkill({Key? key}) : super(key: key);
  final cReg = Get.put(RegistrationController());
  final cSkl = Get.put(RegSkillController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skill Set"),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed(RoutesName.login_page_email);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => LoadingOverlay(
            isLoading: cReg.isLoading.value,
            child: SingleChildScrollView(
              child: ContainerForm(
                formKey: FormKey.skillFormKey,
                formTitle: "4. Your Skill",
                formSubtitle: "Let Employers know what\nyou can do",
                children: [
                  SizedBox(height: 20),
                  cSkl.skillNotCreated.value
                      ? Text("")
                      : buildStreamSkill(context),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      cReg.showAddSkillModal();
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10, top: 2),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDEBEB),
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 30,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Add Skill",
                            style: kFontDefault,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ConfirmationButton(
                    onPressed: () => cReg.completeRegistration(),
                    buttonName: "Complete",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildStreamSkill(context) => StreamBuilder<List<SkillModel>>(
        stream: cReg.firestoreStream.getAllSkill(cReg.userEmail.value),
        builder: (context, snapshot) {
          var item = snapshot.data;
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(thickness: 6),
              shrinkWrap: true,
              itemCount: item!.isEmpty ? 1 : item.length,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.only(top: 15, right: 3, left: 8, bottom: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(top: 3),
                          width: 20,
                          child: Text(
                            "${index + 1}.",
                            style: kFontDefault.copyWith(fontSize: 15),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "${item[index].skill}",
                              overflow: TextOverflow.visible,
                              style: kFontDefault.copyWith(fontSize: 16),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            width: 300,
                            height: 2,
                            decoration:
                                BoxDecoration(border: Border.all(width: 1)),
                          ),
                          Container(
                            width: 300,
                            child: Text(
                              "${item[index].describe}",
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      );
}
