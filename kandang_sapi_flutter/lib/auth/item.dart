import 'package:flutter/material.dart';

class SignUpInput {
  Icon icon;
  String hint;
  TextInputType type;
  bool hide;
  TextEditingController controller;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    this.dispose();
  }

  SignUpInput({this.icon, this.hint, this.type, this.hide = false, this.controller});
}
