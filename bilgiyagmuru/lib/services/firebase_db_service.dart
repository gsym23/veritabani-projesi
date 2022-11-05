import 'package:bilgiyagmuru/models/user.dart';
import 'package:bilgiyagmuru/services/db_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FirebaseDbService implements DbService {
  //email ve şifre ile yeni hesap oluşturma

  @override
  Future<bool> createUserWithEmail(AppUser user) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.email,
      );
      var uid = credential.user!.uid;
      var newUser = AppUser(
          id: uid, name: user.name,surname: user.surname ,email: user.email, password: user.password);
      await registerUser(newUser);
      EasyLoading.showSuccess("Kayıt başarılı !");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.showError("Lütfen daha güçlü parola giriniz");
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showError("Bu email zaten kullanımda");
      }
    } catch (e) {
      EasyLoading.showError("Bir sorun oluştu. Lütfen bağlantınızı kontrol edin.");
    }
    return false;
  }

  @override
  Future<bool> deleteUser(String userId) {
    throw UnimplementedError();
  }

  Future<void> registerUser(AppUser user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    debugPrint(user.toString());
    await users.doc(user.id).set(user.toMap());
  }

  @override
  Future<Map<String, dynamic>> getUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser(AppUser user) {
    throw UnimplementedError();
  }
}
