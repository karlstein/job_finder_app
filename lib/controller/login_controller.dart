import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/controller/firebase/firebase_auth.dart';

class LoginController extends GetxController {
  AuthFirebase authFirebase = AuthFirebase();

  final emailFormKey = GlobalKey<FormState>().obs;
  final passwordFormKey = GlobalKey<FormState>().obs;
  var obscureText = true.obs;
  var email = "".obs;
  var password = "".obs;
  var isLoading = false.obs;

  logFormValidator(String? value, RxString variable) {
    if (value == null || value.isEmpty) {
      return "This field can't be blank";
    }
    variable.value = value;
    return null;
  }

  changeVisibility() {
    obscureText.value = !obscureText.value;
  }
}
