import 'package:aas/Model/forget_password_modal.dart';
import 'package:aas/Services/services.dart';
import 'package:flutter/material.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  final ApiService apiService;
  ForgetPasswordProvider({required this.apiService});

  void forgetPassword(ForgetPasswordModal forgetPassword) async {
    try {
      await apiService.forgetPasswordApiService(email: forgetPassword.email);
    } catch (error) {}
  }
}
