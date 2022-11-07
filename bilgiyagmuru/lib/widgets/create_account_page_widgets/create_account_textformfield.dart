import 'package:bilgiyagmuru/const/common_constant_variable.dart';
import 'package:flutter/material.dart';
import 'package:bilgiyagmuru/utils/custom_input_decoration.dart';

class CreateAccountPageTextFormField extends StatelessWidget {
  const CreateAccountPageTextFormField(
      {super.key,
      required this.hintText,
      required this.isPasswordField,
      required this.controller});

  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: TextFormField(
          controller: controller,
          obscureText: isPasswordField,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == "") {
              return "$hintText boş bırakılamaz";
            }
          },
          style: textFormFieldTextStyle,
          decoration: customInputDecoration(hintText)),
    );
  }
}
