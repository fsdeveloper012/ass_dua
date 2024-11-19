import 'package:flutter/material.dart';

import 'Constants/colors.dart';



class CustomButton2 extends StatelessWidget {
  final String text;

  // final onPressed;

  CustomButton2({
    required this.text, required Color hintTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0), color: primaryColor),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: white)),
        ));
  }
}
