import 'package:aas/Provider/forget_password_provider.dart';
import 'package:aas/Provider/login_provider.dart';
import 'package:aas/Provider/logout_provider.dart';
import 'package:aas/Provider/otp_provider.dart';
import 'package:aas/Provider/signup_provider.dart';
import 'package:aas/Provider/timer_provider.dart';
import 'package:aas/Screens/BottomNavScreens/bottomnav.dart';
import 'package:aas/Screens/splashscreen.dart';
import 'package:aas/Services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('sessionToken');
  print(token);

  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider for UserProvider
        ChangeNotifierProvider(
          create: (context) => UserProvider(apiService: ApiService()),
        ),
        // ChangeNotifierProvider for OtpCodeProvider
        ChangeNotifierProvider(
          create: (context) => OtpCodeProvider(apiService: ApiService()),
        ),
        // ChangeNotifierProvider for forgetPassword
        ChangeNotifierProvider(
            create: (context) =>
                ForgetPasswordProvider(apiService: ApiService())),
        // ChangeNotifierProvider for Login
        ChangeNotifierProvider(
            create: (context) => LoginProvider(apiService: ApiService())),

        // ChangeNotifierProvider for timer

        ChangeNotifierProvider(create: (context) => TimerProvider()),
        // ChangeNotifierProvider for logout

        // ChangeNotifierProvider(create: (context) => LogoutProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'AAS',
            debugShowCheckedModeBanner: false,
            home: token == null ? SplashScreen() : BottomNavScreen(),
            builder: EasyLoading.init(),
          );
        });
  }
}
