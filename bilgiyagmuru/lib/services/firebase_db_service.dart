import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/category.dart';
import '../models/user.dart';
import 'db_service.dart';

class FirebaseDbService implements DbService {
  //email ve şifre ile yeni hesap oluşturma

  // void setup() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json/interestingInformation.json');
  //   final data = await json.decode(response);

  //   for (int i = 0; i < 8; i++) {
  //     for (int j = 0; j < data["$i"].length; j++) {
  //       await FirebaseFirestore.instance
  //           .collection("interestingInformations")
  //           .doc("$i")
  //           .collection("$i")
  //           .doc("$j")
  //           .set({"bilgi" : data["$i"]["$j"]});
  //     }
  //   }

  //   // final doc =
  //   //       await FirebaseFirestore.instance.collection("users").doc().set();
  // }

  @override
  Future<bool> createUserWithEmail(AppUser user) async {
    try {
      EasyLoading.show();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      var uid = credential.user!.uid;
      var newUser = AppUser(
          id: uid,
          name: user.name,
          surname: user.surname,
          email: user.email,
          password: user.password);
      await registerUser(newUser);
      EasyLoading.showSuccess("Kayıt başarılı !");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.showError("Lütfen daha güçlü parola giriniz");
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showError("Bu email zaten kullanımda");
      } else if (e.code == "invalid-email") {
        EasyLoading.showError("Geçersiz email");
      }
    } catch (e) {
      EasyLoading.showError(
          "Bir sorun oluştu. Lütfen bağlantınızı kontrol edin.");
    }
    return false;
  }

  Future<void> signOut() async {

    var currentUser = FirebaseAuth.instance.currentUser;
    EasyLoading.show();
    if(currentUser != null){
      await FirebaseAuth.instance.signOut();
      EasyLoading.dismiss();
    }
  }

  @override
  Future<AppUser?> loginUserWithEmail(String email, String password) async {
    try {
      EasyLoading.show();
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var uid = credential.user!.uid;

      final doc =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();

      await EasyLoading.showSuccess("Giriş başarılı");
      final data = doc.data() as Map<String, dynamic>;
      return AppUser(
          id: data["id"],
          name: data["name"],
          surname: data["surname"],
          email: email,
          password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.showError("Kullanıcı Bulunamadı");
      } else if (e.code == 'invalid-email') {
        EasyLoading.showError("Geçersiz e-mail");
      } else if (e.code == "wrong-password") {
        EasyLoading.showError("Kullanıcı adı veya parola yanlış");
      }
    }
    return null;
  }

  @override
  Future<bool> deleteUser(String userId) {
    throw UnimplementedError();
  }

  Future<void> registerUser(AppUser user) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.doc(user.id).set(user.toMap());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser(AppUser user) {
    throw UnimplementedError();
  }

  Future<String> getInterestingInformation(Category category) async {
    try {
      final informations = await FirebaseFirestore.instance
          .collection('interestingInformations')
          .doc("${category.categoryId}")
          .collection("${category.categoryId}")
          .doc("${Random().nextInt(6)}")
          .get();

      var result = informations.data() as Map<String, dynamic>;

      String information = result["bilgi"];

      return information;
    } catch (e) {
      debugPrint(e.toString());
    }
    return "";
  }
}
