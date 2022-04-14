import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/globalkey/globalkey_formstate.dart';
import 'package:newsanbercode/controller/login/login_controller.dart';
import 'package:newsanbercode/routing/routes_named.dart';
import 'package:newsanbercode/widgets/action_text.dart';
import 'package:newsanbercode/widgets/confirmation_button.dart';
import 'package:newsanbercode/widgets/container_form.dart';

class LoginPagePassword extends StatelessWidget {
  const LoginPagePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<LoginController>();
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
                formKey: FormKey.passwordFormKey,
                formTitle: "Sign In",
                formSubtitle: "to Continue",
                children: [
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      obscureText: c.obscureText.value,
                      validator: (value) =>
                          c.logFormValidator(value, c.password),
                      decoration: kFormFieldDecor.copyWith(
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () => c.changeVisibility(),
                              icon: c.obscureText.value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConfirmationButton(
                    onPressed: () => c.authFirebase
                        .loginSubmit(c.isLoading, c.email, c.password),
                    buttonName: "Sign In",
                  ),
                  ActionText(
                    text1: "Forgot your password? ",
                    text2: "Click Here",
                    text3: "",
                    destination: RoutesName.login_page_password,
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
