class AppUser {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String password;

  AppUser(
      {required this.id,
      required this.name,
      required this.surname,
      required this.email,
      required this.password});

  AppUser.fromMap(Map<String, dynamic> userMap)
      : id = userMap["id"],
        name = userMap["name"],
        surname = userMap["surname"],
        email = userMap["email"],
        password = userMap["password"];

  Map toMap() {
    return {
      "id": id,
      "name": name,
      "surname": surname,
      "email": email,
      "password": password
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'AppUser(id: $id, name: $name, surname: $surname ,email: $email)';
  }
}
