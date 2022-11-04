import 'package:bilgiyagmuru/models/user.dart';

abstract class DbService{
  Future<bool> createUserWithEmail(AppUser user);
  Future<bool> updateUser();
  Future<bool> getUser();
  Future<bool> deleteUser();
  
}