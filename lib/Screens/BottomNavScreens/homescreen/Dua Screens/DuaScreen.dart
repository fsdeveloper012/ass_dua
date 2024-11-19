import 'package:aas/Constants/colors.dart';
import 'package:aas/Model/dua_modal.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/Dua%20Screens/dua_tab_screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/Dua%20Screens/hadith_tab_screen.dart';
import 'package:aas/constants/text_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:velocity_x/velocity_x.dart';

class DuaScreen extends StatefulWidget {
  const DuaScreen({Key? key}) : super(key: key);

  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen>
    with SingleTickerProviderStateMixin {
  duaAZikarModel? duaZikr;
  int _expandedIndex = -1;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final bool _customIcon = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dua & Zikr',
              style: TextStyle(fontSize: 20.sp, color: Colors.yellow),
            ),
            SizedBox(width: context.screenWidth * .03),
            Image.asset(
              'assets/images/dua.png',
              color: Colors.white,
              width: context.screenWidth * .09,
              height: context.screenHeight * .09,
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                    border: Border.all(color: white, width: 2)),
                child: Center(
                  child: Icon(Icons.arrow_back, color: white, size: 20),
                ),
              ),
            )),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: primaryColor,
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'رَبِّ انْصُرْنِیْ عَلَی الْقَوْمِ الْمُفْسِدِیْنَِ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Lord, help me against the corrupt people',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: context.screenHeight * .009,
                    ),
                    Center(
                      child: Text(
                        'The Quran 29:30',
                        style: TextStyle(
                            fontSize: 13, color: Colors.yellow.withOpacity(.6)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      30.heightBox,
                      Container(
                        height: context.screenHeight * .05,
                        width: context.screenWidth * .8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFF111111),
                            ),
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                              color: Color.fromRGBO(20, 77, 70, 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            unselectedLabelColor: Color(0xFFABA9A9),
                            controller: _tabController,
                            tabs: [
                              Tab(text: 'Dua'),
                              Tab(text: 'Hadith'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [DuaTab(), HadithTab()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
