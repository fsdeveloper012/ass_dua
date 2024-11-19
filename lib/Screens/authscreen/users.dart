class UserModel {
  final String? id;
  final String name;
  final String phone;
  final String email;
  final String password;

  UserModel(
      {this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.password});

  tojson() {
    return {
      "name": name,
      "phone_number": phone,
      "email": email,
      "password": password,
    };
  }
}
