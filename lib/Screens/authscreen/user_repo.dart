import 'package:aas/Screens/authscreen/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    print('this is username ${user.name}');
    print('this is email ${user.email}');
    print('this is phone ${user.phone}');
    print('this is password ${user.password}');
    try {
      await _db.collection("Users").add(user.tojson());

      // Return a successful result.
      return;
    } catch (error, stackTrace) {
      // Handle the error and return an error message or throw an exception if needed.
      print(error.toString());

      // You can return an error message like this:
      throw "Failed to create user: $error";

      // Or, you can throw an exception:
      // throw Exception("Failed to create user: $error");
    }
  }
}
