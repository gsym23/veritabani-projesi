import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const/home_page_constant.dart';
import '../models/user.dart';
import '../providers/db_provider.dart';
import 'login_page.dart';

class SettingsPage extends ConsumerWidget {
  SettingsPage({super.key, required this.user});

  AppUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ayarlar",
            style: appBarTitleTextStyle,
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(164, 140, 178, 1),
        ),
        body: buildBody(ref));
  }

  buildBody(WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: Column(
          children: [
            Image.asset("assets/images/user_icon_black.png"),
            SizedBox(
              height: constraints.maxHeight / 10,
            ),
            Text(
              "${user.name} ${user.surname}",
              style: appBarTitleTextStyle,
            ),
            SizedBox(
              height: constraints.maxHeight / 15,
            ),
            Text(
              user.email,
              style: appBarTitleTextStyle,
            ),
            SizedBox(
              height: constraints.maxHeight / 15,
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  await ref.read(firebaseProvider).signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                icon: const Icon(Icons.exit_to_app),
                label: const Text("Çıkış yap"))
          ],
        ),
      );
    });
  }
}
