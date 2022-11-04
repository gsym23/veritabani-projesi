import 'package:flutter/material.dart';
import 'package:bilgiyagmuru/utils/customColors.dart';
import 'package:bilgiyagmuru/utils/customTextStyle.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.onClick});

  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          onClick.call();
        },
        child: Container(
          height: 60,
          width: 240,
          margin: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xff31274F)),
          child: Center(
            child: customText("Kayıt Ol", CustomColors.loginButtonTextColor),
          ),
        ),
      ),
    );
  }
}
