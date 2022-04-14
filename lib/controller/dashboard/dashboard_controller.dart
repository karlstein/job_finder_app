import 'package:get/get.dart';
import 'package:newsanbercode/controller/dashboard/component/description_list.dart';
import 'package:newsanbercode/controller/dashboard/component/goto_detail_page.dart';
import 'package:newsanbercode/controller/firebase/firebase_auth.dart';
import 'package:newsanbercode/controller/firebase/firestore_crud.dart';
import 'package:newsanbercode/controller/firebase/firestore_stream.dart';
import 'package:newsanbercode/controller/json_act/read_json.dart';
import 'package:newsanbercode/models/job_model.dart';
import 'package:newsanbercode/models/profile_model.dart';
import 'package:newsanbercode/models/provinsi_kota.dart';
import 'package:newsanbercode/routing/routes_named.dart';
import 'package:newsanbercode/services/firebase.dart';

class DashboardController extends GetxController {
  var firebase = FirebaseInstance();
  var firestoreStream = FirestoreStream();
  var firestoreCreate = FirestoreCreate();
  var authFirebase = AuthFirebase();
  var description = Description();
  var goto = GoToDetailPage();
  var readJson = ReadJson();

  var isVerified = false.obs;
  var profileNotCreated = true.obs;
  var skillNotCreated = true.obs;
  var jobDetail = JobModel().obs;
  var jobs = RxList<JobModel>([]);
  var myProfile = Rxn<ProfileModel>();
  var allCityList = RxList<CityModel>([]);
  // var allCityString = RxList<String>([]);
  var userEmail = "".obs;

  @override
  void onInit() async {
    await authFirebase.checkAuthState();

    userEmail.value = await authFirebase.auth.currentUser!.email!;

    // Check if profile and skill are already created
    profileNotCreated.value = await authFirebase.checkProfile();
    skillNotCreated.value = await authFirebase.checkSkill();
    isVerified.value = await authFirebase.auth.currentUser!.emailVerified;

    print("Sudah verivikasi: ${isVerified.value}");

    if (!isVerified.value) {
      Get.offNamed(RoutesName.email_verification_page);
    } else if (profileNotCreated.value) {
      Get.offNamed(RoutesName.register_profile_page);
    } else if (skillNotCreated.value) {
      Get.offNamed(RoutesName.register_skill_page);
    } else {
      print(userEmail.value);

      // Bind Stream to variable
      jobs.bindStream(firestoreStream.getAllJobs());
      myProfile.bindStream(firestoreStream.getMyProfile(userEmail.value));
      allCityList.bindStream(firestoreStream.getAllCity());
    }

    super.onInit();
  }
}
