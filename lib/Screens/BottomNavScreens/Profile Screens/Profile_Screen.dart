import 'package:aas/Screens/BottomNavScreens/Profile%20Screens/ledger_screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/walletscreen.dart';
import 'package:aas/Screens/BottomNavScreens/Profile%20Screens/EventsScreen.dart';
import 'package:aas/Screens/BottomNavScreens/Profile%20Screens/edit_profile.dart';
import 'package:aas/Screens/BottomNavScreens/Profile%20Screens/notification_screen.dart';
import 'package:aas/Screens/BottomNavScreens/Profile%20Screens/RewarsScreen.dart';
import 'package:aas/Screens/BottomNavScreens/Profile%20Screens/TaskScreen.dart';
import 'package:aas/constants/colors.dart';
import 'package:aas/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {}); // Rebuild the widget when the tab changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 25.0, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: lightBlack,
                      border: Border.all(color: white, width: 2)),
                  child: Center(
                    child: Icon(Icons.arrow_back, color: white, size: 20),
                  ),
                ),
              )),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.to(WalletScreen());
                },
                child: Icon(Icons.account_balance_wallet, color: white)),
            SizedBox(
              width: 4.w,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(NotificationScreen());
                },
                child: Icon(Icons.notifications_none_outlined,
                    color: white, size: 27)),
          ],
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: primaryColor,
            child: Column(
              children: [
                profileContainer(context),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Column(
                      children: [
                        20.heightBox,
                        Container(
                          height: context.screenHeight * .053,
                          width: context.screenWidth / 1.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(
                                    0xFF111111), // Change to black border color
                              ),
                            ),
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: white,
                              indicator: BoxDecoration(
                                color: Color.fromRGBO(
                                    20, 77, 70, 1.0), // Active tab color
                                borderRadius: BorderRadius.circular(10),
                              ),
                              unselectedLabelColor: Color(0xFFABA9A9),
                              controller: _tabController,
                              tabs: [
                                Tab(text: 'Rewards'),
                                Tab(text: 'Events'),
                                Tab(text: 'Task'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              RewardsScreen(),
                              EventsScreen(),
                              TaskScreen(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container profileContainer(BuildContext context) {
    return Container(
      height: 130.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              width: 120,
              //height: 40,

              child: Column(
                children: [
                  CircularPercentIndicator(
                    radius: 49.0,
                    lineWidth: 3.0,
                    percent: 0.30,
                    // header: Text("Icon header"),
                    center: CircleAvatar(
                      radius: 43,
                      backgroundColor: white,
                      child: CircleAvatar(
                          radius: context.screenWidth * .11,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU')),
                    ),
                    backgroundColor: white,
                    progressColor: primaryColor,
                  )
                ],
              ),
            ),
            Positioned(
              left: context.screenWidth * 0.2,
              child: GestureDetector(
                onTap: () {
                  Get.to(EditProfileScreen());
                },
                child: Image(
                    image: AssetImage(
                  "assets/images/GallryImage.png",
                )),
              ),
              height: context.screenHeight * 0.05,
              width: context.screenHeight * 0.05,
            )
          ]),
          // SizedBox(
          //   width: 20,
          // ),
          Expanded(
            child: Container(
              // width: 170.w,
              // height: 100.h,

              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Color(0xffFCD88A),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "ID : 1232433",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "Total Amount ",
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "20\$",
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Color(0xffFCD88A),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      // Text(
                      //   "+923047243012",
                      //   style: TextStyle(
                      //       fontSize: 11.sp,
                      //       color: Color(0xffFFFFFF),
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 70),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => LedgerScreen());
                          },
                          child: Text(
                            "Ledger's",
                            style: TextStyle(
                                color: mediumText.color,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: white,
                          ),
                        )

                        // Image.asset(
                        //   "assets/images/ledger.png",
                        //   width: 100.w,
                        //   fit: BoxFit.cover,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
