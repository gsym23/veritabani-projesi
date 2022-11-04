import 'package:flutter/material.dart';
import 'package:bilgiyagmuru/utils/custom_input_decoration.dart';

class LoginPageTextFormField extends StatelessWidget {
  const LoginPageTextFormField({super.key, required this.controller,required this.isPassword});

  final bool isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: customInputDecoration(isPassword ? "Şifre" : "Kullanıcı Adı"),
      style: const TextStyle(fontSize: 19),
    );
  }
}
