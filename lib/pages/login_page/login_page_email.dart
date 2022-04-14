import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/login_controller.dart';
import 'package:newsanbercode/routing/routes_named.dart';
import 'package:newsanbercode/widgets/action_text.dart';
import 'package:newsanbercode/widgets/confirmation_button.dart';
import 'package:newsanbercode/widgets/container_form.dart';

class LoginPageEmail extends StatelessWidget {
  const LoginPageEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SafeArea(
        child: Obx(
          () => LoadingOverlay(
            isLoading: c.isLoading.value,
            child: SingleChildScrollView(
              child: ContainerForm(
                formKey: c.emailFormKey.value,
                formTitle: "Sign In",
                formSubtitle: "to Continue",
                children: [
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      validator: (value) => c.logFormValidator(value, c.email),
                      decoration: kFormFieldDecor.copyWith(hintText: "Email"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConfirmationButton(
                    onPressed: () async => await c.authFirebase
                        .loginNext(c.emailFormKey, c.isLoading, c.email),
                    buttonName: "Next",
                  ),
                  ActionText(
                    text1: "Or ",
                    text2: "Register",
                    text3: " if you don't have an account",
                    destination: RoutesName.registration_page,
                    isOff: 1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
