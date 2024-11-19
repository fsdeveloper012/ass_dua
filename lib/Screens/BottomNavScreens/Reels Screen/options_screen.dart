import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/colors.dart';

class OptionsScreen extends StatefulWidget {
  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  bool isLiked = false;
  int likeCount = 0; // Initialize with the initial like count
  int dislikeCount = 0;
  bool isDisliked = false;
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'assets/images/address.png',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Tunde Martins',
      'pic': 'assets/images/address.png',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 250),
                    Row(
                      children: [
                        CircleAvatar(
                          child:
                              Icon(Icons.person, size: 18, color: Colors.white),
                          radius: 16,
                        ),
                        SizedBox(width: 6),
                        Text('flutter_developer02',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(width: 90),

                        //  Icon(Icons.verified, size: 15, color: Colors.white),
                        // SizedBox(width: 6),
                        //  TextButton(
                        //    onPressed: () {},
                        //    child: Text(
                        //      'Follow',
                        //      style: TextStyle(
                        //        color: Colors.white,
                        //      ),
                        //    ),
                        //  ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text('Flutter is beautiful and fast 💙❤💛 ..',
                        style: TextStyle(color: Colors.white)),

                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.music_note,
                    //       size: 15,
                    //       color: Colors.white,
                    //     ),
                    //
                    //     // Text(
                    //     //   'Original Audio - some music track--',
                    //     //   style: TextStyle(color: Colors.white),
                    //     // ),
                    //
                    //   ],
                    // ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 70, left: 20),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://picsum.photos/id/237/200/300',
                            ),
                            radius: 25,
                          ),
                          Container(
                            width: 50,
                            margin: EdgeInsets.only(
                              top: 35,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Color.fromRGBO(20, 77, 70, 1.0),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Follow",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                )),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isLiked) {
                              likeCount--;
                            } else {
                              likeCount++;
                            }
                            isLiked = !isLiked;
                            if (isDisliked) {
                              isDisliked = false;
                              dislikeCount--;
                            } // Toggle the like status
                          });
                        },
                        child: ImageIcon(
                          AssetImage("assets/images/thumb.png"),

                          color: isLiked
                              ? Colors.red
                              : Colors
                                  .white, // Change the icon color based on isLiked
                          size: 30,
                        ),
                      ),
                      Text(
                        likeCount.toString(),
                        style: TextStyle(color: Colors.white),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.separated(
                                        itemCount: 10,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Divider(
                                            color: Colors.black,
                                            thickness: 0.25,
                                          );
                                        },
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: Container(
                                                width: 48.w,
                                                height: 58.h,
                                                decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Image.asset(
                                                    'assets/images/address.png',
                                                  ),
                                                )),
                                            title: Text(
                                              "Free Delivery",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              "We have an Exciting Offers for you near to..",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      height: 60,
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              autofocus: true,
                                              controller: controller,
                                              decoration: InputDecoration(
                                                hintText: "Write message...",
                                                hintStyle: TextStyle(
                                                    color: Colors.black54),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          FloatingActionButton(
                                            onPressed: () {},
                                            child: Icon(Icons.send,
                                                color: Colors.white, size: 18),
                                            backgroundColor: Colors.blue,
                                            elevation: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: ImageIcon(AssetImage("assets/images/coment.png"),
                            color: Colors.white, size: 30),
                      ),

                      // Counter(
                      //    min: 0,
                      //    max: 10,
                      //    bound: 3,
                      //    step: 1,
                      //    onValueChanged: print,
                      //    configuration: DefaultConfiguration(),

                      //  ),

                      Text(
                        "153",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      ImageIcon(
                        AssetImage("assets/images/share.png"),
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        "193",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
