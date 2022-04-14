import 'package:flutter/material.dart';

abstract class FormKey {
  static final mainFormKey = GlobalKey<FormState>();
  static final verifyFormKey = GlobalKey<FormState>();
  static final profileFormKey = GlobalKey<FormState>();
  static final skillFormKey = GlobalKey<FormState>();
  static final modalFormKey = GlobalKey<FormState>();
}
