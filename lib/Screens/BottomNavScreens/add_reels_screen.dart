import 'dart:async';
import 'dart:io';

import 'package:aas/Screens/BottomNavScreens/bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../constants/pop-up.dart';

class AddReelsScreen extends StatefulWidget {
  const AddReelsScreen({super.key});

  @override
  State<AddReelsScreen> createState() => _AddReelsScreenState();
}

class _AddReelsScreenState extends State<AddReelsScreen> {
  VideoPlayerController? _videoPlayerController;
  VideoPlayerController? _cameraVideoPlayerController;

  final picker = ImagePicker();

  GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  File? _video;

  File? _cameraVideo;
  Future<void> _pickVideoFromGallery() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    _video = File(pickedFile!.path);

    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController!.play();
        _videoPlayerController!.setLooping(true);
      });

    Get.to(() => BottomNavScreen());

    CustomSnackbar.successful(
        message: "Video is Uploaded wait until it approval");
  }

  Future<void> _pickVideoFromCamera() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);

    _cameraVideo = File(pickedFile!.path);

    _cameraVideoPlayerController = VideoPlayerController.file(_cameraVideo!)
      ..initialize().then((_) {
        setState(() {});
        _cameraVideoPlayerController!.play();
      });

    Get.to(() => BottomNavScreen());
    CustomSnackbar.successful(
        message: "Video is Uploaded wait until it approval");
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 100), () {
      dialogue(context);
    });
  }

  void dialogue(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    child: ListTile(
                      leading: Icon(Icons.camera_alt),
                      title: Text('Camera'),
                    ),
                    onTap: () {
                      _pickVideoFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                    child: ListTile(
                      leading: Icon(Icons.photo),
                      title: Text('Gallery'),
                    ),
                    onTap: () {
                      _pickVideoFromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: _video != null &&
                        _videoPlayerController != null &&
                        _videoPlayerController!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController!),
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
