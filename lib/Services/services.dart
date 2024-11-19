import 'dart:convert';

import 'package:aas/Provider/otp_provider.dart';
import 'package:aas/Screens/BottomNavScreens/bottomnav.dart';
import 'package:aas/Screens/authscreen/login_screen.dart';
import 'package:aas/Screens/authscreen/otp_screen.dart';
import 'package:aas/Services/loading_services.dart';
import 'package:aas/constants/pop-up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<void> registerUserApiService({
    required String phoneno,
    required String email,
    required String fname,
    required String password,
    required String password_confirmation,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) async {
    String baseUrl = 'https://aasonline.co';
    InitLoading().showLoading('Loading....');
    String successfulMsg =
        '{"msg": "You have been successfully registered check your email"}';

    final Map<String, dynamic> data = {
      'phoneno': phoneno,
      'email': email,
      'fname': fname,
      'password': password,
      'password_confirmation': password_confirmation,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/api/signup'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // print('User registered successfully!');
      Map<String, dynamic> responseJson = json.decode(successfulMsg);
      String message = responseJson['msg'];
      CustomSnackbar.successful(message: message);
      InitLoading().dismissLoading();

      Get.to(LoginScreen());
      phoneController.clear();
      emailController.clear();
      nameController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
    } else if (response.statusCode == 400) {
      InitLoading().dismissLoading();
      final dynamic errorData = json.decode(response.body);
      if (errorData.containsKey("error") &&
          errorData["error"].containsKey("phoneno") &&
          errorData["error"]["phoneno"].isNotEmpty) {
        String phoneError = errorData["error"]["phoneno"][0];
        print('401 code error for phoneno is: $phoneError');
        // Display the error message as needed (e.g., show in a Snackbar or an AlertDialog)
        CustomSnackbar.error(message: phoneError);
      } else if (errorData.containsKey("error") &&
          errorData["error"].containsKey("email") &&
          errorData["error"]["email"].isNotEmpty) {
        InitLoading().dismissLoading();
        String emailError = errorData["error"]["email"][0];
        // print('401 code error for phoneno is: $emailError');
        CustomSnackbar.error(message: emailError);
      } else {
        InitLoading().dismissLoading();
        throw Exception('Failed to register user');
      }
    }
  }

  Future<void> userVerifyApiService({
    required String email,
    required String otp,
  }) async {
    String baseUrl = 'https://aasonline.co';
    InitLoading().showLoading('Loading....');
    String successfulMsg = '{"msg": "User Verified Successfully."}';

    final Map<String, dynamic> data = {
      'email': email,
      'pin': otp,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/api/verify-pin'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = json.decode(successfulMsg);
      String message = responseJson['msg'];
      await CustomSnackbar.successful(message: message);
      InitLoading().dismissLoading();

      Get.to(BottomNavScreen());
    } else if (response.statusCode == 400) {
      InitLoading().dismissLoading();
      final dynamic errorData = json.decode(response.body)["msg"];

      CustomSnackbar.error(message: errorData);
    } else {
      InitLoading().dismissLoading();
      CustomSnackbar.error(message: 'Something went wrong Please try again!.');
      throw Exception('Failed to register user');
    }
  }

  Future<void> forgetPasswordApiService({
    required String email,
  }) async {
    String baseUrl = 'https://aasonline.co';
    InitLoading().showLoading('Loading....');
    String successMsg = 'Check your email for your password.';

    final Map<String, dynamic> data = {
      'email': email,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/api/forgot-password'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = json.decode(successMsg);
      String message = responseJson['msg'];
      await CustomSnackbar.successful(message: message);
      InitLoading().dismissLoading();
      Get.to(LoginScreen());
    } else if (response.statusCode == 404) {
      InitLoading().dismissLoading();
      final dynamic errorData = json.decode(response.body)["error"];
      CustomSnackbar.error(message: errorData);
    } else if (response.statusCode == 400) {
      InitLoading().dismissLoading();
      final dynamic errorData = json.decode(response.body);
      String errorMSg = errorData["error"]["email"][0];
      // print('line number 151: ${errorData["error"]["email"][0]}');
      CustomSnackbar.error(message: errorMSg);
    } else {
      InitLoading().dismissLoading();
      CustomSnackbar.error(message: 'Something went wrong Please try again!.');
      throw Exception('Failed to register user');
    }
  }

  Future<void> loginUserService({
    required String phoneno,
    required String password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String baseUrl = 'https://aasonline.co';
    InitLoading().showLoading('Loading....');
    // String successMsg = 'Login Successfully.';

    final Map<String, dynamic> data = {
      'phoneno': phoneno,
      'password': password,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      InitLoading().dismissLoading();

      String successMsg = response.body;

      try {
        Map<String, dynamic> responseJson = json.decode(successMsg);

        if (responseJson.containsKey('token')) {
          String message = responseJson['token'];
          await prefs.setString('sessionToken', message);
          Get.to(BottomNavScreen());
        } else {
          print('Token not found in JSON response');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else if (response.statusCode == 400) {
      print(response.statusCode);

      final dynamic errorData = json.decode(response.body);
      String errorMSg = errorData["failed"];
      InitLoading().dismissLoading();

      CustomSnackbar.error(message: errorMSg);
    } else if (response.statusCode == 401) {
      print(response.statusCode);
      InitLoading().dismissLoading();
      Get.to(OtpScreen(email: phoneno));
    } else if (response.statusCode == 404) {
      final msg = json.decode(response.body)["msg"];
      InitLoading().dismissLoading();
      CustomSnackbar.error(message: msg);
    } else {
      print('this is status code: ${response.statusCode}');
      InitLoading().dismissLoading();
      CustomSnackbar.error(message: 'Something went wrong Please try again!.');

      throw Exception('Failed to register user');
    }
  }

  Future<void> resendOtpApiService({
    required String email,
  }) async {
    String baseUrl = 'https://aasonline.co';
    InitLoading().showLoading('Loading....');

    final Map<String, dynamic> data = {
      'email': email.toString(),
    };

    final response = await http.post(
      Uri.parse('$baseUrl/api/resend-pin'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
