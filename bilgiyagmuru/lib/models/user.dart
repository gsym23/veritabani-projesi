class AppUser {
  final String id;
  final String name;
  final String email;
  final String password;

  AppUser(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  AppUser.fromMap(Map<String, dynamic> userMap)
      : id = userMap["id"],
        name = userMap["name"],
        email = userMap["email"],
        password = userMap["password"];

  Map toMap() {
    return {"id": id, "name": name, "email": email, "password": password};
  }
}
