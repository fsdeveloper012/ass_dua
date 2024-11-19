import 'dart:async';
import 'dart:ui';

import 'package:aas/Screens/BottomNavScreens/homescreen/Dua%20Screens/DuaScreen.dart';
import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/Prayer%20Time/prayer_time_screen.dart';

import 'package:aas/Screens/BottomNavScreens/homescreen/AasTasbee.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/BottomNav2_screens/bottom_nav2.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/qibla_direction.screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/quran_screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/walletscreen.dart';
import 'package:aas/constants/colors.dart';
import 'package:aas/content_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    "assets/images/video_thumbnail.png",
    "assets/images/2-thumbnail.jpg",
    "assets/images/3-thumbnail.jpg",
  ];
  // int _currentIndex = 0;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getSessionToken();
  // }

  // getSessionToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   String? sessionToken = await prefs.getString('sessionToken');
  //   print('this is session token from home screen: $sessionToken');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(BottomNav2());
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 200.h,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true, // Autoplay ki setting

                        enableInfiniteScroll:
                            true, // Infinite scroll enable karna
                        autoPlayCurve:
                            Curves.fastOutSlowIn, // Autoplay animation curve
                        autoPlayAnimationDuration: Duration(seconds: 3),
                        viewportFraction: 1.0,
                      ),
                      items: imageList.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Container(
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(81)),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 75.h,
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(60)),
                  color: primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'User'.text.bold.size(18).yellow200.make(),
                        5.heightBox,
                        'mailto:user@gmail.com'.text.white.make()
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "50".text.bold.size(18).yellow200.make(),
                        5.heightBox,
                        'Followers'.text.white.size(14).bold.make()
                      ],
                    )
                  ],
                ),
                // width: double.infinity,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  height: 320,
                  // width: MediaQuery.of(context).size.width,
                  // color: Colors.amber,
                  child: Row(children: [
                    leftColumnContainer(),
                    centerColumnContainer(),
                    rightColumnContainer(),
                  ])),
            ],
          ),
        ),
      ),
    );
  }

  Expanded centerColumnContainer() {
    return Expanded(
        child: Container(
      height: 250,
      // width: 170,
      // color: Colors.green,
      child: Column(
        children: [
          Container(
            height: 60,
            // color: Colors.red,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Have you prayed Fajar?',
                        style: centerContainerTextStyle),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      'Remaining Time 02:30:15',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  width: 6.0,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.radio_button_unchecked,
                      size: 20,
                    ),
                    Text(
                      '3/5',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                )
                //
              ],
            ),
          ),
          Container(
            height: 110,
            width: double.infinity,
            // color: Colors.greenAccent,
            child: Center(
              child: Image(image: AssetImage('assets/images/aas.png')),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 175.w,
                  child: Text(
                    'UPCOMING PRAYER',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 70.w,
                      child: Text(
                        'Asar',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      '5:15 pm',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Container leftColumnContainer() => Container(
        height: 250,
        width: 55,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(QuranScreen());
              },
              child: Container(
                height: 80,
                // color: black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        width: 38, image: AssetImage('assets/icons/quran.png')),
                    Text(
                      'QURAN',
                      style: homeScreenText,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(DuaScreen());
              },
              child: Container(
                height: 80,
                // color: black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(width: 38, image: AssetImage('assets/icons/dua.png')),
                    Text(
                      'DUA',
                      style: homeScreenText,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(AasTasbee());
              },
              child: Container(
                height: 80,
                // color: black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        width: 38,
                        image: AssetImage('assets/icons/tasbeeh.png')),
                    Text(
                      'TASBEEH',
                      style: homeScreenText,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  Container rightColumnContainer() => Container(
        height: 250,
        width: 55,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(QiblaDirectionScreen());
              },
              child: Container(
                height: 80,
                // color: black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        width: 38, image: AssetImage('assets/icons/qibla.png')),
                    Text(
                      'QIBLA',
                      style: homeScreenText,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(PrayerTimes());
              },
              child: Container(
                height: 80,
                // color: black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        width: 38,
                        image: AssetImage('assets/icons/prayer.png')),
                    Text(
                      'PRAYERS',
                      style: homeScreenText,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => WalletScreen());
              },
              child: Container(
                height: 80,
                // color: black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        width: 38,
                        image: AssetImage('assets/icons/wallet.png')),
                    Text(
                      'WALLET',
                      style: homeScreenText,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

const homeScreenText =
    TextStyle(fontSize: 11, color: black, fontWeight: FontWeight.bold);
const centerContainerTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: primaryColor);
