import 'dart:io';

import 'package:aas/constants/colors.dart';
import 'package:aas/constants/pop-up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase_database/firebase_database.dart';

class UploadProfile extends StatefulWidget {
  const UploadProfile({super.key});

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  File? _image;
  final picker = ImagePicker();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        CustomSnackbar.successful(
            message:
                'Your video is submitted to admin want untill it approves.');
      } else {
        print('No Image Selected');
      }
    });
  }

  Future getImageCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        CustomSnackbar.successful(
            message:
                'Your video is submitted to admin want untill it approves.');
      } else {
        print('No Image Selected');
      }
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
                      getImageCamera();
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                    child: ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                    ),
                    onTap: () {
                      getImageGallery();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Upload Image"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              InkWell(
                child: Center(
                  child: Container(
                      // color: primaryColor,
                      height: MediaQuery.of(context).size.height / 1.7,
                      width: MediaQuery.of(context).size.width * 1,
                      child: _image != null
                          ? ClipRect(
                              child: Image.file(
                                _image!.absolute,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.blue,
                              ),
                            )),
                ),
                onTap: () {
                  dialogue(context);
                },
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    // TextFormField(
                    //   controller: titleController,
                    //   keyboardType: TextInputType.text,
                    //   decoration: InputDecoration(
                    //     labelText: 'Title',
                    //     hintText: 'Enter your post title',
                    //     border: OutlineInputBorder(),
                    //     hintStyle: TextStyle(
                    //         color: Colors.grey, fontWeight: FontWeight.bold),
                    //     labelStyle: TextStyle(
                    //         color: Colors.grey, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    // TextFormField(
                    //   minLines: 1,
                    //   maxLines: 5,
                    //   controller: descriptionController,
                    //   keyboardType: TextInputType.text,
                    //   decoration: InputDecoration(
                    //     labelText: 'Description',
                    //     hintText: 'Enter your post Description',
                    //     border: OutlineInputBorder(),
                    //     hintStyle: TextStyle(
                    //         color: Colors.grey, fontWeight: FontWeight.bold),
                    //     labelStyle: TextStyle(
                    //         color: Colors.grey, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor)),
                        onPressed: () {
                          dialogue(context);

                          // try{

                          //   int date = DateTime.now().microsecondsSinceEpoch;

                          //   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/blogapp$date');

                          //   UploadTask uploadtask = ref.putFile(_image!.absolute);

                          //   await Future.value(uploadtask);

                          //   var newURl = await ref.getDownloadURL();

                          //   final User? user = _auth.currentUser;

                          //   postRef.child('Post List').child(date.toString()).set({

                          //     'pId' : date.toString(),
                          //     'pImage': newURl.toString(),
                          //     'pTime' : date.toString(),
                          //     'pTitle' : titleController.text.toString(),
                          //     'pDescription' : descriptionController.text.toString(),

                          //   }).then((value) {

                          //     // toastMessage('Post Published');

                          //   }).onError((error, stackTrace) {
                          //     // toastMessage(error.toString());

                          //   });

                          // }catch(e){

                          //   // toastMessage(e.toString());
                          // }
                        },
                        child: Text("Upload"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void toastMessage(String message) {

  //   Fluttertoast.showToast(msg: message.toString(),
  //   toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.SNACKBAR,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.white,
  //     textColor: Colors.black,
  //     fontSize: 16.0

  //   );

  // }
}
