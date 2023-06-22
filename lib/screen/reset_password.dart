import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:serious_dating/models/register_user_model.dart';
import 'package:serious_dating/screen/reset_verify_otp.dart';
import 'package:serious_dating/widget/sign_btn.dart';

import '../utils/commom.dart';
import '../utils/contants.dart';
import '../utils/helper.dart';
import '../utils/styles.dart';

class ResetPassword extends StatefulWidget {
  static String routeName = "/ResetPassword";
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String _fName = '', _lName = '', _pass = '', _cPass = '', _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFE3E3),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              width: UiHelper.getSize(context).width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: redTitle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Reset Password",
                    style: Styles.Heading3(textColor: redTitle, font: 'nunito'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: Styles.Heading4(font: 'sans'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              obscureText: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: const InputDecoration(
                                suffix: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                _pass = value;
                              },
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return 'Enter new password';
                                }
                                return null;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Confirm Password",
                              style: Styles.Heading4(font: 'sans'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: const InputDecoration(
                                suffix: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                _cPass = value;
                              },
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return 'Confirm new password';
                                } else if (_pass != _cPass) {
                                  return 'Password not matched!';
                                }
                                return null;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SignInBtn(
                            onTap: () {
                              Navigator.pushNamed(context, VerifyOTP.routeName);
                              // if (_formKey.currentState!.validate()) {
                              //   showDialog(
                              //       context: context,
                              //       barrierDismissible: false,
                              //       builder: (BuildContext context) =>
                              //           const LoadingWidget());
                              //   _doSignUp();
                              // }
                              // Navigator.pushNamed(
                              //     context, ProfileDetails.routeName);
                            },
                            title: "Reset",
                            btnColor: const Color(0xffFF3D3D),
                            titleColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _doSignUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    String email = _email.trim();
    String password = _pass.trim();
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      if (userCredential.user != null) {
        print('user created');
        String uid = userCredential.user!.uid;
        RegisterUserModel model = RegisterUserModel(
            firstName: _fName.trim(),
            lastName: _lName.trim(),
            email: _email.trim(),
            profession: '',
            uid: uid);
        print(model.toJson());

        await _firestore.collection('users').doc(uid).set(model.toJson());
        print('User details added');
      } else {
        print('SignUp Failed!');
        showSnackBar('SignUp Failed!', context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'weak-password') {
        showSnackBar('SignUp Failed!', context);
      } else if (e.code == 'email-already-in-use') {
        showSnackBar('The account already exists for that email.', context);
      } else if (e.code == 'invalid-email') {
        showSnackBar('Invalid email address.', context);
      } else {
        showSnackBar(e.code, context);
      }
    } on SocketException {
      Navigator.of(context).pop();
      showSnackBar('No Internet Connection!', context);
    } catch (e) {
      Navigator.of(context).pop();
      showSnackBar(e.toString(), context);
    }
  }
}
