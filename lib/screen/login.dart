import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:serious_dating/controllers/login_controller.dart';
import 'package:serious_dating/screen/sign_in.dart';
import 'package:serious_dating/utils/helper.dart';
import 'package:serious_dating/utils/styles.dart';
import 'package:serious_dating/widget/sign_btn.dart';
import 'package:twitter_login/twitter_login.dart';

import '../utils/commom.dart';
import '../widget/sign_btn_border.dart';
import 'DashBoard/bottom_navigation.dart';
import 'DashBoard/live_stream_screen.dart';
import 'gender.dart';
import 'reset_password.dart';

class Login extends StatefulWidget {
  static String routeName = "/Login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// extends GetView<LoginController>
// GetX<LoginController>

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  LoginController loginController = Get.put(LoginController());
  String email = '' , password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: SizedBox(
          height: UiHelper.getSize(context).height,
          child: Stack(
            children: [
              Container(
                width: UiHelper.getSize(context).width,
                color: const Color(0xffFFE3E3),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text("WELCOME",
                          style: Styles.Heading2(
                              textColor: const Color(0xffFF3D3D),
                              font: 'nunito')),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onChanged: (value) {
                            loginController.email = value;
                          },
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(thickness: 2, color: Color(0xffFF3D3D)),
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
                          onChanged: (value) {
                            loginController.pass = value;
                          },
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Enter password';
                            }
                            return null;
                          },
                          obscureText: true,
                          obscuringCharacter: "*",
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(thickness: 2, color: Color(0xffFF3D3D)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ResetPassword.routeName);
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: Styles.Heading5(
                                      textColor: const Color(0xffFF3D3D),
                                      font: 'nunito'),
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
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) =>
                                      const LoadingWidget());
                              _loginWithAPI();
                             // _doLogin();
                            }

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
                              InkWell(
                                onTap: googleSignUp,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset(
                                      'assets/icon/google_logo.png'),
                                ),
                              ),
                              InkWell(
                                onTap: fbSignUp,
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundImage:
                                      AssetImage('assets/icon/fb_logo.png'),
                                ),
                              ),
                              InkWell(
                                onTap: twitterSignUp,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset('assets/icon/twitter.png'),
                                ),
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

  fbSignUp() async {
    final LoginResult result = await FacebookAuth.instance.login();
    final AccessToken accessToken = result.accessToken!;
    final AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = userCredential.user;
    if (user != null) {
      Navigator.pushNamed(context, SelectGender.routeName);
    }
  }

  twitterSignUp() async {
    final twitterLogin = TwitterLogin(
      // Consumer API keys
      apiKey: 'xxxx',
      // Consumer API Secret keys
      apiSecretKey: 'xxxx',
      // Registered Callback URLs in TwitterApp
      // Android is a deeplink
      // iOS is a URLScheme
      redirectURI: 'example://',
    );
    final authResult = await twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        Navigator.pushNamed(context, SelectGender.routeName);
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        break;
      case TwitterLoginStatus.error:
        // error
        break;
      case null:
        // error
        break;
    }
  }

  googleSignUp() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;
      print("---------------------"+ user!.uid.toString());
      // Handle the user login or registration process here
      if (user != null) {
        Navigator.pushNamed(context, SelectGender.routeName);
      }
    }
  }

  void _loginWithAPI() async {
    final url = Uri.parse('http://35.78.201.111:3022/user/login');

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "username": loginController.email,
      "password": loginController.pass,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200 ) {
        final responseData = jsonDecode(response.body);
        print("ressssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        print(responseData);
        if (responseData['success'] == true) {
          Navigator.of(context).pop();
          final userData = responseData['data'];

          // Access the user data and perform necessary operations
          String userId = userData['_id'];
          String firstName = userData['first_name'];
          String lastName = userData['last_name'];
          String email = userData['email'];
          // ...

          Navigator.of(context).pushReplacementNamed(BottomNavigator.routeName);
        } else {
          final errorMessage = responseData['message'];
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        final errorMessage = 'An error occurred. Please try again later.';
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print(e);
      final errorMessage = 'An error occurred. Please try again later.';
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }



  // Future<void> _doLogin() async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) => const LoadingWidget(),
  //   );
  //
  //   try {
  //     // Simulating an asynchronous login process
  //     await Future.delayed(Duration(seconds: 2));
  //
  //
  //     final FirebaseAuth _auth = FirebaseAuth.instance;
  //     final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: loginController.email,
  //       password: loginController.pass
  //     );
  //
  //     // Check if login was successful
  //     if (userCredential.user != null) {
  //       // Navigate to a new page
  //       print(" current user is : " + userCredential.user!.email.toString());
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (BuildContext context) => SelectGender()),
  //       );
  //     } else {
  //       // Show a Snackbar with an error message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Login failed. Please try again.'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     // Show a Snackbar with the error message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('An error occurred: $e'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   }
  //
  //   // Close the loading dialog
  //   Navigator.of(context).pop();
  // }



// void _doLogin() async {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: loginController.email, password: loginController.pass);
  //     Navigator.of(context).pop();
  //     if (credential.user != null) {
  //       // Navigator.pushNamed(context, SelectGender.routeName);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     Navigator.of(context).pop();
  //     if (e.code == 'user-not-found') {
  //       showSnackBar('No user found for that email.', context);
  //     } else if (e.code == 'invalid-email') {
  //       showSnackBar('Invalid email address.', context);
  //     } else if (e.code == 'wrong-password') {
  //       showSnackBar('Wrong password provided for that user.', context);
  //     } else {
  //     //  Navigator.of(context).pop();
  //       showSnackBar(e.code, context);
  //     }
  //   } on SocketException {
  //     Navigator.of(context).pop();
  //     showSnackBar('No Internet Connection!', context);
  //   } catch (e) {
  //     Navigator.of(context).pop();
  //     showSnackBar(e.toString(), context);
  //   }
  // }
}