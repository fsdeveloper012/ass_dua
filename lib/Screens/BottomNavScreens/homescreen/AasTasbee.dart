import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AasTasbee extends StatefulWidget {
  const AasTasbee({Key? key}) : super(key: key);

  @override
  State<AasTasbee> createState() => _AasTasbeeState();
}

class _AasTasbeeState extends State<AasTasbee> with TickerProviderStateMixin {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
    log(counter);
  }

  void resetMethod() {
    setState(() {
      counter = 0;
    });
  }

  AnimationController? _controller;
  AnimationController? _controllerReset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _controllerReset = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controllerReset!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/tasbee background imaage.png",
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0).w,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius: 15.r,
                            backgroundColor: Color(0xff13473F),
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 20.w,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: context.screenHeight * .05,
                    left: context.screenWidth * .3,
                    right: context.screenWidth * .3,
                    child: Row(
                      children: [
                        Text(
                          "AAS Tasbeeh",
                          style: TextStyle(
                            color: Color(0xffFBD077),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Image.asset(
                          "assets/images/tasbeeh1.png",
                          color: Colors.white,
                          height: context.screenHeight * 0.05,
                          width: context.screenWidth * 0.08,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.screenHeight * .17,
                    left: context.screenWidth * .10,
                    right: context.screenWidth * .10,
                    child: Image.asset(
                      "assets/images/tasbee container.png",
                      height: context.screenHeight * 0.27,
                      width: context.screenWidth * 0.56,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: context.screenHeight * .24,
                    left: context.screenWidth * .30,
                    right: context.screenWidth * .30,
                    child: Container(
                      // color: Colors.blueAccent,
                      // height: 50,

                      // width: 100,
                      child: Center(
                        child: Text(
                          counter.toString(),
                          style: TextStyle(
                              fontSize: 77,
                              color: Colors.white,
                              fontFamily: 'Giddyup Std Regular'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: context.screenHeight * .28,
                    left: context.screenWidth * .28,
                    right: context.screenWidth * .28,
                    child: GestureDetector(
                      onTap: () {
                        incrementCounter();
                        _controller!.forward();
                        Future.delayed(Duration(milliseconds: 200), () {
                          _controller!.reverse();
                        });
                        print('Shrink');
                      },
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 1.0, end: 0.7)
                            .animate(_controller!),
                        child: Container(
                            height: context.screenHeight * 0.4,
                            width: context.screenWidth * 0.4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffefa931),
                                  Color(0xfff5d961)
                                ], // Gradient colors
                                begin: Alignment
                                    .topLeft, // Gradient start position
                                end: Alignment
                                    .bottomRight, // Gradient end position
                              ),
                            ),
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(20),
                            child: GestureDetector(
                              onTap: () {
                                incrementCounter();
                                _controller!.forward();
                                Future.delayed(Duration(milliseconds: 200), () {
                                  _controller!.reverse();
                                });
                                print('Shrink');
                              },
                              child: ScaleTransition(
                                scale: Tween<double>(
                                  begin: 1.0,
                                  end: 0.7,
                                ).animate(_controller!),
                                child: Center(
                                  child: Text(
                                    "Tasbeeh",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: context.screenHeight * .15,
                    left: context.screenWidth * .2,
                    right: context.screenWidth * .2,
                    child: Text(
                      "Tap On Counter Button \n To Increase Counter",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                      bottom: context.screenHeight * .05,
                      left: context.screenWidth * .2,
                      right: context.screenWidth * .2,
                      child: GestureDetector(
                        onTap: () {
                          resetMethod();
                          _controllerReset!.forward();
                          Future.delayed(Duration(milliseconds: 200), () {
                            _controllerReset!.reverse();
                          });
                        },
                        child: ScaleTransition(
                          scale: Tween<double>(
                            begin: 1.0,
                            end: 0.7,
                          ).animate(_controllerReset!),
                          child: Image(
                            height: 45,
                            image: AssetImage("assets/images/reset button.png"),
                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
