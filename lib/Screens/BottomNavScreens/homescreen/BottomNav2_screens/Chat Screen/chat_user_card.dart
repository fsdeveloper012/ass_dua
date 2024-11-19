import 'package:aas/Model/chat_user_modal.dart';
import 'package:aas/Screens/BottomNavScreens/homescreen/BottomNav2_screens/Chat%20Screen/user_chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserChatScreen(user: widget.user)));
        },
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(CupertinoIcons.person),
          ),
          title: Text(widget.user.name),
          subtitle: Text(
            'last message',
            maxLines: 1,
          ),
          trailing: Text(
            '12:00 pm',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
