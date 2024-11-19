import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:velocity_x/velocity_x.dart';

class AccountProtectionScreen extends StatelessWidget {
  const AccountProtectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(20, 77, 70, 1.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: context.screenHeight * .145,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            'Account Protection',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1.5,
                        width: 10,
                        indent: 35,
                        endIndent: 35,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        'assets/images/3.png',
                        height: 32.h,
                        width: 32.w,
                        fit: BoxFit.fill,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                //margin: EdgeInsets.symmetric(horizontal: 2),
                //padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.heightBox,
                    Center(
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: Image.asset(
                                  "assets/images/lock.png",

                                  //fit: BoxFit.cover,
                                ),
                                label: Text(
                                  "Pin",
                                  style: TextStyle(
                                      color: Color.fromRGBO(20, 77, 70, 1.0)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      5.0), // Set border radius to 20
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ), // Set border color to black
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Image.asset(
                            "assets/images/submit button.png",
                            width: 130.w,
                            height: 130.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ), // Set the background color here
      ),
    );
  }
}
