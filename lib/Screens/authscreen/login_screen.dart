import 'dart:convert';

import 'package:aas/Constants/colors.dart';
import 'package:aas/Constants/const%20images.dart';
import 'package:aas/Model/login_modal.dart';
import 'package:aas/Provider/login_provider.dart';
import 'package:aas/Screens/BottomNavScreens/bottomnav.dart';

import 'package:aas/Screens/authscreen/google_auth.dart';

import 'package:aas/Screens/authscreen/signup_screen.dart';
import 'package:aas/constants/pop-up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:aas/constants/reusable_widgets.dart';
import 'package:aas/constants/text_constants.dart';
import 'package:aas/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'package:velocity_x/velocity_x.dart';

import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  var verificationId = ''.obs;

  final _formKey = GlobalKey<FormState>();
  final FocusNode phoneNumberFocus = FocusNode();
  String? fullnumber;
  double sizedBoxHeight = 300;
  final _auth = Get.put(AuthController());
  bool showProgress = false;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = context.screenHeight;
    final double screenWidth = context.screenWidth;

    return GetBuilder(
      builder: (AuthController cont) {
        return Scaffold(
          body: Form(
            key: _formKey,
            child: SafeArea(
              child: Stack(
                children: [
                  Image.asset(login),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Image.asset(
                        logo,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170.h,
                    left: MediaQuery.of(context).size.width * 0.05,
                    child: Column(
                      children: [
                        SizedBox(
                          width: context.screenWidth * .9,
                          // height: 320,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            elevation: 10,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  10.heightBox,
                                  "Log In"
                                      .text
                                      .bold
                                      .size(27)
                                      .color(
                                        Color.fromRGBO(20, 77, 70, 1.0),
                                      )
                                      .make(),
                                  10.heightBox,
                                  CustomTextField(
                                    hint: 'Enter your Email / Phone No',
                                    textEditingController: emailController,
                                    textInputType: TextInputType.text,
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                    validatorMessage:
                                        'Please Enter Email / Phone No',
                                  ),
                                  10.heightBox,
                                  CustomTextField(
                                    obscureText: true,
                                    hint: 'Enter your Password',
                                    textEditingController: passwordController,
                                    textInputType: TextInputType.text,
                                    prefixIcon: Icon(
                                      Icons.lock_clock_outlined,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                    validatorMessage: 'Please Enter Password',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          child: Text(
                                            'Forget Password?',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onTap: () {
                                            Get.to(ForgetPasswordScreen());
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  20.heightBox,
                                  loginButton(cont),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account? ",
                                        style: normaltextBlackC,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Get.to(Signup());
                                          },
                                          child: Text('Sign Up',
                                              style: normaltextPrimaryC)),
                                    ],
                                  ),
                                  20.heightBox,
                                ],
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: context.screenHeight * .10,
                        // ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 530.h, // Below the card
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: Center(
                        child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Get.to(ChatScreen());
                          },
                          child: Text(
                            'or login with',
                            style: normaltextBlackC,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // facebookContainer(),
                            // SizedBox(
                            //   width: 25.0,
                            // ),
                            googleContainer(),
                          ],
                        )
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  googleContainer() {
    return GestureDetector(
      onTap: () {
        // signInWithGoogle();
        // setState(() {
        //   showProgress = true;
        // });
        Authentication.signInWithGoogle(context: context);
      },
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          color: Color(0xFFFF0000),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(height: 100, image: AssetImage('assets/images/newimg2.png')),
            Text(
              'Sign in with Google',
              style: TextStyle(
                  fontSize: 19, color: white, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 33,
            )
          ],
        ),
      ),
      // child: Image(height: 35, image: AssetImage('assets/images/google.png')),
    );
  }

  // facebookContainer() {
  //   return GestureDetector(
  //     onTap: _loginWithFacebook,
  //     child: Image(height: 35, image: AssetImage('assets/images/facebook.png')),
  //   );
  // }

  // Future<void> _loginWithFacebook() async {
  //   try {
  //     SmartDialog.showLoading(msg: "Please wait...");

  //     final LoginResult result = await FacebookAuth.instance.login();

  //     if (result.status == LoginStatus.success) {
  //       final AccessToken accessToken = result.accessToken!;
  //       print("User Access Token: " + accessToken.toJson().toString());

  //       final graphResponse = await http.get(
  //         Uri.parse(
  //             'https://graph.facebook.com/v12.0/me?fields=name,email,picture&access_token=${accessToken.token}'),
  //       );

  //       if (graphResponse.statusCode == 200) {
  //         SmartDialog.dismiss();

  //         final userData = json.decode(graphResponse.body);
  //         Get.to(BottomNavScreen());
  //         print("User Data from Facebook: $userData");
  //       } else {
  //         SmartDialog.dismiss();
  //         CustomSnackbar.error(
  //             message: 'Failed to fetch user data from Facebook');
  //         print(
  //             'Failed to fetch user data from Facebook: ${graphResponse.statusCode}');
  //       }
  //     } else {
  //       SmartDialog.dismiss();
  //       CustomSnackbar.error(message: 'Facebook login failed. Status');

  //       print('Facebook login failed. Status: ${result.status}');
  //     }
  //   } catch (e) {
  //     SmartDialog.dismiss();
  //     CustomSnackbar.error(message: 'Error during Facebook login');

  //     print('Error during Facebook login: $e');
  //   }
  //   SmartDialog.dismiss();
  // }

  loginButton(AuthController cont) {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          // Get.to(BottomNavScreen());
          loginUser();
        } else {}
      },
      child: CustomButton(
        text: 'Login',
      ),
    );
  }

  loginUser() {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final loginU = LoginModal(
        phoneno: emailController.text.trim().toString(),
        password: passwordController.text.trim().toString());
    loginProvider.loginUser(loginU);
  }

  // Future<void> signInWithPhoneNumber(String phoneNumber) async {
  //   SmartDialog.showLoading(msg: "Please wait...");

  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   Get.to(BottomNavScreen());
  //   SmartDialog.dismiss();

  //   // await auth.verifyPhoneNumber(
  //   //   phoneNumber: phoneNumber,
  //   //   verificationCompleted: (PhoneAuthCredential credential) async {
  //   //     SmartDialog.dismiss();
  //   //     await auth.signInWithCredential(credential);
  //   //     // authentication successful, do something
  //   //   },
  //   //   verificationFailed: (FirebaseAuthException e) {
  //   //     SmartDialog.dismiss();

  //   //     CustomSnackbar.error(message: '$e');
  //   //   },
  //   //   codeSent: (String verificationId, int? resendToken) async {
  //   //     SmartDialog.dismiss();

  //   //     String smsCode = '';
  //   //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //   //       verificationId: verificationId,
  //   //       smsCode: smsCode,
  //   //     );
  //   //     Get.to(OtpScreen(), arguments: [verificationId]);
  //   //     AuthController.instance.phoneNoController.clear();
  //   //     await auth.signInWithCredential(credential);
  //   //     // authentication successful, do somethijng
  //   //   },
  //   //   codeAutoRetrievalTimeout: (String verificationId) {
  //   //     SmartDialog.dismiss();
  //   //   },
  //   // );
  // }

  // void _userLogin() async {
  //   print("Loader Start line no 317");

  //   String mobile = fullnumber.toString();
  //   Get.to(() => BottomNavScreen());

  //   // if (fullnumber == null) {
  //   //   CustomSnackbar.error(message: 'Please enter the mobile number!');
  //   //   return; // Exit early if the phone number is not entered.
  //   // }

  //   try {
  //     await signInWithPhoneNumber("$mobile");

  //     // Authentication successful, you can navigate or show success message here.
  //   } catch (e) {
  //     print("Error during login: $e");
  //     CustomSnackbar.error(message: 'Login failed. Please try again.');
  //     setState(() {
  //       showProgress = false;
  //     });
  //   }
  // }
}

//  comment all phone filed functionality
// SizedBox(
//   // height: 45,
//   child: IntlPhoneField(
//     controller: cont.phoneNoController,
//     focusNode: phoneNumberFocus,
//     enabled: true,
//     autovalidateMode:
//         AutovalidateMode.onUserInteraction,
//     disableLengthCheck: false,
//     decoration: InputDecoration(
//       labelText: 'Phone Number',
//       labelStyle:
//           TextStyle(color: Color(0xFF999999)),
//       border: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.red,
//         ),
//       ),
//     ),
//     initialCountryCode: 'PK',
//     onChanged: (phone) {
//       setState(() {
//         fullnumber = phone.completeNumber;
//       });
//       print(phone.completeNumber);
//     },
//   ),
// ),
