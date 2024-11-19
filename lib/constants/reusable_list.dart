import 'package:aas/Screens/BottomNavScreens/homescreen/BottomNav2_screens/followers_screen.dart';
import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowersList extends StatefulWidget {
  const FollowersList({super.key});

  @override
  State<FollowersList> createState() => _FollowersListState();
}

class _FollowersListState extends State<FollowersList> {
  @override
  final List<Map<String, dynamic>> Followers = [
    {
      'title': 'Ali',
      'subtitle': '200 Post',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Ahmad',
      'subtitle': '500 Post ',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Shahzaed',
      'subtitle': '1200 Post ',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Ali',
      'subtitle': '200 Post',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Ahmad',
      'subtitle': '500 Post ',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Shahzaed',
      'subtitle': '1200 Post ',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Ali',
      'subtitle': '200 Post',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Ahmad',
      'subtitle': '500 Post ',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Shahzaed',
      'subtitle': '1200 Post ',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Ali',
      'subtitle': '200 Post',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Ahmad',
      'subtitle': '500 Post ',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Shahzaed',
      'subtitle': '1200 Post ',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Ali',
      'subtitle': '200 Post',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Ahmad',
      'subtitle': '500 Post ',
      'image': 'assets/images/profile_img.png'
    },
    {
      'title': 'Shahzaed',
      'subtitle': '1200 Post ',
      'image': 'assets/images/profile_img.png'
    },
  ];

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: Followers.length,
        itemBuilder: (context, index) {
          final item = Followers[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Image.asset(
                      '${item['image']}',
                      // Assuming images are in the 'assets' folder
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            item['subtitle'],
                            style: TextStyle(
                                color: lightBlack,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 35.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Following",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Icon(
                      Icons.more_horiz_outlined,
                      color: black,
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
