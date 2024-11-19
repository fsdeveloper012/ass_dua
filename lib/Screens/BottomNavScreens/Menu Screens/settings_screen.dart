import 'package:aas/Constants/colors.dart';
import 'package:aas/Constants/text_constants.dart';
import 'package:aas/Provider/logout_provider.dart';
import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/Account%20protection%20Screen/account_protection_screen.dart';
import 'package:aas/Screens/authscreen/login_screen.dart';
import 'package:aas/Services/loading_services.dart';
import 'package:aas/constants/pop-up.dart';

import 'package:aas/constants/text_constants.dart';
import 'package:aas/constants/text_constants.dart' as bt;
import 'package:aas/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: context.screenHeight * .1,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ashwhite,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(context.screenWidth * .05),
                      child: Icon(
                        Icons.arrow_back,
                        size: 32,
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * .15,
                    ),
                    Text('Settings', style: bt.boldtextPrimaryC),
                    SizedBox(
                      width: context.screenWidth * .03,
                    ),
                    Image.asset(
                      'assets/icons/ic_settings.png',
                      height: context.screenHeight * .08,
                      width: context.screenWidth * .08,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: context.screenHeight * .02,
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: context.screenWidth * .07),
                // height: context.screenHeight * .05,
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/ic_phone.png',
                      // height: context.screenHeight * .08,
                      // width: context.screenWidth * .08,
                    ),
                    SizedBox(
                      width: context.screenWidth * .05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone number",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "+92305*****03",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: lightBlack),
                        )
                      ],
                    ),
                    SizedBox(
                      width: context.screenWidth * .26,
                    ),
                    // Container(
                    //     height: 25,
                    //     width: 75,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(7.0),
                    //         color: primaryColor),
                    //     child: Center(
                    //
                    //       child: Text("Change",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 15,
                    //               color: white)),
                    //     )
                    // )
                  ],
                ),
              ),
              Divider(
                color: Color(0xffCCCCCC),
                thickness: 1,
                // indent: 10,
                // endIndent: 10,
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: context.screenWidth * .07),
                height: context.screenHeight * .05,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Get.to(AccountProtectionScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/ic_accountprotection.png',
                        color: black,
                        // height: context.screenHeight * .08,
                        // width: context.screenWidth * .08,
                      ),
                      SizedBox(
                        width: context.screenWidth * .01,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account Protection",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: context.screenWidth * .1,
                      ),
                      Text(
                        'Unprotected',
                        style: TextStyle(color: lightBlack),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: lightBlack,
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Color(0xffCCCCCC),
                thickness: 1,
                // indent: 10,
                // endIndent: 10,
              ),
              // Settings_list2(
              //   Image.asset('assets/icons/ic_phone.png'),
              //   "Privacy Settings",
              // ),
              // Divider(
              //   color: black,
              //   // indent: 10,
              //   // endIndent: 10,
              // ),
              // Settings_list2(
              //   Image.asset(
              //     'assets/icons/ic_accountprotection.png',
              //     color: black,
              //   ),
              //   "Push Notifications",
              // ),
              // Divider(
              //   color: black,
              //   // indent: 10,
              //   // endIndent: 10,
              // ),
              Settings_list2(
                Image.asset(
                  'assets/icons/ic_wallet.png',
                  color: black,
                ),
                "Wallet",
              ),
              Divider(
                color: Color(0xffCCCCCC),
                thickness: 1,
                // indent: 10,
                // endIndent: 10,
              ),
              Settings_list2(
                Image.asset(
                  'assets/icons/ic_notification.png',
                  color: black,
                ),
                "Help Center",
              ),
              Divider(
                color: Color(0xffCCCCCC),
                thickness: 1,
                // indent: 10,
                // endIndent: 10,
              ),
              Settings_list2(
                Image.asset(
                  'assets/icons/ic_aboutus.png',
                  height: context.screenHeight * .08,
                  width: context.screenWidth * .08,
                ),
                "About us",
              ),
              Divider(
                color: Color(0xffCCCCCC),
                thickness: 1,
                // indent: 10,
                // endIndent: 10,
              ),

              InkWell(
                onTap: () async {
                  return _showExitDialogue(context);
                },
                child: Settings_list3(
                  Image.asset(
                    'assets/icons/ic_logout.png',
                    height: context.screenHeight * .08,
                    width: context.screenWidth * .08,
                  ),
                  "Logout",
                ),
              ),
              Divider(
                color: Color(0xffCCCCCC),
                thickness: 1,
                // indent: 10,
                // endIndent: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Settings_list2(Image img, String title1) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * .07),
      height: context.screenHeight * .05,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                img,
                SizedBox(
                  width: context.screenWidth * .05,
                ),
                Text(
                  title1,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            child: Icon(
              Icons.navigate_next,
              color: lightBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget Settings_list3(Image img, String title1) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * .07),
      height: context.screenHeight * .05,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                img,
                SizedBox(
                  width: context.screenWidth * .05,
                ),
                Text(
                  title1,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showExitDialogue(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          final screenSize = MediaQuery.of(context).size;
          return AlertDialog(
            insetPadding: const EdgeInsets.all(30.0),
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0.0),
            content: Container(
              height: 150.0,
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "Do you want to Logout?",
                      style: appNormalText,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              logoutUser();
                              // final logoutProvider =
                              //     Provider.of<LogoutProvider>(context,
                              //         listen: false);
                              // final logout = LogoutProvider();
                              // logoutProvider.logoutUser();

                              // auth.signOut().then((value) {
                              //   Get.to(LoginScreen());
                              // }).onError((error, stackTrace) {
                              //   CustomSnackbar.error(message: error.toString());
                              // });
                            },
                            child: Container(
                              height: 33,
                              width: 63,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    7.0,
                                  ),
                                  border: Border.all(color: red)),
                              child: const Center(
                                child: Text(
                                  'Yes',
                                  style: redText,
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 30.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 33,
                            width: 63,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  7.0,
                                ),
                                border: Border.all(color: black)),
                            child: const Center(
                              child: Text(
                                'No',
                                style: appNormalText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  logoutUser() async {
    InitLoading().showLoading('Loading...');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('sessionToken');
    bool abc = (await prefs.remove('sessionToken'));
    InitLoading().dismissLoading();
    Get.offAll(LoginScreen());

    print('token from logout: $abc');
  }
}

const appNormalText = TextStyle(
  fontSize: 16,
  color: black,
  fontWeight: FontWeight.w500,
);
const redText =
    TextStyle(fontSize: 17, color: red, fontWeight: FontWeight.w500);
