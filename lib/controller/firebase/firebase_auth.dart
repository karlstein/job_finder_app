import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/controller/firebase/firestore_crud.dart';
import 'package:newsanbercode/routing/routes_named.dart';

class AuthFirebase {
  var auth = FirebaseAuth.instance;

  Future<bool> checkProfile() async {
    var email = await auth.currentUser!.email;
    QuerySnapshot querySnapshot =
        await firebase.profileCollection.where('Email', isEqualTo: email).get();
    if (querySnapshot.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkSkill() async {
    var email = await auth.currentUser!.email;

    QuerySnapshot querySnapshot =
        await firebase.skillCollection.where('Email', isEqualTo: email).get();
    if (querySnapshot.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  checkAuthState() async {
    await auth.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
        Get.offAllNamed(RoutesName.login_page_email);
      } else {
        print('User is signed in');
      }
    });
  }

  loginNext(emailFormKey, RxBool isLoading, RxString email) async {
    if (emailFormKey.value.currentState!.validate()) {
      isLoading.value = true;
      try {
        await auth.createUserWithEmailAndPassword(
            email: email.value, password: "percobaan");
      } on FirebaseException catch (e) {
        if (e.code == "email-already-in-use") {
          Get.toNamed(RoutesName.login_page_password);
          print("catch" + email.value);
        }
      }
      isLoading.value = false;
    }
  }

  loginSubmit(passwordFormKey, RxBool isLoading, RxString email,
      RxString password) async {
    if (passwordFormKey.value.currentState!.validate()) {
      isLoading.value = true;
      try {
        print("Email: ${email.value} & Password ${password.value}");
        await auth.signInWithEmailAndPassword(
            email: email.value, password: password.value);

        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('UserModel')
            .where("Email", isEqualTo: email.value)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          isLoading.value = false;
          Get.offAllNamed(RoutesName.dashboard);
        } else {
          isLoading.value = false;
          Get.offAllNamed(RoutesName.register_profile_page);
        }
      } on FirebaseException catch (e) {
        if (e.code == 'user-not-found') {
          print('No users found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }

        isLoading.value = false;
      }
    }
  }

  logOut() async {
    await auth.signOut();
    Get.offAllNamed(RoutesName.login_page_email);
  }
}
