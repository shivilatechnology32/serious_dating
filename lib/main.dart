import 'package:flutter/material.dart';
import 'package:serious_dating/screen/gender_screen.dart';
import 'package:serious_dating/screen/interest.dart';
import 'package:serious_dating/screen/login.dart';
import 'package:serious_dating/screen/profile_details.dart';
import 'package:serious_dating/screen/splash.dart';

import 'screen/sign_in.dart';

void main() {
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
        ProfileDetails.routeName: (context) => const ProfileDetails(),
        Interest.routeName: (context) => const Interest(),
      },
    );
  }
}
