import 'package:aas/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 23, color: yellowC),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: lightBlack,
                    border: Border.all(color: white, width: 2)),
                child: Center(
                  child: Icon(Icons.arrow_back, color: white, size: 20),
                ),
              ),
            )),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Center(
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: <Widget>[
                  Container(
                    width: Get.width,
                    height: Get.height,
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                        width: Get.width,
                        height: Get.height * 0.18,
                        color: primaryColor),
                  ),
                  Positioned(
                    top: 150,
                    child: textFieldContainers(),
                  ),
                  Positioned(
                    left: 140,
                    top: 90,
                    right: 140,
                    child: profileImgContainer(context),
                    // Container(
                    //   width: 120,
                    //   //height: 40,
                    //   child: Column(
                    //     children: [
                    //       CircularPercentIndicator(
                    //         radius: 49.0,
                    //         lineWidth: 3.0,
                    //         percent: 0.30,
                    //         // header: Text("Icon header"),
                    //         center: CircleAvatar(
                    //           radius: 43,
                    //           backgroundColor: white,
                    //           child: CircleAvatar(
                    //               radius: context.screenWidth * .11,
                    //               backgroundColor: Colors.transparent,
                    //               backgroundImage: NetworkImage(
                    //                   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU')),
                    //         ),
                    //         backgroundColor: white,
                    //         progressColor: primaryColor,
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  profileImgContainer(BuildContext context) {
    return Stack(children: [
      Container(
        width: 140,
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
    ]);
  }

  textFieldContainers() {
    return Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: white),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: primaryColor, width: 1.0)),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 20,
                          color: primaryColor,
                        ),
                        hintText: "Name",
                        hintStyle: TextStyle(fontSize: 12, color: primaryColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
              ),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: primaryColor, width: 1.0)),
                        prefixIcon: Image.asset(
                          "assets/images/lock.png",

                          //fit: BoxFit.cover,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 12, color: primaryColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
              ),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          "assets/images/lock.png",

                          //fit: BoxFit.cover,
                        ),
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: primaryColor, width: 1.0)),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(fontSize: 12, color: primaryColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
              ),
              10.heightBox,
              SizedBox(
                height: 15,
              ),
              Image.asset(
                "assets/images/submit button.png",
                width: 130.w,
                height: 130.h,
              ),
            ],
          ),
        ));
  }
}
