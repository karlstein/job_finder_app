import 'package:flutter/material.dart';
import 'package:newsanbercode/const.dart';

class AccountBar extends StatelessWidget {
  AccountBar(
      {required this.leading,
      required this.title,
      required this.trailing,
      this.onPressed,
      Key? key})
      : super(key: key);

  final IconData leading;
  final String title;
  final IconData trailing;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      height: 41,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Color(0xFFC4C4C4),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Icon(
              leading,
              size: 30,
            ),
          ),
          Container(
            width: 270,
            margin: EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: kFontDefault.copyWith(fontSize: 14),
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                trailing,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
