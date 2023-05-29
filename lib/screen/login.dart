import 'package:flutter/material.dart';
import 'package:serious_dating/screen/gender_screen.dart';
import 'package:serious_dating/screen/sign_in.dart';
import 'package:serious_dating/utils/helper.dart';
import 'package:serious_dating/utils/styles.dart';
import 'package:serious_dating/widget/sign_btn.dart';

import '../widget/sign_btn_border.dart';

class Login extends StatefulWidget {
  static String routeName = "/Login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          height: UiHelper.getSize(context).height,
          child: Stack(
            children: [
              Container(
                width: UiHelper.getSize(context).width,
                color: const Color(0xffFFE3E3),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text("WELCOME",
                          style: Styles.Heading2(
                              textColor: const Color(0xffFF3D3D))),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                            thickness: 2, color: const Color(0xffFF3D3D)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.password,
                              color: Colors.black,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          obscureText: true,
                          obscuringCharacter: "*",
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                            thickness: 2, color: const Color(0xffFF3D3D)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget Password?",
                                  style: Styles.Heading5(
                                      textColor: const Color(0xffFF3D3D)),
                                ))
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      )
                    ]),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: UiHelper.getSize(context).width,
                  height: UiHelper.getSize(context).height * 0.45,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icon/half_circle.png'),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SignInBtn(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SelectGender.routeName);
                          },
                          title: "Login",
                          btnColor: const Color(0xffFF3D3D),
                          titleColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SignInBtnWithBorder(
                          onTap: () {
                            Navigator.pushNamed(context, SignIn.routeName);
                          },
                          title: "Sign In",
                          btnColor: Colors.white,
                          borderColor: const Color(0xffFF3D3D),
                          titleColor: const Color(0xffFF3D3D),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    AssetImage('assets/icon/fb_logo.png'),
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.transparent,
                                child: Image.asset('assets/icon/insta.png'),
                                // backgroundImage:
                                //     AssetImage('assets/icon/twitter.png'),
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.transparent,
                                child: Image.asset('assets/icon/twitter.png'),
                                // backgroundImage:
                                //     AssetImage('assets/icon/twitter.png'),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
