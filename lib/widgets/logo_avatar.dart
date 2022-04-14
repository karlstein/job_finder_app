import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogoAvatar extends StatelessWidget {
  const LogoAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text(
        "Lo\ngo",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      radius: 25,
      backgroundColor: Colors.grey,
    );
  }
}
