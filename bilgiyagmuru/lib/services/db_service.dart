import 'package:bilgiyagmuru/models/user.dart';


abstract class DbService {
  Future<bool> createUserWithEmail(AppUser user);
  Future<bool> updateUser(AppUser user);
  Future<Map<String, dynamic>> getUser(String userId);
  Future<bool> deleteUser(String userId);
}
