import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/controller/registration/component/send_email_verification.dart';
import 'package:newsanbercode/routing/routes_named.dart';

class VerificationController extends GetxController {
  SendEmailVerification send = SendEmailVerification();
  var isVerified = false.obs;
  var isLoading = false.obs;
  var timer;

  @override
  void onInit() {
    super.onInit();
    isVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isVerified.value) {
      send.sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    isVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
    print(isVerified.value);

    if (isVerified.value) {
      this.disposeId(timer);
      Get.offNamed(RoutesName.register_profile_page);
    }
  }

  @override
  void dispose() {
    this.disposeId(timer);
    super.dispose();
  }
}
