import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/Prayer%20Time/prayer_list.dart';
import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class PrayerTimes extends StatefulWidget {
  @override
  _PrayerTimesState createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  int _currentIndex = 0;

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/PrayerBackground.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              height: context.screenHeight * .1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
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
                              child: Icon(Icons.arrow_back,
                                  color: white, size: 20),
                            ),
                          ),
                        )),
                    // SizedBox(width: context.screenWidth * .20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Prayer Times',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellowC,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/icons/mosque.png"),
                        )
                      ],
                    ),
                    Container()
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            locationWidget(),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/PrayerBackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  CarouselSlider.builder(
                    carouselController: _carouselController,
                    itemCount: itemList.length,
                    options: CarouselOptions(
                      height: 550.0,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      aspectRatio: 16 / 9,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return buildItem(itemList[index]);
                    },
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 6; i++)
                        Container(
                          width: 10,
                          height: 10,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                i == _currentIndex ? Colors.blue : Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Row locationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_on, color: white),
        SizedBox(width: 5.w),
        Text(
          "Multan",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(252, 216, 138, 1.0),
          ),
        ),
      ],
    );
  }

  Widget buildItem(CustomItem item) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          for (int i = 0; i < item.leftImages.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Image.asset(
                          item.leftImages[i],
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              prayersName[i],
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          prayerTime[i],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Colors.white,
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: Transform.scale(
                            scale: 1.4,
                            child: Checkbox(
                              value: item.isCheckedList[
                                  i], // Use the individual isChecked value
                              onChanged: (newValue) {
                                setState(() {
                                  // Update the individual isChecked value
                                  item.isCheckedList[i] = newValue ?? false;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
