import 'package:aas/Screens/BottomNavScreens/homescreen/para_screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/surah_screen.dart';
import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class QuranScreen extends StatefulWidget {
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<QuranScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {}); // Rebuild the widget when the tab changes
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
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: primaryColor,
          child: Column(
            children: [
              Container(
                height: context.screenHeight * .1,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      SizedBox(width: context.screenWidth * .27),
                      Text(
                        'QURAN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/ic_quranp.png"),
                      )
                    ],
                  ),
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
                        width: context.screenWidth * .85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(
                                  0xFF111111), // Change to black border color
                            ),
                          ),
                          child: TabBar(
                            labelColor: white,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(
                              color: Color.fromRGBO(
                                  20, 77, 70, 1.0), // Active tab color
                              borderRadius: BorderRadius.circular(10),
                            ),
                            unselectedLabelColor: Color(0xFFABA9A9),
                            controller: _tabController,
                            tabs: [
                              Tab(text: 'Sura'),
                              Tab(text: 'Para'),
                              Tab(text: 'Bookmarks'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            SuraScreen(),
                            ParaScreen(),
                            BookmarksScreen(),
                          ],
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

// class SuraScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Replace with your Sura screen implementation
//     return Center(
//       child: Text('Sura Screen Content'),
//     );
//   }
// }

class BookmarksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
            height: 170,
            width: 170,
            image: AssetImage('assets/images/bookmark.png')),
        SizedBox(
          height: 100,
        ),
        Text(
          'There are no Bookmarks yet, go ahead and add it!',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
