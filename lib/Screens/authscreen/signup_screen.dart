import 'package:aas/Model/signup_modal.dart';
import 'package:aas/Provider/signup_provider.dart';
import 'package:aas/Screens/authscreen/login_screen.dart';
import 'package:aas/Screens/authscreen/users.dart';
import 'package:aas/constants/colors.dart';
import 'package:aas/constants/pop-up.dart';
import 'package:aas/constants/reusable_widgets.dart';
import 'package:aas/constants/text_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/auth_controller.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool showError = false;
  final auth = Get.put(AuthController());
  double sizedBoxHeight = 450;
  bool showProgress = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AuthController cont) {
        return Form(
          key: _formKey,
          child: Scaffold(
            body: SafeArea(
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
                          top: 170.h,
                          left: MediaQuery.of(context).size.width * 0.05,
                          child: Column(
                            children: [
                              SizedBox(
                                width: context.screenWidth * .9,
                                height: 500,
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
                                        "Sign Up"
                                            .text
                                            .bold
                                            .size(27)
                                            .color(
                                              Color.fromRGBO(20, 77, 70, 1.0),
                                            )
                                            .make(),
                                        10.heightBox,
                                        CustomTextField(
                                          hint: 'Enter Name',
                                          textEditingController: nameController,
                                          textInputType: TextInputType.text,
                                          prefixIcon: Icon(
                                            Icons.person_outline,
                                            size: 20,
                                            color: primaryColor,
                                          ),
                                          validatorMessage: 'Please Enter Name',
                                        ),
                                        10.heightBox,
                                        CustomTextField(
                                          hint: 'Enter Email',
                                          textEditingController:
                                              emailController,
                                          textInputType: TextInputType.text,
                                          prefixIcon: Icon(
                                            Icons.email_outlined,
                                            size: 20,
                                            color: primaryColor,
                                          ),
                                          validatorMessage:
                                              'Please Enter Phone-Number',
                                        ),
                                        10.heightBox,
                                        CustomTextField(
                                          hint: 'Enter Number',
                                          textEditingController:
                                              phoneController,
                                          textInputType: TextInputType.text,
                                          prefixIcon: Icon(
                                            Icons.phone,
                                            size: 20,
                                            color: primaryColor,
                                          ),
                                          validatorMessage:
                                              'Please Enter Email',
                                        ),
                                        10.heightBox,
                                        CustomTextField(
                                          obscureText: true,
                                          hint: 'Enter Password',
                                          textEditingController:
                                              passwordController,
                                          textInputType: TextInputType.text,
                                          prefixIcon: Icon(
                                            Icons.lock_clock_outlined,
                                            size: 20,
                                            color: primaryColor,
                                          ),
                                          validatorMessage:
                                              'Please Enter Password',
                                        ),
                                        10.heightBox,
                                        CustomTextField(
                                          obscureText: true,
                                          hint: 'Enter Confirm Password',
                                          textEditingController:
                                              confirmPasswordController,
                                          textInputType: TextInputType.text,
                                          prefixIcon: Icon(
                                            Icons.lock_clock_outlined,
                                            size: 20,
                                            color: primaryColor,
                                          ),
                                          validatorMessage:
                                              'Please Confirm Password',
                                        ),
                                        10.heightBox,
                                        signUpButton(cont, context),
                                        SizedBox(
                                          height: context.screenHeight * .02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Already have an account? ',
                                              style: normaltextBlackC,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  Get.to(LoginScreen());
                                                },
                                                child: Text('Login',
                                                    style: normaltextPrimaryC)),
                                          ],
                                        )
                                      ],
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
        );
      },
    );
  }

  signUpButton(AuthController cont, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 45,
        width: 180,
        child: ElevatedButton(
          onPressed: () async {
            // setState(() {
            //   sizedBoxHeight = 500;
            //   showProgress = true;
            // });
            // ..

            if (_formKey.currentState!.validate()) {
              String password = passwordController.text.trim().toString();
              String cPassword =
                  confirmPasswordController.text.trim().toString();
              if (password == cPassword) {
                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);

                final newUser = User(
                  phoneno: phoneController.text.trim().toString(),
                  email: emailController.text.trim().toString(),
                  fname: nameController.text.trim().toString(),
                  password: passwordController.text.trim().toString(),
                  password_confirmation:
                      confirmPasswordController.text.trim().toString(),
                );

                userProvider.registerUser(newUser);
              } else {
                CustomSnackbar.error(message: 'Password doesn\'t match');
              }
              // final user = UserModel(
              //   name: cont.signup_namecontroller.text.trim(),
              //   phone: cont.signup_phone.text.trim(),
              //   email: cont.signup_email.text.trim(),
              //   password: cont.signup_password.text.trim(),
              // );

              // await AuthController.instance.createUser(user);

              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (context) => LoginScreen()),
              // );

              // setState(() {
              //   showProgress = false;
              // });
            } else {
              // setState(() {
              //   showError = true;
              //   sizedBoxHeight = 500;
              //   showProgress = false;
              // });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: "Sign Up".text.bold.size(20).make(),
        ),
      ),
    );
  }

  // clearAllControllerFunction() {
  //   nameController.clear();
  //   emailController.clear();
  //   phoneController.clear();
  //   passwordController.clear();
  //   confirmPasswordController.clear();
  // }
}
