import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/globalkey_formstate.dart';
import 'package:newsanbercode/controller/registration/registration_controller.dart';
import 'package:newsanbercode/controller/registration/verification_controller.dart';
import 'package:newsanbercode/widgets/confirmation_button.dart';
import 'package:newsanbercode/widgets/container_form.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cVer = Get.put(VerificationController());
    final cReg = Get.find<RegistrationController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: SafeArea(
        child: Obx(
          () => LoadingOverlay(
            isLoading: cVer.isLoading.value,
            child: SingleChildScrollView(
              child: ContainerForm(
                formKey: FormKey.verifyFormKey,
                formTitle: "2. Verify",
                formSubtitle: "your account",
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 342,
                    child: Text(
                      "We have sent verification link to your email account!",
                      style: kFontDefault.copyWith(
                          fontSize: 16, overflow: TextOverflow.visible),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    width: 342,
                    child: Column(
                      children: [
                        Text(
                          "please wait: 04:59",
                          style: kFontDefault.copyWith(fontSize: 13),
                        ),
                        Text(
                          "to resend verification link",
                          style: kFontDefault.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  ConfirmationButton(
                    onPressed: () => cVer.send.sendVerificationEmail(),
                    buttonName: "Resend Verification Link",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
