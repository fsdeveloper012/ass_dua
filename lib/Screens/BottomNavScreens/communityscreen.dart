import 'dart:math';

import 'package:aas/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphview/GraphView.dart';
import 'package:velocity_x/velocity_x.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              upperContainer(height, width, context),
              // treeContainer(height, width),
            ],
          ),
        ),
      ),
    );
  }

  upperContainer(double height, double width, BuildContext context) {
    return Container(
      // height: height * 0.55,
      width: width,
      color: primaryColor,
      child: Column(
        children: [
          Container(
            height: context.screenHeight * .080,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Community Members',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(252, 216, 138, 1.0),
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset(
                    'assets/images/flag.png',
                    height: 22.h,
                    width: 22.w,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
          Container(
            //margin: EdgeInsets.symmetric(horizontal: 2),
            //padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.heightBox,
                Center(
                  child: Container(
                    height: 70,
                    width: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: "Today's Prayers"
                              .text
                              .bold
                              .size(20)
                              .color(
                                Color.fromRGBO(20, 77, 70, 1.0),
                              )
                              .make(),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.transparent,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: black, width: 2.0)),
                              ),
                              Text(
                                "3/5",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                  // height: 0,
                  // width: 600,
                  // color: Colors.purple,
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: context.screenWidth / 2,
                        // color: Colors.red,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              // top: 7,
                              left: 10,
                              height: 65,
                              width: 150,
                              child: Image.asset(
                                "assets/images/left members.png",

                                // fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              left: 140,
                              // height:80,
                              // width: 140,
                              child: Container(
                                //height: 70,
                                width: 45,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff144d46),
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.yellow, width: 2.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          //width: 110,
                          // color: Colors.red,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                // top: 7,
                                left: 10,
                                height: 65,
                                width: 150,
                                child: Image.asset(
                                  "assets/images/right members.png",

                                  // fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                left: 140,
                                // height:80,
                                // width: 140,
                                child: Container(
                                  //  height: 70,
                                  width: 45,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Color(0xff144d46),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.yellow, width: 2.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Salaat: ",
                        style: TextStyle(
                            color: Color(0xff144b45),
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    )
                  ],
                ),
                Container(
                  // height: 60,
                  // width: 600,
                  // color: Colors.purple,
                  child: Row(
                    children: [
                      Container(
                        height: 90,
                        width: width / 2,
                        // color: Colors.orange,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              // top: 7,
                              left: 10,
                              height: 65,
                              width: 150,
                              child: Image.asset(
                                "assets/images/left members.png",

                                // fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              left: 140,
                              // height:80,
                              // width: 140,
                              child: Container(
                                //height: 70,
                                width: 45,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff144d46),
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.yellow, width: 2.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 90,
                          //width: 110,
                          // color: Colors.red,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                // top: 7,
                                left: 10,
                                height: 65,
                                width: 150,
                                child: Image.asset(
                                  "assets/images/right members.png",

                                  // fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                left: 140,
                                // height:80,
                                // width: 140,
                                child: Container(
                                  //  height: 70,
                                  width: 45,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Color(0xff144d46),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.yellow, width: 2.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10, left: 10),
                //   child: Row(
                //     children: [
                //       Container(
                //         child: Icon(Icons.arrow_back),
                //         decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             border:
                //                 Border.all(color: Colors.black, width: 2.0)),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            height: height * 0.5,
            width: width,
            color: white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InteractiveViewer(
                    constrained: false,
                    boundaryMargin: EdgeInsets.all(100),
                    minScale: 0.01,
                    maxScale: 2.6,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: GraphView(
                        graph: graph,
                        algorithm: BuchheimWalkerAlgorithm(
                          builder,
                          TreeEdgeRenderer(builder),
                        ),
                        paint: Paint()
                          ..color = Colors.black
                          ..strokeWidth = 3
                          ..style = PaintingStyle.stroke,
                        builder: (Node node) {
                          var a = node.key!.value as int;
                          return rectangleWidget(a);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // treeContainer(double height, double width) {
  //   return Container(
  //     height: height * 0.5,
  //     width: width,
  //     color: white,
  //     child: Column(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Expanded(
  //           child: InteractiveViewer(
  //             constrained: false,
  //             boundaryMargin: EdgeInsets.all(100),
  //             minScale: 0.01,
  //             maxScale: 2.6,
  //             child: GraphView(
  //               graph: graph,
  //               algorithm: BuchheimWalkerAlgorithm(
  //                 builder,
  //                 TreeEdgeRenderer(builder),
  //               ),
  //               paint: Paint()
  //                 ..color = Colors.black
  //                 ..strokeWidth = 3
  //                 ..style = PaintingStyle.stroke,
  //               builder: (Node node) {
  //                 var a = node.key!.value as int;
  //                 return rectangleWidget(a);
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Random r = Random();

  Widget rectangleWidget(int a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: CircleAvatar(
        // backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 23,
          // backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU'),
        ),
      ),
    );
  }

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node7 = Node.Id(7);
    final node8 = Node.Id(8);
    final node9 = Node.Id(9);

    // Adjust the positions of nodes 2 and 3
    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3);

    graph.addEdge(node2, node4);
    graph.addEdge(node2, node5);
    // graph.addEdge(node2, node6);

    graph.addEdge(node3, node7);
    graph.addEdge(node3, node8);
    // graph.addEdge(node3, node9);

    builder
      ..siblingSeparation = (50)
      ..levelSeparation = (50)
      ..subtreeSeparation = (50)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
