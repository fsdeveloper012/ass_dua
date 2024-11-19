import 'dart:developer';

import 'package:aas/Model/chat_user_modal.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/BottomNav2_screens/Chat%20Screen/chat_user_card.dart';
import 'package:aas/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//home screen -- where all available contacts are shown
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // for storing all users
  List<ChatUser> _list = [];

  // for storing searched items
  final List<ChatUser> _searchList = [];
  // for storing search status
  bool _isSearching = false;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<ChatUser> usersList = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //for hiding keyboard when a tap is detected on screen
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //app bar
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title: Text('Chat'),
        ),
        // appBar: AppBar(
        //   leading: const Icon(CupertinoIcons.home),
        //   title: _isSearching
        //       ? TextField(
        //           decoration: const InputDecoration(
        //               border: InputBorder.none, hintText: 'Name, Email, ...'),
        //           autofocus: true,
        //           style: const TextStyle(fontSize: 17, letterSpacing: 0.5),
        //           //when search text changes then updated search list
        //           onChanged: (val) {
        //             //search logic
        //             _searchList.clear();

        //             for (var i in _list) {
        //               if (i.name.toLowerCase().contains(val.toLowerCase()) ||
        //                   i.email.toLowerCase().contains(val.toLowerCase())) {
        //                 _searchList.add(i);
        //                 setState(() {
        //                   _searchList;
        //                 });
        //               }
        //             }
        //           },
        //         )
        //       : const Text('We Chat'),
        //   actions: [
        //     //search user button
        //     IconButton(
        //         onPressed: () {
        //           setState(() {
        //             _isSearching = !_isSearching;
        //           });
        //         },
        //         icon: Icon(_isSearching
        //             ? CupertinoIcons.clear_circled_solid
        //             : Icons.search)),
        //   ],
        // ),

        //body
        body: StreamBuilder(
          stream: firestore.collection('Users').snapshots(),

          //get id of only known users
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              //if data is loading
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());

              //if some or all data is loaded then show it
              case ConnectionState.active:
              case ConnectionState.done:
                final data = snapshot.data!.docs;
                usersList =
                    data.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];

                if (usersList.isNotEmpty) {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: usersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatUserCard(user: usersList[index]);
                    },
                  );
                } else {
                  return Center(child: Text('No Any User Found.'));
                }
            }
          },
        ),
      ),
    );
  }
}
