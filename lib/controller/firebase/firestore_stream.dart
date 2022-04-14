import 'package:newsanbercode/controller/firebase/firestore_crud.dart';
import 'package:newsanbercode/models/job_model.dart';
import 'package:newsanbercode/models/profile_model.dart';
import 'package:newsanbercode/models/provinsi_kota.dart';
import 'package:newsanbercode/models/skill_model.dart';

class FirestoreStream {
  Stream<List<SkillModel>> getAllSkill(email) {
    return firebase.skillCollection
        .where('Email', isEqualTo: email)
        .snapshots()
        .map((query) =>
            query.docs.map((e) => SkillModel.fromDocumentSnapshot(e)).toList());
  }

  Stream<List<CityModel>> getAllCity() {
    return firebase.cityCollection.snapshots().map((query) =>
        query.docs.map((e) => CityModel.fromDocumentSnapshot(e)).toList());
  }

  Stream<List<String>> getCityString() {
    return firebase.cityCollection.snapshots().map((query) =>
        query.docs.map((e) => e['search_string'].toString()).toList());
  }

  Stream<List<JobModel>> getAllJobs() {
    return firebase.jobCollection.snapshots().map((query) =>
        query.docs.map((e) => JobModel.fromDocumentSnapshot(e)).toList());
  }

  Stream<ProfileModel> getMyProfile(email) {
    return firebase.profileCollection
        .where("Email", isEqualTo: email)
        .snapshots()
        .map((query) => query.docs
            .map((e) => ProfileModel.fromDocumentSnapshot(e))
            .toList()
            .first);
  }
}
