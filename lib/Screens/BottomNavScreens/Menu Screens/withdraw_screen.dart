import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/donate_screen.dart';
import 'package:aas/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class WithdrawScreen extends StatefulWidget {
  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromRGBO(20, 77, 70, 1.0),
          child: Column(
            children: [
              Container(
                height: context.screenHeight * .1,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Withdraw",
                        style: TextStyle(
                            color: Color.fromRGBO(
                                252, 216, 138, 1.0), // or any other color
                            decoration: TextDecoration.none,
                            fontSize: 22 // remove underline
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      30.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Total Amount", style: normaltextBlackC),
                        ],
                      ),
                      5.heightBox,
                      Text(
                        "\$10.750",
                        style: TextStyle(
                            color: Color.fromRGBO(
                                20, 77, 70, 1.0), // or any other color
                            decoration: TextDecoration.none,
                            fontSize: 35,
                            fontWeight: FontWeight.bold // remove underline
                            ),
                      ),
                      30.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          20.widthBox,
                          Image.asset(
                            'assets/icons/icon 1.png',
                            height: 50,
                            width: 50,
                          ),
                          20.widthBox,
                          Text(
                            "Earned by Community: \$50",
                            style: TextStyle(
                                color: Color.fromRGBO(
                                    20, 77, 70, 1.0), // or any other color

                                fontSize: 20,
                                fontWeight: FontWeight.bold // remove underline
                                ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          20.widthBox,
                          Image.asset(
                            'assets/icons/icon 2.png',
                            height: 50,
                            width: 50,
                          ),
                          20.widthBox,
                          Text(
                            "Earned by Tasks: \$50",
                            style: TextStyle(
                                color: Color.fromRGBO(
                                    20, 77, 70, 1.0), // or any other color

                                fontSize: 20,
                                fontWeight: FontWeight.bold // remove underline
                                ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          20.widthBox,
                          Image.asset(
                            'assets/icons/icon3.png',
                            height: 50,
                            width: 50,
                          ),
                          20.widthBox,
                          Text(
                            "Total Earning: \$50",
                            style: TextStyle(
                                color: Color.fromRGBO(
                                    20, 77, 70, 1.0), // or any other color
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                fontWeight: FontWeight.bold // remove underline
                                ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          20.widthBox,
                          Image.asset(
                            'assets/icons/icon4.png',
                            height: 50,
                            width: 50,
                          ),
                          20.widthBox,
                          Text(
                            "Total Withdraw: \$50",
                            style: TextStyle(
                                color: Color.fromRGBO(
                                    20, 77, 70, 1.0), // or any other color
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                fontWeight: FontWeight.bold // remove underline
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.screenWidth * .1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(DonateScreen());
                            },
                            child: Image(
                                height: 52,
                                width: 140,
                                image:
                                    AssetImage('assets/images/withdraw.png')),
                          ),
                          SizedBox(
                            width: context.screenWidth * .1,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(DonateScreen());
                            },
                            child: Image(
                                height: 52,
                                width: 140,
                                image: AssetImage('assets/images/donate.png')),
                          ),
                        ],
                      )
                    ],
                  ), // Adjust the radius as needed
                ),
              ),
            ],
          ), // Set the background color here
        ),
      ),
    );
  }
}
