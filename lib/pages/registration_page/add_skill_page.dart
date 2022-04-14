import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/firebase/firebase_auth.dart';
import 'package:newsanbercode/controller/globalkey/globalkey_formstate.dart';
import 'package:newsanbercode/controller/registration/registration_controller.dart';
import 'package:newsanbercode/controller/registration/regskill_controller.dart';
import 'package:newsanbercode/widgets/confirmation_button.dart';

class AddSkillPage extends StatelessWidget {
  const AddSkillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = Get.find<RegistrationController>();
    var cSkl = Get.find<RegSkillController>();
    var authFirebase = AuthFirebase();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 20, right: 11, left: 11),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Form(
          key: FormKey.modalFormKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 50,
                child: Text(
                  "Add your skill here!",
                  style: kFontDefault.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              Container(
                height: 46,
                width: 342,
                child: TextFormField(
                  validator: (value) => c.regFormValidator(value, c.skill),
                  decoration: kFormFieldDecor.copyWith(hintText: "Skill Name"),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 342,
                child: TextFormField(
                  maxLines: 5,
                  validator: (value) => c.regFormValidator(value, c.describe),
                  decoration: kFormFieldDecor.copyWith(hintText: "Describe it"),
                ),
              ),
              SizedBox(height: 20),
              ConfirmationButton(
                  onPressed: () async {
                    c.firestoreCreate.createSkill();
                    cSkl.skillNotCreated.value =
                        await authFirebase.checkSkill();
                  },
                  buttonName: "Add Skill")
            ],
          ),
        ),
      ),
    );
  }
}
