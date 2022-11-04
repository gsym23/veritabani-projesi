import 'package:flutter/material.dart';
import 'package:bilgiyagmuru/const/create_account_page_constant_variable.dart';
import 'package:bilgiyagmuru/const/login_page_constant_variable.dart';
import 'package:bilgiyagmuru/utils/customTextStyle.dart';
import 'package:bilgiyagmuru/widgets/create_account_page_widgets/create_account_textformfield.dart';
import 'package:bilgiyagmuru/widgets/create_account_page_widgets/register_button.dart';
import 'package:bilgiyagmuru/widgets/common_widgets/image_container.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late final TextEditingController nameController;
  late final TextEditingController surnameController;
  late final TextEditingController mailController;
  late final TextEditingController passwordController;

  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    mailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    surnameController.dispose();
    mailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: appBody(),
    );
  }

  appBody() {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customSizedBox(constraints.maxHeight / 20),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 35,
                  ),
                  titleText(),
                ],
              ),
              customSizedBox(constraints.maxHeight / 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CreateAccountPageTextFormField(
                          hintText: nameHintText,
                          isPasswordField: false,
                          controller: nameController,
                        ),
                        CreateAccountPageTextFormField(
                          hintText: surnameHintText,
                          isPasswordField: false,
                          controller: surnameController,
                        ),
                        CreateAccountPageTextFormField(
                          hintText: emailHintText,
                          isPasswordField: false,
                          controller: mailController,
                        ),
                        CreateAccountPageTextFormField(
                          hintText: passwordHintText,
                          isPasswordField: true,
                          controller: passwordController,
                        ),
                      ],
                    )),
              ),
              RegisterButton(
                onClick: () {
                  createAccount();
                },
              ),
            ],
          ),
          const Spacer(),
          ImageContainer(
            height: constraints.maxHeight,
            imagePath: topImage1,
          ),
        ],
      );
    });
  }

  Text titleText() {
    return const Text(
      "Hesap Oluştur",
      style: CustomTextStyle.titleTextStyle,
    );
  }

  Container topImageContainer(double height, String topImage) {
    return Container(
      height: height * .40,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(topImage),
        ),
      ),
    );
  }

  Widget customSizedBox(double height) => SizedBox(
        height: height,
      );

  Widget customText(String text, Color color) => Text(
        text,
        style:
            TextStyle(color: color, fontSize: 21, fontWeight: FontWeight.bold),
      );

  void createAccount() {
    if(formKey.currentState!.validate()){
      
    }
  }
}
