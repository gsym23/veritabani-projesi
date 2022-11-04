import 'package:bilgiyagmuru/models/user.dart';
import 'package:bilgiyagmuru/services/db_service.dart';



class FirebaseDbService implements DbService {
  @override
  Future<bool> createUserWithEmail(AppUser user) async{
    return true;
  }

  @override
  Future<bool> deleteUser(String userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<bool> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser(AppUser user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
