import 'package:bilgiyagmuru/models/user.dart';
import 'package:bilgiyagmuru/services/db_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseDbService implements DbService {
  //email ve şifre ile yeni hesap oluşturma
  @override
  Future<UserCredential?> createUserWithEmail(AppUser user) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.email,
      );
      
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint(e.toString());
      } else if (e.code == 'email-already-in-use') {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<bool> deleteUser(String userId) {
    throw UnimplementedError();
  }

  Future<void> registerUser(AppUser user) async{
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add(user.toMap());

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
