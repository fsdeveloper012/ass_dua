import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/colors.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List displayEvents = [
    events(
        text1: "Naat Events",
        text2: 'venue: Multan Marquee',
        text3: "03/05/2023"),
    events(
        text1: "Naat Events",
        text2: 'venue: Multan Marquee',
        text3: "03/05/2023"),
    events(
        text1: "Naat Events",
        text2: 'venue: Multan Marquee',
        text3: "03/05/2023"),
    events(
        text1: "Naat Events",
        text2: 'venue: Multan Marquee',
        text3: "03/05/2023"),
    events(
        text1: "Naat Events",
        text2: 'venue: Multan Marquee',
        text3: "03/05/2023"),
    events(
        text1: "Naat Events",
        text2: 'venue: Multan Marquee',
        text3: "03/05/2023"),
    events(
        text1: "Naat Events",
        text2: 'venue: Multan Marquee',
        text3: "03/05/2023"),
    events(
        text1: "Naat Events",
        text2: 'venue: Multan Marquee',
        text3: "03/05/2023"),
    events(
        text1: "Naat Events",
        text2: 'venue: Multan Marquee',
        text3: "03/05/2023"),
    events(
        text1: "Naat Events",
        text2: 'venue: Multan Marquee',
        text3: "03/05/2023"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
        child: ListView.separated(
          itemCount: displayEvents.length,
          itemBuilder: (context, index) {
            return listOfSurah(index);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: black,
              thickness: 0.77,
            );
          },
        ),
      ),
    );
  }

  ListTile listOfSurah(int index) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      dense: true,
      leading: Stack(
        children: [
          const Image(
            height: 40,
            //width: 50,
            image: AssetImage('assets/images/quran-screen-counting.png'),
          ),
          Positioned(
            top: 10.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      title: Transform.translate(
        offset: const Offset(-14, 0),
        child: Text(
          displayEvents[index].text1,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
        ),
      ),
      subtitle: Transform.translate(
        offset: const Offset(-14, 0),
        child: Text(
          displayEvents[index].text2,
          style: const TextStyle(fontSize: 11, color: primaryColor),
        ),
      ),
      trailing: Text(displayEvents[index].text3,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffd3d3d3),
              fontSize: 13)),
    );
  }
}

class events {
  String? text1;
  String? text2;
  String? text3;

  events({this.text1, this.text2, this.text3});
}
