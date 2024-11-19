import 'package:aas/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  final List<Map<String, dynamic>> following = [
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: following.length,
        itemBuilder: (context, index) {
          final item = following[index];
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
                                color: primaryColor,
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
                          "Follow",
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
