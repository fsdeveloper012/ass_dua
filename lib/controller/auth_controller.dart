import 'package:aas/Screens/authscreen/user_repo.dart';
import 'package:aas/Screens/authscreen/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Screens/Authscreen/login_screen.dart';

class AuthController extends GetxController {
  final userRepo = Get.put(UserRepository());

  TextEditingController phoneNoController = TextEditingController();
  TextEditingController forgotpassword = TextEditingController();

  TextEditingController signup_namecontroller = TextEditingController();

  TextEditingController signup_phone = TextEditingController();

  TextEditingController signup_email = TextEditingController();

  TextEditingController signup_password = TextEditingController();

  static AuthController get instance => Get.find();

  Future<void> createUser(UserModel user) async {
    try {
      await userRepo.createUser(user);
      Get.to(LoginScreen());
    } catch (error) {
      print(error.toString());
    }
  }
}
