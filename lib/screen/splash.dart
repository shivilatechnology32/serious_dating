import 'package:flutter/material.dart';
import 'package:serious_dating/screen/login.dart';
import 'package:serious_dating/utils/helper.dart';
import 'package:serious_dating/widget/sign_btn.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/";

  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    // startTimer();
  }

  // startTimer() async {
  //   var duration = const Duration(seconds: 5);
  //   return  Timer(duration, route);
  // }

  // route() {
  //   // Navigator.pushReplacement(
  //   //     context, MaterialPageRoute(builder: (context) => SecondScreen()));
  // }

  initScreen(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      body: Container(
        width: UiHelper.getSize(context).width,
        height: UiHelper.getSize(context).height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFF0305),
            Color(0xffFF315A),
            Color(0xffFF66BA),
            // Colors.red,
          ],
        )),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                  top: UiHelper.getSize(context).height * 0.11,
                  child: Image.asset("assets/icon/heart.png")),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: UiHelper.getSize(context).width,
                    height: UiHelper.getSize(context).height * 0.2,
                    child: Image.asset(
                      "assets/logo/logo.jpeg",
                      width: UiHelper.getSize(context).width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  SignInBtn(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Login.routeName);
                    },
                    title: 'Get Started',
                    titleColor: const Color(0xffFF0305),
                    btnColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
