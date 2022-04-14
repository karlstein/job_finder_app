import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/controller/firebase/firestore_crud.dart';
import 'package:newsanbercode/controller/registration/verification_controller.dart';

var c = Get.find<VerificationController>();
FirestoreCreate firestoreCreate = FirestoreCreate();

class SendEmailVerification {
  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      await firestoreCreate.createEmailVerification();
    } catch (e) {
      Get.snackbar("Hello", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
