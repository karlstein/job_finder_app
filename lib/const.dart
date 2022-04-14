import 'package:flutter/material.dart';

const kFontDefault = TextStyle(
  fontWeight: FontWeight.w500,
);

const kFontRegular = TextStyle(
  fontWeight: FontWeight.w400,
);

const kFontLight = TextStyle(
  fontWeight: FontWeight.w300,
);

const kFormFieldDecor = InputDecoration(
  hintText: "",
  hintStyle: TextStyle(
    fontSize: 12,
    color: Color(0xFF595454),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFBFB7B7), width: 1),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);
