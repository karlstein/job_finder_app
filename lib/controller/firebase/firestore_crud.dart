import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/controller/globalkey_formstate.dart';
import 'package:newsanbercode/controller/registration/registration_controller.dart';
import 'package:newsanbercode/models/job_model.dart';
import 'package:newsanbercode/models/provinsi_kota.dart';
import 'package:newsanbercode/routing/routes_named.dart';
import 'package:newsanbercode/services/firebase.dart';

FirebaseInstance firebase = FirebaseInstance();
var cReg = Get.find<RegistrationController>();

class FirestoreCreate {
  createProfile() async {
    if (FormKey.profileFormKey.currentState!.validate()) {
      cReg.isLoading.value = true;
      try {
        await firebase.profileCollection.add({
          'Firstname': cReg.firstName.value,
          'Lastname': cReg.lastName.value,
          'Email': firebase.auth.currentUser!.email,
          'Address': {
            'Address 1': cReg.address1.value,
            'Address 2': cReg.address2.value,
            'City': cReg.cityProvince.value!.kota,
            'Region': cReg.cityProvince.value!.provinsi,
          },
          'Instagram': cReg.instagram.value,
          'LinkedIn': cReg.linkedIn.value,
          'Website': cReg.website.value,
          'Account Status': true,
        });
        print("Your profile updated");
        Get.toNamed(RoutesName.register_skill_page);
        cReg.isLoading.value = false;
      } catch (e) {
        print("ada apa dengan: $e");
      }
    }
  }

  createSkill() async {
    if (FormKey.modalFormKey.currentState!.validate()) {
      cReg.isLoading.value = true;
      await firebase.skillCollection.add({
        'Email': cReg.userEmail.value,
        'Skill': cReg.skill.value,
        'Describe': cReg.describe.value,
      });
      Get.back();
      cReg.isLoading.value = false;
    }
  }

  registerAccount() async {
    if (FormKey.mainFormKey.currentState!.validate() &&
        cReg.regPassword.value == cReg.passwordConfirm.value) {
      cReg.isLoading.value = true;
      try {
        await firebase.auth.createUserWithEmailAndPassword(
            email: cReg.userEmail.value!, password: cReg.regPassword.value);
        Get.toNamed(RoutesName.email_verification_page);
      } on FirebaseException catch (e) {
        print(e.code);
        if (e.code == "email-already-in-use") {
          print("Email already registered");
        } else if (e.code == "weak-password") {
          print("Weak password");
        }
      }
      cReg.isLoading.value = false;
    }
  }

  Future<void> addAllJobTeFirebase(Future<List<JobModel>> readJson) async {
    List<JobModel> dummyList = await readJson;
    for (int i = 1; i < dummyList.length; i++) {
      try {
        await firebase.jobCollection
            .add({
              'title': dummyList[i].title,
              'location': dummyList[i].location,
              'time': dummyList[i].time,
              'companyLogo': dummyList[i].companyLogo,
              'companyName': dummyList[i].companyName,
              'idr': dummyList[i].idr,
              'Job Description': dummyList[i].jobDesc,
              'criteria': dummyList[i].criteria,
            })
            .then((value) => print("Job Added"))
            .catchError((error) => print("Failed to add user: $error"));
      } catch (e) {}
    }
  }

  Future<void> addAllCityToFirebase(
      Future<List<ProvinsiKotaModel>> readJson) async {
    List<ProvinsiKotaModel> dummyList = await readJson;
    for (int i = 0; i < dummyList.length; i++) {
      for (var city in dummyList[i].kota!) {
        try {
          await firebase.cityCollection.add({
            'provinsi': dummyList[i].provinsi,
            'kota': city,
            'search_string': "$city -- ${dummyList[i].provinsi}"
          });
        } catch (e) {}
      }
    }
    print("Add city data completed");
  }
}
