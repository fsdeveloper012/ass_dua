import 'package:aas/Model/chat_user_modal.dart';
import 'package:aas/Screens/BottomNavScreens/Reels%20Screen/reels_screen.dart';
import 'package:aas/Screens/BottomNavScreens/bottomnav.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/BottomNav2_screens/followers_screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/BottomNav2_screens/reels_profile_screen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/BottomNav2_screens/Chat%20Screen/chat_Screen.dart';
import 'package:aas/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNav2 extends StatefulWidget {
  @override
  _BottomNav2State createState() => _BottomNav2State();
}

class _BottomNav2State extends State<BottomNav2> {
  int _currentIndex = 2;

  final List<Widget> _screens2 = [
    BottomNavScreen(),
    Followers(),
    AddScreen(),
    ChatScreen(),
    ReelsProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens2[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavScreen(),
              ),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        selectedItemColor: yellowC,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
            icon: ImageIcon(
              AssetImage(
                  "assets/icons/home.png"), // Replace with your image path
              size: 24, // Adjust the size as needed
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
            icon: Icon(Icons.people_outline),
            label: 'Followers',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
            icon: Container(
                // decoration: BoxDecoration(
                //     // borderRadius: BorderRadius.circular(12),
                //     border: Border.all(color: Colors.white, width: 1.0)),
                child: Icon(
              Icons.add,
              size: 30,
            )),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
            icon: ImageIcon(
              AssetImage("assets/images/inbox.png"),
              size: 24,
            ),
            // icon: Icon(CupertinoIcons.profile_circled),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
