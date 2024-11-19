import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class IslamicCalender extends StatefulWidget {
  const IslamicCalender({Key? key}) : super(key: key);

  @override
  State<IslamicCalender> createState() => _IslamicCalenderState();
}

class _IslamicCalenderState extends State<IslamicCalender> {
  final List<Map<String, dynamic>> islamicEvents = [
    {
      'title': 'Ramazan',
      'subtitle': '21/01/1444H',
      'EnglishDate': '04/12/2023'
    },
    {'title': 'Hajj', 'subtitle': '21/01/1444H', 'EnglishDate': '04/12/2023'},
    {
      'title': 'Eid ul Fiter',
      'subtitle': '21/01/1444H',
      'EnglishDate': '04/12/2023'
    },
    {
      'title': 'Eid ul Azha',
      'subtitle': '21/01/1444H',
      'EnglishDate': '04/12/2023'
    },
  ];

  DateTime selectedDate = DateTime.now();

  HijriCalendar hijriDate = HijriCalendar.now();

  void _onDaySelected(DateTime day, DateTime? focusDay) {
    setState(() {
      selectedDate = day;
      hijriDate = HijriCalendar.fromDate(day);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String formattedTime = DateFormat.jm().format(selectedDate);
    String formattedDate = DateFormat('d MMMM, yyyy').format(selectedDate);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            timeTopContainer(context, formattedTime),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                hijriDate.longMonthName +
                    ' ' +
                    hijriDate.hDay.toString() +
                    ' ' +
                    hijriDate.hYear.toString() +
                    ' ' +
                    'AH',
                style: TextStyle(
                    color: Color(0xff144d46),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              formattedDate,
              style: TextStyle(color: Color(0xff144d46)),
            ),
            calenderContainer(),
            Container(
              color: primaryColor,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: islamicEvents.length,
                itemBuilder: (context, index) {
                  final item = islamicEvents[index];
                  return ListTile(
                    title: Text(
                      item['title'],
                      style: TextStyle(
                        color: yellowC,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      item['subtitle'],
                      style: TextStyle(
                        color: white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    trailing: Text(
                      item['EnglishDate'],
                      style: TextStyle(
                        color: white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  if (index == islamicEvents.length - 1) {
                    return Container();
                  }
                  // For other items, return a divider.
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Divider(color: yellowC),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding calenderContainer() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TableCalendar(
        selectedDayPredicate: (day) => isSameDay(day, selectedDate),
        onDaySelected: _onDaySelected,
        focusedDay: selectedDate,
        calendarFormat: CalendarFormat.month,
        headerVisible: false,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        rowHeight: 50,
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, date, _) {
            final hijriDateForDay = HijriCalendar.fromDate(date);

            return Column(
              children: [
                Container(
                  child: Center(
                    child: Text(
                      '${hijriDateForDay.hDay}',
                      style: TextStyle(
                        fontSize: 20,
                        color: isSameDay(date, selectedDate)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 14,
                    color: isSameDay(date, selectedDate)
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ],
            );
          },
          selectedBuilder: (context, date, _) {
            final hijriDateForDay = HijriCalendar.fromDate(date);

            return Column(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      '${hijriDateForDay.hDay}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          },
          todayBuilder: (context, date, _) {
            final hijriDateForDay = HijriCalendar.fromDate(date);

            return Column(
              children: [
                Center(
                  child: Text(
                    '${hijriDateForDay.hDay}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Container timeTopContainer(BuildContext context, String formattedTime) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160.h,
      color: Color(0xff144d46),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 20),
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
              SizedBox(
                width: 95.w,
              ),
              Text(
                "Calendar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 17,
          ),
          Text(
            formattedTime,
            style: TextStyle(color: Color(0xfffcd88a), fontSize: 30),
          ),
        ],
      ),
    );
  }
}
