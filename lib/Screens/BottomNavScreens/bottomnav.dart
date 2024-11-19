import 'package:aas/Screens/BottomNavScreens/Reels%20Screen/reels_screen.dart';
import 'package:aas/Screens/BottomNavScreens/add_reels_screen.dart';
import 'package:aas/Screens/BottomNavScreens/communityscreen.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/homescrreen.dart';
import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/menu_screen.dart';
import 'package:aas/Screens/BottomNavScreens/Profile%20Screens/Profile_Screen.dart';
import 'package:aas/Screens/BottomNavScreens/Profile%20Screens/TaskScreen.dart';
import 'package:aas/constants/colors.dart';
import 'package:aas/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CommunityScreen(),
    AddReelsScreen(),
    ProfileScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _showExitDialogue(context);
      },
      child: Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Set type to fixed
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
            selectedItemColor: yellowC,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
                icon: ImageIcon(
                  AssetImage("assets/icons/home.png"),
                  size: 24,
                ),
                label: 'Home', // Label for the 'Home' icon
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
                icon: Icon(Icons.group),
                label: 'Community', // Label for the 'Community' icon
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
                icon: Icon(Icons.add),
                label: 'Add', // Label for the 'Add' icon
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
                icon: ImageIcon(
                  AssetImage("assets/icons/profile pic.png"),
                  size: 24,
                ),
                label: 'Profile', // Label for the 'Profile' icon
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(20, 77, 70, 1.0),
                icon: ImageIcon(
                  AssetImage("assets/icons/menu.png"),
                  size: 24,
                ),
                label: 'Menu', // Label for the 'Menu' icon
              ),
            ],
          )),
    );
  }

  _showExitDialogue(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          final screenSize =
              MediaQuery.of(dialogContext).size; // Use dialogContext here
          return AlertDialog(
            insetPadding: const EdgeInsets.all(30.0),
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0.0),
            content: Container(
              height: 150.0,
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "Do you want to exit from app?",
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.8), fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: Container(
                              height: 33,
                              width: 63,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    7.0,
                                  ),
                                  border: Border.all(color: red)),
                              child: const Center(
                                child: Text(
                                  'Yes',
                                  style: redText,
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 30.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 33,
                            width: 63,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  7.0,
                                ),
                                border: Border.all(color: black)),
                            child: const Center(
                              child: Text(
                                'No',
                                style: mediumText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

const redText =
    TextStyle(fontSize: 17, color: red, fontWeight: FontWeight.w500);
