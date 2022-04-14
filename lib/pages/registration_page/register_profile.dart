import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/controller/globalkey_formstate.dart';
import 'package:newsanbercode/controller/registration/registration_controller.dart';
import 'package:newsanbercode/routing/routes_named.dart';
import 'package:newsanbercode/widgets/confirmation_button.dart';
import 'package:newsanbercode/widgets/container_form.dart';

class RegisterProfile extends StatelessWidget {
  const RegisterProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(RegistrationController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Sign In"),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed(RoutesName.login_page_email);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => LoadingOverlay(
            isLoading: c.isLoading.value,
            child: SingleChildScrollView(
              child: ContainerForm(
                formKey: FormKey.profileFormKey,
                formTitle: "3. Profile",
                formSubtitle: "Complete your profile",
                children: [
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      validator: (value) =>
                          c.regFormValidator(value, c.firstName),
                      decoration:
                          kFormFieldDecor.copyWith(hintText: "First Name"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      validator: (value) =>
                          c.regFormValidator(value, c.lastName),
                      decoration:
                          kFormFieldDecor.copyWith(hintText: "Last Name"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      validator: (value) =>
                          c.regFormValidator(value, c.address1),
                      decoration:
                          kFormFieldDecor.copyWith(hintText: "Address 1"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      validator: (value) =>
                          c.regFormValidator(value, c.address2),
                      decoration:
                          kFormFieldDecor.copyWith(hintText: "Address 2"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSearchBox: true,
                    showSelectedItems: true,
                    items: c.allCityList.value
                        .map((e) => e.search_string!)
                        .toList(),
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Region",
                      hintText: "Region",
                    ),
                    onChanged: print,
                    validator: (value) =>
                        c.regDropDownValidator(value, c.cityProvince),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      validator: (value) =>
                          c.regFormValidator(value, c.instagram),
                      decoration: kFormFieldDecor.copyWith(
                          hintText: "Instagram Account"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      validator: (value) =>
                          c.regFormValidator(value, c.linkedIn),
                      decoration: kFormFieldDecor.copyWith(
                          hintText: "LinkedIn Account"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 46,
                    width: 342,
                    child: TextFormField(
                      validator: (value) =>
                          c.regFormValidator(value, c.website),
                      decoration:
                          kFormFieldDecor.copyWith(hintText: "Your Website"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConfirmationButton(
                    onPressed: () {
                      c.firestoreCreate.createProfile();
                    },
                    buttonName: "Next",
                  ),
                  SizedBox(
                    height: 30,
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
