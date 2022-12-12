import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category.dart';
import '../models/user.dart';
import '../services/firebase_db_service.dart';

class DbNotifier extends StateNotifier<FirebaseDbService> {
  DbNotifier() : super(FirebaseDbService());

  final FirebaseDbService dbService = FirebaseDbService();

  Future<bool> createUserWithEmail(AppUser user) async {
    var result = await dbService.createUserWithEmail(user);
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

  Future<AppUser?> loginUserWithEmail(String email, String password) async {
    var result = await dbService.loginUserWithEmail(email, password);
    return result;
  }

  Future<AppUser> getUser(String userId) async {
    //Gelen veri AppUser nesnesine dönüştürülüp return edilecek
    Map<String, dynamic> result = await dbService.getUser(userId);

    return AppUser(
        id: result[0]["id"] as String,
        name: result[0]["name"] as String,
        surname: result[0]["surname"] as String,
        email: result[0]["email"] as String,
        password: result[0]["password"] as String);
  }

  Future<String> getInterestingInformation(Category category) async {
    var interestingInfo = await dbService.getInterestingInformation(category);
    return interestingInfo;
  }

  Future<void> signOut() async {
    await dbService.signOut();
  }

  // void setup(){
  //   dbService.setup();
  // }
}

final firebaseProvider =
    StateNotifierProvider<DbNotifier, FirebaseDbService>((ref) {
  return DbNotifier();
});
