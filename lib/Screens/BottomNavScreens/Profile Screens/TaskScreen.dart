import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Item> items = [
    Item(
      firstText: 'Earned by Reciting Quran',
      isChecked: false,
      icon: Icons.play_arrow,
      secondText: '0.007\$',
    ),
    Item(
      firstText: 'Earned by Reciting Quran',
      isChecked: false,
      icon: Icons.play_arrow,
      secondText: '0.007\$',
    ),
    Item(
      firstText: 'Earned by Reciting Quran',
      isChecked: false,
      icon: Icons.play_arrow,
      secondText: '0.007\$',
    ),
    Item(
      firstText: 'Earned by Reciting Quran',
      isChecked: false,
      icon: Icons.play_arrow,
      secondText: '0.007\$',
    ),
    Item(
      firstText: 'Earned by Reciting Quran',
      isChecked: false,
      icon: Icons.play_arrow,
      secondText: '0.007\$',
    ),
    Item(
      firstText: 'Earned by Reciting Quran',
      isChecked: false,
      icon: Icons.play_arrow,
      secondText: '0.007\$',
    ),
    Item(
      firstText: 'Earned by Reciting Quran',
      isChecked: false,
      icon: Icons.play_arrow,
      secondText: '0.007\$',
    ),
    Item(
      firstText: 'Earned by Reciting Quran',
      isChecked: false,
      icon: Icons.play_arrow,
      secondText: '0.007\$',
    ),

    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool lastDividerRemove = index == items.length - 1;
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            items[index].firstText,
                            style: const TextStyle(
                              color: Color(0xff144d46),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                maxRadius: 10,
                                backgroundColor: Colors.red,
                                child: Icon(
                                  items[index].icon,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                items[index].secondText,
                                style:
                                    const TextStyle(color: Color(0xff144d46)),
                              ),
                            ],
                          ),
                        ),
                        if (!lastDividerRemove)
                          const Divider(
                            thickness: 1,
                            color: Color(0xff144d46),
                            height: 0,
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String firstText;
  bool isChecked;
  final IconData icon;
  final String secondText;

  Item({
    required this.firstText,
    required this.isChecked,
    required this.icon,
    required this.secondText,
  });
}
