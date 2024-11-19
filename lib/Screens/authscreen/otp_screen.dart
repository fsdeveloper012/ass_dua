import 'dart:async';

import 'package:aas/Constants/colors.dart';
import 'package:aas/Model/otp_modal.dart';
import 'package:aas/Provider/timer_provider.dart';
import 'package:aas/Screens/authscreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Provider/otp_provider.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  OtpScreen({required this.email});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // void startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     if (secondsRemaining > 0) {
  //       setState(() {
  //         secondsRemaining--;
  //       });
  //     } else {
  //       timer.cancel();
  //       print('timer expired');
  //     }
  //   });
  // }

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  String? otpCode;
  // final String verificationId = Get.arguments[0];
  // FirebaseAuth auth = FirebaseAuth.instance;
  bool showProgress = false;
  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    // timer.cancel();
    super.dispose();
  }

  // int secondsRemaining = 120;
  // late Timer timer;

  final ButtonStyle style = ElevatedButton.styleFrom(
      minimumSize: Size(Get.width, 48),
      backgroundColor: primaryColor,
      elevation: 6,
      textStyle: const TextStyle(fontSize: 16),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(50),
      )));

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 24, color: black, fontWeight: FontWeight.bold),
        ),
      );
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: black),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: black,
            ),
          ),
        ),
        backgroundColor: white,
        // backgroundColor: Color(0xff215D5F),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 200),
                buildText(
                  'Phone Verification',
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'We need to register your phone without getting started',
                  style: TextStyle(
                    fontSize: 16,
                    color: lightBlack,
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Pinput(
                    length: 4,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFEBEBEB),
                        borderRadius: BorderRadius.circular(3),
                        // border: Border.all(
                        //   color: const Color(0xff2C474A),
                        // ),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    onCompleted: (value) {
                      setState(() {
                        otpCode = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    style: style,
                    onPressed: () {
                      verifyOtpCode();
                    },
                    child: const Text(
                      'Verify Otp',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )),
                const SizedBox(height: 80),
                GestureDetector(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: const Text(
                    "",
                    style: TextStyle(
                        fontSize: 17,
                        color: black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // const SizedBox(height: 10),
                Consumer<TimerProvider>(
                  builder: (context, timerProvider, child) {
                    return Row(
                      children: [
                        Text(
                          "Resend Code Again in:    ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${timerProvider.secondsRemaining} sec",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        timerProvider.secondsRemaining == 0
                            ? Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    print('btn pressed');
                                    // print(timerProvider.secondsRemaining);
                                    // setState(() {
                                    timerProvider.restartTimer();
                                    // timerProvider.startTimer();
                                    // });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: primaryColor,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Resend',
                                          style: TextStyle(
                                              fontSize: 20, color: white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.grey,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Resend',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                      ],
                    );
                  },
                )

                //  SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  verifyOtpCode() {
    if (_formKey.currentState!.validate()) {
      final OtpProvider = Provider.of<OtpCodeProvider>(context, listen: false);
      final otp = Otp(email: widget.email, otp: otpCode!);
      OtpProvider.verifyUser(otp);
    } else {
      print('some thing went wrong');
    }
  }
}
