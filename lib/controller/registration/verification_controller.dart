import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/controller/firebase/firebase_auth.dart';
import 'package:newsanbercode/controller/registration/component/send_email_verification.dart';
import 'package:newsanbercode/routing/routes_named.dart';

class VerificationController extends GetxController {
  SendEmailVerification send = SendEmailVerification();
  AuthFirebase authFirebase = AuthFirebase();
  var isVerified = false.obs;
  var isLoading = false.obs;
  var isEmailVerificationSent = false.obs;
  var refreshTimer;
  var resendTimer;
  var resendDuration = Duration(seconds: 30).obs;
  var hours = "".obs;
  var minutes = "".obs;
  var seconds = "".obs;

  @override
  void onInit() async {
    super.onInit();
    isVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;

    hours.value = strDigits(resendDuration.value.inHours.remainder(24));
    minutes.value = strDigits(resendDuration.value.inMinutes.remainder(60));
    seconds.value = strDigits(resendDuration.value.inSeconds.remainder(60));

    if (!isVerified.value) {
      isEmailVerificationSent.value =
          await authFirebase.checkEmailVerification();
      if (isEmailVerificationSent.value) send.sendVerificationEmail();

      refreshTimer = Timer.periodic(
        Duration(seconds: 10),
        (_) {
          resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
            final seconds = resendDuration.value.inSeconds - 1;
            if (seconds < 0) {
              this.disposeId(refreshTimer);
            } else {
              resendDuration.value = Duration(seconds: seconds);
              update();
              print(seconds);
              print(resendDuration);
            }
          });
          checkEmailVerified();
        },
      );
    }
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    isVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
    print(isVerified.value);

    if (isVerified.value) {
      this.disposeId(refreshTimer);
      Get.offNamed(RoutesName.register_profile_page);
    }
  }

  @override
  void dispose() {
    this.disposeId(refreshTimer);
    this.disposeId(resendTimer);
    super.dispose();
  }
}
