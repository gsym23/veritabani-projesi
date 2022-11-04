import 'package:bilgiyagmuru/models/user.dart';
import 'package:bilgiyagmuru/services/db_service.dart';

class FirebaseDbService implements DbService {
  @override
  Future<bool> createUserWithEmail(AppUser user) async {
    return true;
  }

  @override
  Future<bool> deleteUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<AppUser> getUser() {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser(AppUser user) {
    throw UnimplementedError();
  }
}
