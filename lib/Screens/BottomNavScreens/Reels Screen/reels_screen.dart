import 'package:aas/Screens/BottomNavScreens/Reels%20Screen/content_screen.dart';
import 'package:aas/add_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import 'custom_search.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int _currentIndex = 2;
  int _selectedTab = 0;

  final List<String> videos = [
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-man-reading-coral-inside-a-mosque-34208-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-anciana-rezando-el-cor%C3%A1n-con-un-rosario-12534-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-3d-animation-of-a-quran-near-a-temple-35194-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-quran-3d-animation-concept-35291-large.mp4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            _buildTabText("Following", 1),
            _buildTabText("Trending", 0),
            SizedBox(width: 70),
            IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 27,
              ),
            )
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.black,
                    child: ContentScreen(
                      src: videos[index],
                    ),
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
              ),

              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       InkWell(
              //
              //           child: _buildTabText('Following', 0),
              //         onTap: (){
              //
              //             Navigator.push(context, MaterialPageRoute(builder: (context) => AddScreen2()));
              //
              //         },
              //
              //       ),
              //       InkWell(
              //
              //         onTap: (){
              //
              //
              //           print("Yes");
              //
              //         },
              //         child: Container(
              //             margin: EdgeInsets.only(right: 80),
              //             child: _buildTabText('Trending', 1)),
              //       ),
              //       IconButton(
              //         onPressed: () {
              //           // method to show the search bar
              //           showSearch(
              //               context: context,
              //               // delegate to customize the search bar
              //               delegate: CustomSearchDelegate());
              //         },
              //         icon: const Icon(
              //           Icons.search,
              //           color: Colors.white,
              //           size: 27,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
      //       icon: ImageIcon(
      //         AssetImage(
      //             "assets/icons/home.png"), // Replace with your image path
      //         size: 24, // Adjust the size as needed
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
      //       icon: Icon(Icons.people_outline),
      //       label: 'Followers',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
      //       icon: Container(
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12),
      //               border: Border.all(color: Colors.white, width: 1.0)),
      //           child: Icon(Icons.add)),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
      //       icon: ImageIcon(
      //         AssetImage("assets/images/inbox.png"),
      //         size: 24,
      //       ),
      //       // icon: Icon(CupertinoIcons.profile_circled),
      //       label: 'Inbox',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
      //       icon: Icon(CupertinoIcons.profile_circled),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildTabText(String text, int tabIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = tabIndex;
          if (tabIndex == 0) {
            print("following");
          } else if (tabIndex == 1) {
            Get.to(() => AddScreen2());
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 40),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: _selectedTab == tabIndex ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
