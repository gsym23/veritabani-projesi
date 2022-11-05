import 'package:bilgiyagmuru/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class DbService {
  Future<UserCredential?> createUserWithEmail(AppUser user);
  Future<bool> updateUser(AppUser user);
  Future<Map<String, dynamic>> getUser(String userId);
  Future<bool> deleteUser(String userId);
}
