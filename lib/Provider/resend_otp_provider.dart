import 'package:aas/Model/resend_otp_modal.dart';
import 'package:aas/Services/services.dart';
import 'package:flutter/material.dart';

class ResendOtpProvider extends ChangeNotifier {
  final ApiService apiService;
  ResendOtpProvider({required this.apiService});

  void resendOtp(ResendOtpModal resendOtpModal) async {
    // await apiService.resendOtpApiService()
  }
}
