import 'package:bilgiyagmuru/models/user.dart';
import 'package:bilgiyagmuru/services/firebase_db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DbNotifier extends StateNotifier<FirebaseDbService> {
  DbNotifier() : super(FirebaseDbService());

  final FirebaseDbService dbService = FirebaseDbService();

  Future<bool> createUserWithEmail(AppUser user) async {
    bool result = await dbService.createUserWithEmail(user);
    return result;
  }

  Future<bool> updateUser(AppUser user) async {
    bool result = await dbService.updateUser(user);
    return result;
  }

  Future<bool> deleteUser(String userId) async {
    bool result = await dbService.deleteUser(userId);
    return result;
  }

  Future<AppUser> getUser() async {

    //Gelen veri AppUser nesnesine dönüştürülüp return edilecek
    var result = await dbService.getUser();
    return result;
  }
}
