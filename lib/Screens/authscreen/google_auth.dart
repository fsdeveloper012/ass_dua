// import 'package:aas/Screens/BottomNavScreens/bottomnav.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// final GoogleSignIn googleSignIn = GoogleSignIn();

// Future<User?> signInWithGoogle() async {
//   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount!.authentication;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//     idToken: googleSignInAuthentication.idToken,
//     accessToken: googleSignInAuthentication.accessToken,
//   );

//   final userCredential = await _auth.signInWithCredential(credential);

//   final User? user = userCredential.user;

//   assert(!user!.isAnonymous);
//   assert(await user!.getIdToken() != null);

//   final User? currentUser = _auth.currentUser;

//   assert(currentUser!.uid == user!.uid);
//   print(user!.displayName);
//   print(user.email);
//   print(user.photoURL);

//   Get.to(BottomNavScreen());

//   return user;
// }

import 'dart:math';

import 'package:aas/Screens/BottomNavScreens/bottomnav.dart';
import 'package:aas/Services/loading_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

// handleGoogleBtnClick(context) {
//   _signInWithGoogle().then((userCredential) {
//     print('\nUser: ${userCredential.user}');
//     print('\nUser Credentials: ${userCredential.additionalUserInfo}');

//     if (userCredential.additionalUserInfo?.isNewUser ?? false) {
//       // New user, navigate to the next screen
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => BottomNavScreen()),
//       );
//     } else {
//       // User is already present in Firebase, show a message
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Account Already Exists"),
//             content:
//                 Text("You are already signed in with this Google account."),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("OK"),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   });
// }

// Future<UserCredential> _signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   if (googleUser == null) {
//     // The user canceled the Google sign-in
//     return Future.error("Google sign-in was canceled.");
//   }

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth =
//       await googleUser.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    InitLoading().showLoading('Loading...');
    // SmartDialog.showLoading(msg: "Please wait...");
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        InitLoading().dismissLoading();
        Get.to(BottomNavScreen());
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        print('this is user name: ${user!.displayName}');
        print('this is user email: ${user.email}');
        print('this is user photo-url: ${user.photoURL}');
        print('this is user number: ${user.phoneNumber}');
        print('this is user refreshtokewn: ${user.refreshToken}');
        print('this is user uid: ${user.uid}');
        SmartDialog.dismiss();
      }
    } on PlatformException catch (e) {
      InitLoading().dismissLoading();
      if (e.code == 'network-request-failed') {
        SmartDialog.dismiss();
        // Handle no internet connection
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'No internet connection. Please check your network.',
          ),
        );
      } else if (e.code == 'account-exists-with-different-credential') {
        InitLoading().dismissLoading();
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'The account already exists with a different credential.',
          ),
        );
      } else if (e.code == 'invalid-credential') {
        InitLoading().dismissLoading();
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred while accessing credentials. Try again.',
          ),
        );
      } else {
        InitLoading().dismissLoading();
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    } catch (e) {
      InitLoading().dismissLoading();
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error occurred using Google Sign-In. Try again.',
        ),
      );
    }
    InitLoading().dismissLoading();
    return user;
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}
