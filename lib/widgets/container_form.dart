import 'package:flutter/material.dart';
import 'package:newsanbercode/const.dart';
import 'package:newsanbercode/widgets/logo_avatar.dart';

class ContainerForm extends StatelessWidget {
  const ContainerForm({
    required this.formKey,
    required this.children,
    this.formTitle,
    this.formSubtitle,
    Key? key,
  }) : super(key: key);

  final formKey;
  final List<Widget> children;
  final String? formTitle;
  final String? formSubtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      padding: EdgeInsets.only(top: 9, bottom: 20, right: 11, left: 11),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Section 1
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoAvatar(),
                SizedBox(width: 12),
                Text(
                  "SanberCode",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            // Section 2
            Container(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    formTitle == null ? "" : formTitle!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    formSubtitle == null ? "" : formSubtitle!,
                    style: kFontDefault.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                ],
              ),
            ),
            // Section 3
            Container(
              child: Column(
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
