import 'package:aas/Constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class prayertimes extends StatefulWidget {
  const prayertimes({Key? key}) : super(key: key);

  @override
  _prayertimesState createState() => _prayertimesState();
}

class _prayertimesState extends State<prayertimes> {
  DateTime currentTime = DateTime.now();
  int? currentPrayerIndex;
  CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    // Determine the current prayer based on current time
    for (int i = 0; i < data.length; i++) {
      final prayerTime = parsePrayerTime(data[i].prayerTime);
      if (prayerTime != null && currentTime.isBefore(prayerTime)) {
        currentPrayerIndex = i;
        break;
      }
    }
  }

  DateTime? parsePrayerTime(String? time) {
    if (time == null) return null;

    final timeComponents = time.split(' ');
    if (timeComponents.length != 2) return null;

    final timeOnly = timeComponents[0]; // "5:30"
    final amPm = timeComponents[1]; // "AM" or "PM"
    final hourMinute = timeOnly.split(':');

    if (hourMinute.length != 2) return null;

    int? hours = int.tryParse(hourMinute[0]);
    int? minutes = int.tryParse(hourMinute[1]);

    if (hours == null || minutes == null) return null;

    if ((amPm == "PM" && hours != 12) || (amPm == "AM" && hours == 12)) {
      hours = (hours + 12) % 24;
    }

    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hours, minutes);
  }

  List<PrayersModel> data = [
    PrayersModel(
      leadingImage: "assets/images/Fajar.png",
      prayerName: "Fajr",
      prayerTime: "5:30 AM",
      isChecked: false,
    ),
    PrayersModel(
      leadingImage: "assets/images/Sunrise.png",
      prayerName: "Sunrise",
      prayerTime: "5:36 AM",
      isChecked: false,
    ),
    PrayersModel(
      leadingImage: "assets/images/Zohar.png",
      prayerName: "Dhuhr",
      prayerTime: "12:20 PM",
      isChecked: false,
    ),
    PrayersModel(
      leadingImage: "assets/images/Asr.png",
      prayerName: "Asr",
      prayerTime: "5:05 PM",
      isChecked: false,
    ),
    PrayersModel(
      leadingImage: "assets/images/Magrab.png",
      prayerName: "Maghrib",
      prayerTime: "7:03 PM",
      isChecked: false,
    ),
    PrayersModel(
      leadingImage: "assets/images/Esha.png",
      prayerName: "Isha",
      prayerTime: "8:30 PM",
      isChecked: false,
    ),
  ];

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
                width: double.infinity,
                height: context.screenHeight * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    "Prayer Times"
                        .text
                        .color(Color.fromRGBO(252, 216, 138, 1.0))
                        .bold
                        .size(25)
                        .make(),
                    5.widthBox,
                    Image.asset(
                      'assets/icons/mosque.png',
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: white),
                  SizedBox(width: 5.w),
                  Text(
                    "Multan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(252, 216, 138, 1.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CarouselSlider(

                carouselController: _carouselController,
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  initialPage: currentPrayerIndex ?? 0,
                  viewportFraction: 0.8,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  scrollDirection: Axis.horizontal,
                ),
                items: data.map((item) {
                  return Column(
                    children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         GestureDetector(
                           onTap: () {
                             // Check if the tapped prayer's time is current or later
                             if (currentPrayerIndex != null &&
                                 data.indexOf(item) >= currentPrayerIndex!) {
                               setState(() {
                                 item.isChecked = !item.isChecked;
                               });
                             }
                           },
                           child:Row(
                             children: [
                               Container(
                                 margin: EdgeInsets.symmetric(horizontal: 5.0),
                                 child: Image.asset(
                                   item.leadingImage ?? "",
                                   height: 30.0,
                                   width: 30.0,
                                 ),

                               ),
                               Text(
                                 item.prayerName ?? "",
                                 style: TextStyle(
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white,
                                 ),
                               ),
                             ],
                           )
                         ),



                         Text(
                           '${item.prayerTime ?? ""}',
                           style: TextStyle(
                             fontSize: 18.0,
                             color: Colors.white,
                           ),
                         ),
                         Checkbox(
                           value: item.isChecked,
                           onChanged: (value) {
                             // Check if the tapped prayer's time is current or later
                             if (currentPrayerIndex != null &&
                                 data.indexOf(item) >= currentPrayerIndex!) {
                               setState(() {
                                 item.isChecked = value!;
                               });
                             }
                           },
                         ),


                       ],
                     ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrayersModel {
  String? leadingImage;
  String? prayerName;
  String? prayerTime;
  bool isChecked;

  PrayersModel({
    this.leadingImage,
    this.prayerName,
    this.prayerTime,
    this.isChecked = false,
  });
}


