import 'package:get/get.dart';
import 'package:newsanbercode/controller/firebase/firebase_auth.dart';

class RegSkillController extends GetxController {
  var authFirebase = AuthFirebase();
  var skillNotCreated = true.obs;

  @override
  void onInit() async {
    skillNotCreated.value = await authFirebase.checkSkill();
    print(skillNotCreated.value);
    super.onInit();
  }
}
