import 'package:aas/Model/dua_modal.dart';
import 'package:aas/constants/colors.dart';
import 'package:aas/constants/text_constants.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class DuaTab extends StatefulWidget {
  DuaTab({super.key});

  @override
  State<DuaTab> createState() => _DuaTabState();
}

class _DuaTabState extends State<DuaTab> with TickerProviderStateMixin {
  int selected = -1;
  late List<GlobalKey> expanionTitle;

  @override
  void initState() {
    super.initState();
    expanionTitle =
        List<GlobalKey>.generate(data.length, (index) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: context.screenHeight * .025,
          left: context.screenWidth * .03,
          right: context.screenWidth * .03,
        ),
        child: Card(
          elevation: 0,
          color: white,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: ListView.builder(
              key: Key('builder ${selected.toString()}'),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                bool isCurrentlyExpanded = index == selected;
                bool lastItem = index == data.length - 1;

                return Column(
                  children: [
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ExpansionTile(
                          key: Key(index.toString()),
                          onExpansionChanged: (newState) {
                            if (newState) {
                              setState(() {
                                selected = index;
                              });
                            } else {
                              setState(() {
                                selected = -1;
                              });
                            }
                          },
                          initiallyExpanded: selected == index,
                          title: Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(data[index].image!),
                                  backgroundColor: Colors.transparent,
                                  radius: context.screenWidth * 0.06,
                                ),
                                SizedBox(width: context.screenWidth * 0.03),
                                Expanded(
                                  child: Text(
                                    data[index].text.toString(),
                                    style: TextStyle(
                                      overflow: TextOverflow.fade,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: primaryColor,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () async {},
                                          child: Text(
                                            data[index].arabicDua.toString(),
                                            style: whiteArabicText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Center(
                                  child: Text(
                                    data[index].inUrdu.toString(),
                                    style: normaltextPrimaryC,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Center(
                                  child: Text(
                                    data[index].inEnglish.toString(),
                                    style: normaltextPrimaryC,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 5), // Added a SizedBox for spacing
                    if (index < data.length - 1)
                      Divider(
                        thickness: 1,
                        color: Color(0xff8D8D8D),
                      ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
