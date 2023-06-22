import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:serious_dating/models/register_user_model.dart';
import 'package:serious_dating/widget/sign_btn.dart';

import '../utils/commom.dart';
import '../utils/contants.dart';
import '../utils/helper.dart';
import '../utils/styles.dart';

class VerifyOTP extends StatefulWidget {
  static String routeName = "/VerifyOTP";
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String _fName = '',
      _lName = '',
      _pass = '',
      _cPass = '',
      _email = '',
      otpNumber = '';

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
                    height: 60,
                  ),
                  SizedBox(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Enter the 4-digit code sent to you at ",
                                style: TextStyle(
                                    color: Color(0xFF7C75AF), fontSize: 18),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 1),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '234234',
                                  style:
                                      TextStyle(color: redTitle, fontSize: 18),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Align(
                              alignment: Alignment.center,
                              child: OtpTextField(
                                mainAxisAlignment: MainAxisAlignment.start,
                                numberOfFields: 4,
                                cursorColor: red,
                                enabledBorderColor: const Color(0x20F86600),
                                focusedBorderColor: const Color(0xFFF86600),
                                showFieldAsBox: false,
                                onCodeChanged: (String code) {},
                                onSubmit: (String verificationCode) {
                                  otpNumber = verificationCode;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Visibility(
                              visible: false,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                                  child: Text('Invalid OTP!',
                                      style:
                                          TextStyle(color: Colors.redAccent)),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              // if (resendText == 'Resend code') {
                              //   setState(() {
                              //     resendText = 'Sending...';
                              //   });
                              //   print("Saved Phone: " + widget.phone);
                              //   reSentStatus(widget.phone);
                              // }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  // resendText + sec.toString(),
                                  'Resend Code?',
                                  style:
                                      TextStyle(fontSize: 14, color: redTitle),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
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
                              // if (otpNumber.isEmpty) {
                              //   return;
                              // }
                              // if (verifyText == "Verify OTP") {
                              //   setState(() {
                              //     verifyText = "Verifying...";
                              //   });
                              //   print('Digits $otpNumber');
                              //   verify(widget.phone, otpNumber);
                              // }
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
