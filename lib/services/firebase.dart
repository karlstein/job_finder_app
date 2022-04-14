import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseInstance {
  var cityCollection = FirebaseFirestore.instance.collection("ProvinsiKota");
  var profileCollection = FirebaseFirestore.instance.collection("UserModel");
  var skillCollection = FirebaseFirestore.instance.collection("UserSkill");
  var jobCollection = FirebaseFirestore.instance.collection("JobModel");

  final auth = FirebaseAuth.instance;
}
