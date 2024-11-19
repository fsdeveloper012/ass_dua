import 'dart:io';

import 'package:aas/Screens/BottomNavScreens/homescreen/Dua%20Screens/DuaScreen.dart';
import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/Prayer%20Time/prayer_time_screen.dart';
import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/help_screen.dart'
    as hs;
import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/islamic_calender.dart';
import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/islamic_gallery.dart';
import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/settings_screen.dart';
import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/withdraw_screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/AasTasbee.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/quran_screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/walletscreen.dart';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          //  image
          // Image.asset(
          //   'assets/images/mbg.png',
          //   width: 1000,
          // ),
          Image(
            image: AssetImage('assets/images/mbg.png'),
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Positioned(
              left: context.screenWidth * .27,
              top: context.screenHeight * .05,
              child: 'Log Your Prayers'.text.bold.size(25).white.make()),
          Positioned(
              top: context.screenHeight * .15,
              left: 20,
              right: 20,
              child: Card(
                shadowColor: Color(0xffd3d3d3),
                color: Color(0xFFEBEBEB),
                elevation: 25,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4, // Number of columns in the grid
                  padding: EdgeInsets.all(10.0),
                  childAspectRatio:
                      0.8, // Maintain a square aspect ratio for GridItems
                  mainAxisSpacing: 10.0,
                  children: [
                    // Your grid items here
                    GridItem(
                      image: 'assets/icons/12.png',
                      text: 'Prayer Times',
                      onTap: () {
                        Get.to(() => PrayerTimes());
                      },
                    ),
                    GridItem(
                      image: 'assets/icons/11.png',
                      text: 'Islamic Gallery',
                      onTap: () {
                        Get.to(() => IslamicGallery());
                      },
                    ),
                    GridItem(
                      image: 'assets/icons/10.png',
                      text: 'Islamic Calender',
                      onTap: () {
                        Get.to(IslamicCalender());
                      },
                    ),
                    GridItem(
                      image: 'assets/icons/9.png',
                      text: 'Quran',
                      onTap: () {
                        Get.to(QuranScreen());
                      },
                    ),
                    GridItem(
                      image: 'assets/icons/8.png',
                      text: 'App Settings',
                      onTap: () {
                        Get.to(SettingsScreen());
                      },
                    ),
                    GridItem(
                      image: 'assets/icons/7.png',
                      text: 'Wallet',
                      onTap: () {
                        Get.to(() => WalletScreen());
                      },
                    ),
                    GridItem(
                      image: 'assets/icons/6.png',
                      text: 'Tasbeeh',
                      onTap: () {
                        Get.to(() => AasTasbee());
                      },
                    ),
                    GridItem(
                      image: 'assets/icons/5.png',
                      text: 'Dua',
                      onTap: () {
                        Get.to(DuaScreen());
                      },
                    ),
                    GridItem(
                      image: 'assets/icons/3.png',
                      text: 'Reffer Friend',
                      onTap: () async {
                        await Share.share(
                            'https://play.google.com/store/apps/details?id=spiders.app&pcampaignid=web_share');
                      },
                    ),
                    GridItem(
                      image: 'assets/icons/4.png',
                      text: 'Help',
                      onTap: () {
                        Get.to(hs.HelpScreen());
                      },
                    ),
                    GridItem(
                      image: 'assets/icons/2.png',
                      text: 'Remove Ads',
                      onTap: () {},
                    ),
                    GridItem(
                      image: 'assets/icons/1.png',
                      text: 'Share App',
                      onTap: () async {
                        await Share.share(
                            'https://play.google.com/store/apps/details?id=spiders.app&pcampaignid=web_share');
                      },
                    ),
                  ],
                ),
              )),
          Positioned(
            top: context.screenHeight * .65,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(WithdrawScreen());
                  },
                  child: Image(
                      height: 45,
                      image: AssetImage('assets/images/become_donar.png')),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

const menuIconsTextStyle =
    TextStyle(fontSize: 11, color: Colors.black, fontWeight: FontWeight.bold);

class GridItem extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;

  GridItem({
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              image,
              height: 70,
              width: 70,
            ),
            5.heightBox, // You can use SizedBox to create spacing
            Text(
              text,
              style: menuIconsTextStyle,
              maxLines: 1, // Set maxLines to 1 to prevent text from wrapping
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
