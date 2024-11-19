import 'dart:math';

import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graphview/GraphView.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              upperContainer(height, width, context),
            ],
          ),
        ),
      ),
    );
  }

  upperContainer(double height, double width, BuildContext context) {
    return Container(
      width: width,
      color: primaryColor,
      child: Column(
        children: [
          Container(
            height: context.screenHeight * .115,
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      //height: 70,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                              child: Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                            color: Colors.white,
                          )),
                        ),
                      ),

                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3.0)),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'NOTIFICATION',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Icon(
                        Icons.notification_important_outlined,
                        color: yellowC,
                        size: 28,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.heightBox,
                Container(
                  height: context.screenHeight * 1,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: ListView.separated(
                            itemCount: 5, // Total number of items
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                color: Colors.black,
                                thickness: 0.25,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Container(
                                    width: 48.w,
                                    height: 58.h,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        'assets/images/address.png',
                                      ),
                                    )), // Image
                                title: Text(
                                  "Free Delivery",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                ), // Title
                                subtitle: Text(
                                  "We have an Exciting Offers for you near to..",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ), // Subtitle
                                onTap: () {
                                  print("Yes");
                                },
                              );
                            },
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
