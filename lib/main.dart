import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:serious_dating/screen/gender.dart';
import 'package:serious_dating/screen/interest.dart';
import 'package:serious_dating/screen/login.dart';
import 'package:serious_dating/screen/reset_verify_otp.dart';
import 'package:serious_dating/screen/splash.dart';

import 'screen/DashBoard/bottom_navigation.dart';
import 'screen/DashBoard/user_match_screen.dart';
import 'screen/reset_password.dart';
import 'screen/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        Login.routeName: (context) => const Login(),
        SelectGender.routeName: (context) => const SelectGender(),
        SignIn.routeName: (context) => const SignIn(),
        SelectGender.routeName: (context) => const SelectGender(),
        Interest.routeName: (context) => const Interest(),
        BottomNavigator.routeName: (context) => const BottomNavigator(),
        ResetPassword.routeName: (context) => const ResetPassword(),
        UserMatchScreen.routeName: (context) => const UserMatchScreen(),
        VerifyOTP.routeName: (context) => const VerifyOTP(),
      },
    );
  }
}
