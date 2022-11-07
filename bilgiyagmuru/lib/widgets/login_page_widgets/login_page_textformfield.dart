import 'package:bilgiyagmuru/const/common_constant_variable.dart';
import 'package:flutter/material.dart';
import 'package:bilgiyagmuru/utils/custom_input_decoration.dart';

class LoginPageTextFormField extends StatelessWidget {
  const LoginPageTextFormField(
      {super.key, required this.controller, required this.isPassword});

  final bool isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != "") {
          return null;
        }
        return isPassword
            ? "Lütfen şifrenizi giriniz"
            : "Lütfen E-mailinizi giriniz";
      },
      decoration: customInputDecoration(isPassword ? "Şifre" : "E-mail"),
      style: textFormFieldTextStyle,
    );
  }
}
