import 'dart:async';

import 'package:aas/Constants/colors.dart';
import 'package:aas/Constants/const%20images.dart';
import 'package:aas/Model/forget_password_modal.dart';
import 'package:aas/Provider/forget_password_provider.dart';
import 'package:aas/Provider/forget_password_provider.dart';

import 'package:aas/Screens/BottomNavScreens/bottomnav.dart';
import 'package:aas/constants/pop-up.dart';

import 'package:aas/constants/reusable_widgets.dart';
import 'package:aas/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final auth = FirebaseAuth.instance;

  // final auth = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  bool showError = false;

  bool showProgress = false;
  double sizedBoxHeight = 450;
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = context.screenHeight;
    final double screenWidth = context.screenWidth;

    return GetBuilder(
      builder: (AuthController cont) {
        return Form(
          key: _formKey,
          child: Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: showProgress,
              opacity: 0.5,
              color: Colors.grey,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/bg.png',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                                child: Image.asset("assets/images/logos.jpg")),
                          )),
                          Positioned(
                            top: 150,
                            left: MediaQuery.of(context).size.width * 0.05,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: context.screenWidth * .9,
                                  height: sizedBoxHeight / 1.5,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomLeft: Radius.circular(30))),
                                    elevation: 10,
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 40.0),
                                        child: Column(
                                          children: [
                                            10.heightBox,
                                            "Forget Password"
                                                .text
                                                .bold
                                                .size(27)
                                                .color(
                                                  Color.fromRGBO(
                                                      20, 77, 70, 1.0),
                                                )
                                                .make(),
                                            15.heightBox,
                                            // Padding(
                                            //   padding: const EdgeInsets.symmetric(
                                            //       horizontal: 20),
                                            //   child: TextFormField(
                                            //     controller:
                                            //         cont.signup_namecontroller,
                                            //     decoration: InputDecoration(
                                            //       focusedErrorBorder:
                                            //           OutlineInputBorder(
                                            //         borderRadius:
                                            //             BorderRadius.circular(8),
                                            //       ),
                                            //       errorBorder: OutlineInputBorder(
                                            //         borderSide: BorderSide(
                                            //             color: Colors.red),
                                            //         borderRadius:
                                            //             BorderRadius.circular(8),
                                            //       ),
                                            //       contentPadding:
                                            //           EdgeInsets.all(0.13),
                                            //       focusedBorder:
                                            //           OutlineInputBorder(
                                            //         borderRadius:
                                            //             BorderRadius.circular(8),
                                            //         borderSide: BorderSide(
                                            //           color: primaryColor,
                                            //           width: 1.0,
                                            //         ),
                                            //       ),
                                            //       prefixIcon: Icon(
                                            // Icons.person,
                                            // size: 20,
                                            // color: primaryColor,
                                            //       ),
                                            //       hintText: "Enter Your Name",
                                            //       hintStyle: TextStyle(
                                            //         color: showError
                                            //             ? Colors.red
                                            //             : Colors.black,
                                            //       ),
                                            //       border: OutlineInputBorder(
                                            //         borderRadius:
                                            //             BorderRadius.circular(8),
                                            //       ),
                                            //     ),
                                            //     validator: (value) {
                                            //       if (value == null ||
                                            //           value.isEmpty) {
                                            //         showError = true;

                                            //         return 'Name is required';
                                            //       }
                                            //       return null;
                                            //     },
                                            //   ),
                                            // ),

                                            10.heightBox,
                                            CustomTextField(
                                              hint: 'Enter your Email',
                                              textEditingController:
                                                  emailController,
                                              textInputType:
                                                  TextInputType.emailAddress,
                                              prefixIcon: Icon(
                                                Icons.email_outlined,
                                                size: 20,
                                                color: primaryColor,
                                              ),
                                              validatorMessage:
                                                  'Please Enter Email',
                                            ),
                                            15.heightBox,

                                            10.heightBox,
                                            forgetPassword(cont, context),
                                            SizedBox(
                                              height:
                                                  context.screenHeight * .02,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: context.screenHeight * .10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  forgetPassword(AuthController cont, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 45,
        width: 180,
        child: ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              fogetPassword();
            } else {
              setState(() {
                showError = true;

                showProgress = false;
              });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: "Next".text.bold.size(20).make(),
        ),
      ),
    );
  }
  // nextButton(bool showError) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         showProgress = true;
  //       });

  //       if (_formKey.currentState!.validate()) {
  //         firebaseauth
  //             .sendPasswordResetEmail(
  //                 email: auth.forgotpassword.text.toString())
  //             .then((value) {
  //           CustomSnackbar.successful(message: "Please check your email");

  //           setState(() {
  //             showProgress = false;
  //           });

  //           auth.forgotpassword.clear();

  //           Get.to(() => LoginScreen());
  //         }).onError((error, stackTrace) {
  //           setState(() {
  //             showProgress = false;
  //           });
  //           print(error.toString());
  //         });
  //       } else {
  //         setState(() {
  //           showError = false;
  //         });
  //       }
  //     },
  //     child: CustomButton(
  //       text: 'Next',
  //     ),
  //   );
  // }
  // fogetPassword() {
  //   // setState(() {
  //   //   showProgress = true;
  //   // });
  //   auth
  //       .sendPasswordResetEmail(email: emailController.text.toString())
  //       .then((value) {
  //     ;
  //     emailController.clear();

  //     setState(() {
  //       showProgress = false;
  //     });
  //     Get.to(LoginScreen());
  //   }).onError((error, stackTrace) {
  //     setState(() {
  //       showProgress = false;
  //     });
  //     CustomSnackbar.error(message: error.toString());
  //   });
  // }
  fogetPassword() {
    final forgetPasswordProvider =
        Provider.of<ForgetPasswordProvider>(context, listen: false);
    final forgetP = ForgetPasswordModal(email: emailController.text.toString());
    forgetPasswordProvider.forgetPassword(forgetP);
  }
}
