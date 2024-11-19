import 'package:aas/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';

class IslamicGallery extends StatefulWidget {
  @override
  State<IslamicGallery> createState() => _IslamicGalleryState();
}

class _IslamicGalleryState extends State<IslamicGallery> {
  final List<String> imagePaths = [
    'assets/images/islamic.png',
    'assets/images/islamic2.png',
    'assets/images/islamic3.png',
    'assets/images/islamic4.png',
    'assets/images/islamic5.png',
    'assets/images/islamic6.png',
    'assets/images/islamic7.png',
    'assets/images/islamic8.png',
    'assets/images/islamic9.png',
    'assets/images/islamic10.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: context.screenHeight * 0.1,
              color: primaryColor,
              child: Center(
                child: "Islamic Gallery"
                    .text
                    .color(Color.fromRGBO(252, 216, 138, 1.0))
                    .bold
                    .size(22)
                    .make(),
              ),
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: .6, // Maintain square aspect ratio
                ),
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => ImageFullScreen(
                            imagePath: imagePaths,
                            index: index,
                          ));
                    },
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageFullScreen extends StatefulWidget {
  final List<String> imagePath;
  final int index;

  const ImageFullScreen(
      {super.key, required this.imagePath, required this.index});

  @override
  State<ImageFullScreen> createState() => _ImageFullScreenState();
}

class _ImageFullScreenState extends State<ImageFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Text(
          "Islamic Gallery",
          style: TextStyle(
              color: Color.fromRGBO(252, 216, 138, 1.0),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () async {
                  await Share.share(
                      'https://play.google.com/store/apps/details?id=spiders.app&pcampaignid=web_share');
                },
                child: ImageIcon(
                  AssetImage(
                    "assets/images/share.png",
                  ),
                  size: 33,
                )),
          )
        ],
      ),
      body: Image.asset(
        widget.imagePath[widget.index],
        fit: BoxFit.fill,
        height: MediaQuery.sizeOf(context).height,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
