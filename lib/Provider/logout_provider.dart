// import 'package:aas/Services/loading_services.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class LogoutProvider extends ChangeNotifier {
//   Future<void> logoutUser() async {
//     final String apiUrl = 'https://aasonline.co/api/logout';

//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String token = prefs.getString('sessionToken')!;

//     print('this is token from logout: $token');
//     try {
//       InitLoading().showLoading('Loading...');
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $token', // Add your authorization header
//           // 'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         // Successful logout
//         prefs.remove('sessionToken');
//         print('Logout successful');
//         print('token after logout');
//         InitLoading().dismissLoading();
//       } else {
//         // Handle error
//         print('Logout failed: ${response.statusCode}');
//         print('Response body: ${response.body}');
//         InitLoading().dismissLoading();
//       }
//     } catch (error) {
//       // Handle network or other errors
//       InitLoading().dismissLoading();
//       print('Error during logout: $error');
//     }

//     // Notify listeners that the state has changed
//     InitLoading().dismissLoading();
//     notifyListeners();
//   }
// }
