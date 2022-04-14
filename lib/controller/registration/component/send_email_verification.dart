import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/controller/registration/verification_controller.dart';

var c = Get.find<VerificationController>();

class SendEmailVerification {
  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      Get.snackbar("Hello", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
