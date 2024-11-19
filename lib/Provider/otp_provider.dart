import 'package:aas/Model/otp_modal.dart';
import 'package:aas/Model/signup_modal.dart';
import 'package:flutter/material.dart';

import '../Services/services.dart';

class OtpCodeProvider extends ChangeNotifier {
  final ApiService apiService;

  OtpCodeProvider({required this.apiService});

  void verifyUser(Otp otp) async {
    try {
      await apiService.userVerifyApiService(
        email: otp.email,
        otp: otp.otp,
      );
    } catch (error) {}
  }
}
