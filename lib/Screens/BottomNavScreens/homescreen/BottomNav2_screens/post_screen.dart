import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final List<String> imagePaths = [
    'assets/icons/gallery1.png',
    'assets/icons/gallery6.png',
    'assets/icons/gallery2.png',
    'assets/icons/gallery1.png',
    'assets/icons/gallery5.png',
    'assets/icons/gallery3.png',
    'assets/icons/gallery4.png',
    'assets/icons/gallery1.png',
    'assets/icons/gallery6.png',
    'assets/icons/gallery5.png',
    'assets/icons/gallery1.png',
    'assets/icons/gallery6.png',
    'assets/icons/gallery7.png',
    'assets/icons/gallery5.png',
    'assets/icons/gallery8.png',
    'assets/icons/gallery9.png',
    'assets/icons/gallery1.png',
    'assets/icons/gallery6.png',
    'assets/icons/gallery5.png',
  ];
  // Replace with your image paths
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: .6, // Maintain square aspect ratio
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Container(
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
