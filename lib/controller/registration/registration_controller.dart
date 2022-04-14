import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/controller/firebase/firestore_crud.dart';
import 'package:newsanbercode/controller/firebase/firestore_stream.dart';
import 'package:newsanbercode/models/profile_model.dart';
import 'package:newsanbercode/models/provinsi_kota.dart';
import 'package:newsanbercode/models/skill_model.dart';
import 'package:newsanbercode/pages/registration_page/add_skill_page.dart';
import 'package:newsanbercode/routing/routes_named.dart';
import 'package:newsanbercode/services/firebase.dart';

class RegistrationController extends GetxController {
  FirebaseInstance firebase = FirebaseInstance();
  FirestoreCreate firestoreCreate = FirestoreCreate();
  FirestoreStream firestoreStream = FirestoreStream();

  var obscureText1 = false.obs;
  var obscureText2 = false.obs;
  var isLoading = false.obs;

  var regEmail = "".obs;
  var regPassword = "".obs;
  var passwordConfirm = "".obs;
  var firstName = "".obs;
  var lastName = "".obs;
  var address1 = "".obs;
  var address2 = "".obs;
  var cityProvince = Rxn<CityModel>();
  var instagram = "".obs;
  var linkedIn = "".obs;
  var website = "".obs;
  var skill = "".obs;
  var describe = "".obs;
  var skillModel = Rxn<SkillModel>();
  var profileModel = Rxn<ProfileModel>();

  var allCityList = RxList<CityModel>([]);
  var userEmail = Rxn<String>();
  var skillStream = RxList<SkillModel>([]);

  @override
  void onInit() async {
    userEmail.value = await firebase.auth.currentUser!.email;
    super.onInit();
    allCityList.bindStream(firestoreStream.getAllCity());
    skillStream.bindStream(firestoreStream.getAllSkill(userEmail.value));
  }

  regFormValidator(String? value, RxString variable) {
    if (value == null || value.isEmpty) {
      return "This field can't be blank";
    }
    variable.value = value;
    return null;
  }

  regDropDownValidator(String? value, Rxn<CityModel> variable) {
    if (value == null || value.isEmpty) {
      return "This field can't be blank";
    }
    variable.value = allCityList.firstWhere((e) => e.search_string == value);
    return null;
  }

  completeRegistration() async {
    await Get.offAllNamed(RoutesName.dashboard);
  }

  showAddSkillModal() async {
    isLoading.value = true;
    Get.bottomSheet(
      AddSkillPage(),
      isDismissible: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          side: BorderSide(width: 2, color: Colors.black)),
      enableDrag: false,
    );
    isLoading.value = false;
  }

  changeVisibility(RxBool obscure) {
    obscure.value = !obscure.value;
  }
}
