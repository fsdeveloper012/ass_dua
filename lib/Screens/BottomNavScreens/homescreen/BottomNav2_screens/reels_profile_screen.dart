import 'package:aas/Screens/BottomNavScreens/homescreen/BottomNav2_screens/followers_screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/BottomNav2_screens/following_screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/BottomNav2_screens/post_screen.dart';
import 'package:aas/constants/colors.dart';
import 'package:aas/constants/reusable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ReelsProfileScreen extends StatefulWidget {
  const ReelsProfileScreen({Key? key}) : super(key: key);

  @override
  State<ReelsProfileScreen> createState() => _ReelsProfileScreenState();
}

class _ReelsProfileScreenState extends State<ReelsProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 27.0),
              child: Container(
                height: 27,
                width: 27,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: lightBlack,
                    border: Border.all(color: black, width: 2)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios, color: black, size: 18),
                  ),
                ),
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.share,
              color: black,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          // Icon(
          //   Icons.more_vert_outlined,
          //   color: black,
          // ),
          // SizedBox(
          //   width: 15,
          // ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 35,
                      backgroundImage:
                          AssetImage("assets/images/profile_img.png"),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Muhammad Shahzad",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "50 k",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "10 k",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Following",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "50 k",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Post",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ],
            ),
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
                      width: context.screenWidth * .8,
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
                          indicator: BoxDecoration(
                            color: Color.fromRGBO(
                                20, 77, 70, 1.0), // Active tab color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          unselectedLabelColor: Color(0xFFABA9A9),
                          controller: _tabController,
                          tabs: [
                            Tab(text: 'Followers'),
                            Tab(text: 'Following'),
                            Tab(text: 'Post'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          FollowersList(),
                          FollowingScreen(),
                          PostsScreen(),
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
    );
  }
}
