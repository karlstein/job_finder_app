import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({
    required this.onPressed,
    required this.buttonName,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: 342,
      child: TextButton(
        child: Text(
          buttonName,
          style: TextStyle(
              color: Color(0xFFE0DADA),
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF5E5CE4)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
