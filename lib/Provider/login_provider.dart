import 'package:aas/Model/login_modal.dart';
import 'package:aas/Services/services.dart';
import 'package:aas/constants/pop-up.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final ApiService apiService;
  LoginProvider({required this.apiService});
  void loginUser(LoginModal loginModal) async {
    try {
      await apiService.loginUserService(
          phoneno: loginModal.phoneno, password: loginModal.password);
    } catch (error) {
      // print('from login provider');
      print('Error: $error');
      // CustomSnackbar.error(message: '$error');
    }
  }
}
