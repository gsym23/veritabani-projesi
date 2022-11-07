import 'package:flutter/material.dart';

class LoginPageButton extends StatelessWidget {
  const LoginPageButton({super.key, required this.title, required this.onClick});

  final String title;
  final Function onClick;



  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          onClick.call();
        },
        child: Text(title,
            style: const TextStyle(fontSize: 19, color: Color(0xFFffff00), fontFamily: "YanoneKaffeesatz", fontWeight: FontWeight.w200)),
      ),
    );
  }
}
