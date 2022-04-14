import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/globalkey_formstate.dart';
import 'package:newsanbercode/controller/registration/registration_controller.dart';
import 'package:newsanbercode/routing/routes_named.dart';
import 'package:newsanbercode/widgets/action_text.dart';
import 'package:newsanbercode/widgets/confirmation_button.dart';
import 'package:newsanbercode/widgets/container_form.dart';

class RegistrationEmail extends StatelessWidget {
  const RegistrationEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(RegistrationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),
      body: SafeArea(
        child: Obx(
          () => LoadingOverlay(
            isLoading: c.isLoading.value,
            child: SingleChildScrollView(
              child: ContainerForm(
                formKey: FormKey.mainFormKey,
                formTitle: "1. Register",
                formSubtitle: "to Join",
                children: [
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      validator: (value) =>
                          c.regFormValidator(value, c.regEmail),
                      decoration: kFormFieldDecor.copyWith(hintText: "Email"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      obscureText: !c.obscureText1.value,
                      validator: (value) =>
                          c.regFormValidator(value, c.regPassword),
                      decoration: kFormFieldDecor.copyWith(
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                c.changeVisibility(c.obscureText1);
                              },
                              icon: !c.obscureText1.value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      obscureText: !c.obscureText2.value,
                      validator: (value) =>
                          c.regFormValidator(value, c.passwordConfirm),
                      decoration: kFormFieldDecor.copyWith(
                          hintText: "Password Confirmation",
                          suffixIcon: IconButton(
                              onPressed: () {
                                c.changeVisibility(c.obscureText2);
                              },
                              icon: !c.obscureText2.value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConfirmationButton(
                    onPressed: () => c.firestoreCreate.registerAccount(),
                    buttonName: "Next",
                  ),
                  ActionText(
                    text1: "Or ",
                    text2: "Login",
                    text3: " if you already have an account",
                    destination: RoutesName.login_page_email,
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
