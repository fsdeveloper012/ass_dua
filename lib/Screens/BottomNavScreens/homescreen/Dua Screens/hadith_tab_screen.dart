import 'package:aas/Model/dua_modal.dart';
import 'package:aas/Model/hadith_modal.dart';
import 'package:aas/constants/colors.dart';
import 'package:aas/constants/text_constants.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
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
              itemCount: hadithData.length,
              itemBuilder: (BuildContext context, int index) {
                bool isCurrentlyExpanded = index == selected;
                bool lastItem = index == hadithData.length - 1;

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
                                      AssetImage(hadithData[index].image!),
                                  backgroundColor: Colors.transparent,
                                  radius: context.screenWidth * 0.06,
                                ),
                                SizedBox(
                                  width: context.screenWidth * 0.03,
                                ),
                                Expanded(
                                  child: Text(
                                    hadithData[index].text.toString(),
                                    style: TextStyle(
                                        overflow: TextOverflow.fade,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
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
                                    // height: 40,
                                    // width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        color: primaryColor),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () async {},
                                        child: Text(
                                          hadithData[index]
                                              .arabicHadith
                                              .toString(),
                                          style: whiteArabicText,
                                        ),
                                      ),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Center(
                                    child: Text(
                                  hadithData[index].inUrdu.toString(),
                                  style: normaltextPrimaryC,
                                )),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Center(
                                    child: Text(
                                  hadithData[index].inEnglish.toString(),
                                  style: normaltextPrimaryC,
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 5), // Added a SizedBox for spacing
                    if (!lastItem)
                      Divider(
                        thickness: 1,
                        color: Color(0xff8D8D8D),
                        // indent: 30,
                        // endIndent: 30,
                      ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
