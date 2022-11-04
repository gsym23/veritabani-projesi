import 'package:flutter/material.dart';
import 'package:bilgiyagmuru/const/login_page_constant_variable.dart';
import 'package:bilgiyagmuru/screens/create_account_page.dart';
import 'package:bilgiyagmuru/utils/customTextStyle.dart';
import 'package:bilgiyagmuru/widgets/login_page_widgets/login_page_button.dart';
import 'package:bilgiyagmuru/widgets/login_page_widgets/login_page_textformfield.dart';
import 'package:bilgiyagmuru/widgets/login_page_widgets/sign_in_button.dart';
import 'package:bilgiyagmuru/widgets/common_widgets/image_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appBody(),
    );
  }

  appBody() {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageContainer(
                  imagePath: topImage, height: constraints.maxHeight),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(),
                    customSizedBox(),
                    LoginPageTextFormField(
                      isPassword: false,
                      controller: usernameController,
                    ),
                    customSizedBox(),
                    LoginPageTextFormField(
                      isPassword: true,
                      controller: passwordController,
                    ),
                    customSizedBox(),
                    customSizedBox(),
                    const SignInButton(),
                    customSizedBox(),
                    LoginPageButton(
                      title: createAccountButtonTittle,
                      onClick: () {
                        goCreateAccountPage();
                      },
                    ),
                    customSizedBox(),
                    LoginPageButton(
                      title: forgotPasswordButtonTittle,
                      onClick: () {
                        goForgotPasswordPage();
                      },
                    ),
                    customSizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Text titleText() {
    return const Text(
      "Merhaba, \nHoşgeldin",
      style: CustomTextStyle.titleTextStyle,
    );
  }

  Widget customSizedBox() => const SizedBox(
        height: 20,
      );

  goCreateAccountPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CreateAccountPage()));
  }

  goForgotPasswordPage() {
    //şifremi unuttum sayfasına yönlendirilecek
  }
}
