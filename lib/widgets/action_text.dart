import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/const.dart';

class ActionText extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String destination;
  final int? isOff;

  const ActionText({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.destination,
    this.isOff,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 37, bottom: 5),
      child: SizedBox(
        width: double.infinity,
        child: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: text1,
              style: kFontDefault.copyWith(fontSize: 12, color: Colors.black),
            ),
            TextSpan(
                text: text2,
                style: kFontDefault.copyWith(
                    fontSize: 12, color: Colors.blueAccent),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => isOff != null
                      ? Get.offNamed(destination)
                      : Get.toNamed(destination)),
            TextSpan(
              text: text3,
              style: kFontDefault.copyWith(fontSize: 12, color: Colors.black),
            ),
          ]),
        ),
      ),
    );
  }
}
