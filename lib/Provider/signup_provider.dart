import 'package:aas/Model/signup_modal.dart';
import 'package:flutter/material.dart';

import '../Services/services.dart';

class UserProvider extends ChangeNotifier {
  final ApiService apiService;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UserProvider({required this.apiService});

  void registerUser(User user) async {
    try {
      await apiService.registerUserApiService(
        phoneno: user.phoneno,
        email: user.email,
        fname: user.fname,
        password: user.password,
        password_confirmation: user.password_confirmation,
        phoneController: phoneController,
        emailController: emailController,
        nameController: nameController,
        passwordController: passwordController,
        confirmPasswordController: confirmPasswordController,
      );
    } catch (error) {
      print('Error: $error');
    }
  }
}
