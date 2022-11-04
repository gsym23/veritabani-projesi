import 'package:bilgiyagmuru/models/user.dart';

abstract class DbService{
  Future<bool> createUserWithEmail(AppUser user);
  Future<bool> updateUser(AppUser user);
  Future<AppUser> getUser();
  Future<bool> deleteUser(String userId);
  
}