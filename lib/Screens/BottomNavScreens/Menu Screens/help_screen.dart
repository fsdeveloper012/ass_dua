import 'package:aas/Screens/BottomNavScreens/Menu%20Screens/settings_screen.dart';
import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromRGBO(20, 77, 70, 1.0),
          child: Column(
            children: [
              Container(
                height: context.screenHeight * .1,
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => SettingsScreen());
                          },
                          child: Image.asset("assets/images/ic_back.png"),
                        ),
                      ),
                      SizedBox(
                        width: context.screenWidth * .3,
                      ),
                      Center(
                        child: Row(
                          children: [
                            Text(
                              'Help',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: white,
                                fontSize: 25,
                              ),
                            ),
                            10.widthBox,
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset("assets/images/ic_help.png"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      50.heightBox,
                      // FAQs Dropdown
                      FAQDropdown(),
                      Divider(
                        indent: 0,
                        endIndent: 0,
                        color: Vx.gray300,
                      ),
                      // Other sections (Email, Whatsapp, etc.)
                      // ...
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

class FAQDropdown extends StatefulWidget {
  @override
  _FAQDropdownState createState() => _FAQDropdownState();
}

class _FAQDropdownState extends State<FAQDropdown> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidth * .05,
      ),
      padding: EdgeInsets.all(
        context.screenWidth * .03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "FAQ's",
                  style: TextStyle(
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 30,
                  color: primaryColor,
                ),
              ],
            ),
          ),
          if (isExpanded)
            Column(
              children: [
                FAQItem(
                  question: 'What is the purpose of this app?',
                  answer:
                      'The name of this application is AAS and basically it is Quran App.',
                ),
                FAQItem(
                  question: 'How can I contact with you?',
                  answer:
                      'You can contact with us through our mail and number.',
                ),
                FAQItem(
                  question: 'What is the main purpose of this app?',
                  answer:
                      'The purpose of this application is to teach Peoples.',
                ),
                // Add more FAQ items here
              ],
            ),
          Divider(
            indent: 0,
            endIndent: 0,
            color: Vx.gray300,
          ),
          GestureDetector(
            onTap: () async {
              await Share.share('companys email.com');
            },
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: context.screenWidth * .05),
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child: "Email"
                          .text
                          .size(22)
                          .color(primaryColor)
                          .bold
                          .make()),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () async {
              await Share.share('+923036555666');
            },
            child: Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child: "Whatsapp"
                          .text
                          .size(22)
                          .color(primaryColor)
                          .bold
                          .make()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          question,
          style: TextStyle(
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          answer,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        Divider(
          indent: 0,
          endIndent: 0,
          color: Vx.gray300,
        ),
      ],
    );
  }
}
