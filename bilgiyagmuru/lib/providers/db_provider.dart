import 'package:bilgiyagmuru/models/user.dart';
import 'package:bilgiyagmuru/services/firebase_db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DbNotifier extends StateNotifier<FirebaseDbService> {
  DbNotifier() : super(FirebaseDbService());

  final FirebaseDbService dbService = FirebaseDbService();

  Future<bool> createUserWithEmail(AppUser user) async {
    var credential = await dbService.createUserWithEmail(user);

    if (credential != null) {
      await registerUser(credential, user);
    } else {}
    return true;
  }

  Future<void> registerUser(UserCredential credential, AppUser user) async {
    await dbService.registerUser(AppUser(
        id: credential.user!.uid,
        name: user.name,
        email: user.email,
        password: user.password));
  }

  Future<bool> updateUser(AppUser user) async {
    bool result = await dbService.updateUser(user);
    return result;
  }

  Future<bool> deleteUser(String userId) async {
    bool result = await dbService.deleteUser(userId);
    return result;
  }

  Future<AppUser> getUser(String userId) async {
    //Gelen veri AppUser nesnesine dönüştürülüp return edilecek
    Map<String, dynamic> result = await dbService.getUser(userId);

    return AppUser(
        id: result["id"],
        name: result["name"],
        email: result["email"],
        password: result["password"]);
  }
}

final firebaseProvider =
    StateNotifierProvider<DbNotifier, FirebaseDbService>((ref) {
  return DbNotifier();
});
