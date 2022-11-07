import 'package:bilgiyagmuru/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:bilgiyagmuru/const/login_page_constant_variable.dart';
import 'package:bilgiyagmuru/screens/create_account_page.dart';
import 'package:bilgiyagmuru/utils/customTextStyle.dart';
import 'package:bilgiyagmuru/widgets/login_page_widgets/login_page_button.dart';
import 'package:bilgiyagmuru/widgets/login_page_widgets/login_page_textformfield.dart';
import 'package:bilgiyagmuru/widgets/login_page_widgets/sign_in_button.dart';
import 'package:bilgiyagmuru/widgets/common_widgets/image_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final TextEditingController mailController;
  late final TextEditingController passwordController;

  late final GlobalKey<FormState> globalKey;

  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    passwordController = TextEditingController();
    globalKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    mailController.dispose();
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
                imagePath: topImage,
                height: constraints.maxHeight,
                isTop: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(),
                    SizedBox(
                      height: constraints.maxHeight / 10,
                    ),
                    Form(
                      key: globalKey,
                      child: Column(
                        children: [
                          LoginPageTextFormField(
                            isPassword: false,
                            controller: mailController,
                          ),
                          SizedBox(
                            height: constraints.maxHeight / 20,
                          ),
                          LoginPageTextFormField(
                            isPassword: true,
                            controller: passwordController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight / 15,),
                    SignInButton(
                      onClick: () {
                        signIn();
                      },
                    ),
                    SizedBox(height: constraints.maxHeight / 20,),
                    LoginPageButton(
                      title: createAccountButtonTittle,
                      onClick: () {
                        goCreateAccountPage();
                      },
                    ),
                    LoginPageButton(
                      title: forgotPasswordButtonTittle,
                      onClick: () {
                        goForgotPasswordPage();
                      },
                    ),
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

  goCreateAccountPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CreateAccountPage()));
  }

  goForgotPasswordPage() {
    //şifremi unuttum sayfasına yönlendirilecek
  }

  void signIn() async {
    if (globalKey.currentState!.validate()) {
      await ref.read(firebaseProvider).loginUserWithEmail(
          mailController.text.trim(), passwordController.text.trim());
    }
  }
}
