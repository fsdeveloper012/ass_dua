import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DonateScreen extends StatelessWidget {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Donate",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(
                                252, 216, 138, 1.0), // or any other color

                            fontSize: 24 // remove underline
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.screenHeight * .1,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: context.screenWidth * .06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                      20, 77, 70, 1.0), // or any other color
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27 // remove underline
                                  ),
                            ),
                            SizedBox(
                              height: context.screenHeight * .04,
                              width: context.screenWidth * .5,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: black)),
                                  hintText: "100",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 16),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: black,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight * .06,
                      ),
                      Container(
                        height: context.screenHeight * .05,
                        width: context.screenWidth * .8,
                        child: TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: black)),
                              hintText: "Reciver id",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 16),
                              filled: true,
                              fillColor: primaryColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: black))),
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight * .03,
                      ),
                      Container(
                        height: context.screenHeight * .05,
                        width: context.screenWidth * .8,
                        child: TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: black)),
                              filled: true,
                              hintText: "Pin",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 16),
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: primaryColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: black))),
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight * .06,
                      ),
                      Container(
                        // width: 100,
                        height: 45,
                        // color: black,
                        child: Image.asset('assets/icons/ic_submit.png'),
                      )
                    ],
                  ), // Adjust the radius as needed
                ),
              ),
            ],
          ), // Set the background color here
        ),
      ),
    );
  }
}
