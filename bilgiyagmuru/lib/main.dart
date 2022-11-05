import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bilgiyagmuru/firebase_options.dart';
import 'package:bilgiyagmuru/utils/customColors.dart';
import 'package:bilgiyagmuru/screens/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
        ),
        home: const LoginPage());
  }
}
