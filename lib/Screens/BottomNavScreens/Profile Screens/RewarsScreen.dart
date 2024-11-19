import 'package:aas/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RewardsScreen extends StatefulWidget {
  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
          ),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            // Number of items in each row
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.75,
              crossAxisCount: 4,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
            ),
            itemBuilder: (context, index) {
              return const Column(
                children: [
                  GridItem(
                    imagePath: 'assets/images/trophy.png',
                    levelText: 'Level 1',
                    pointsText: 'Points 5',
                  ),
                  Divider(
                    thickness: 1,
                    color: primaryColor, // Divider color
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String imagePath;
  final String levelText;
  final String pointsText;

  const GridItem({
    required this.imagePath,
    required this.levelText,
    required this.pointsText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 130,
      width: double.infinity,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 43.h,
            height: 75.w,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 4), // Adjust the spacing as needed
          Column(
            children: [
              Text(
                levelText,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              Text(
                pointsText,
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
