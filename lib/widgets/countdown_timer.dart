import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsanbercode/controller/registration/verification_controller.dart';

class CountDownTimer extends AnimatedWidget {
  CountDownTimer({Key? key, this.animation})
      : super(key: key, listenable: animation!);
  Animation<int>? animation;

  @override
  Widget build(BuildContext context) {
    var c = Get.find<VerificationController>();
    Duration clockTimer = Duration(seconds: animation!.value);
    c.resendTimer.value =
        '${clockTimer.inMinutes.remainder(60)}:${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';

    return Text("please wait: ${c.resendTimer}");
  }
}
