import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serious_dating/models/register_user_model.dart';
import 'package:serious_dating/models/user_model/user_model.dart';
import 'package:serious_dating/screen/login.dart';
import 'package:serious_dating/utils/contants.dart' as Constant;
import 'package:serious_dating/widget/sign_btn.dart';
import 'package:http/http.dart' as http;
import '../services/firebase.dart';
import '../utils/commom.dart';
import '../utils/helper.dart';
import '../utils/styles.dart';

class SignIn extends StatefulWidget {
  static String routeName = "/SignIn";

  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

enum Profession { Jobless, Occupaid }

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  Profession? _profession = Profession.Jobless;

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String _fName = '',
      _lName = '',
      _pass = '',
      _cPass = '',
      _email = '',
      _mobileNumber = '';

  File? imagePic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          width: UiHelper.getSize(context).width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg/bg1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          // color: const Color(0xffFFE3E3),
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
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white60,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "Profile Details",
                style: Styles.Heading3(textColor: Colors.white, font: 'nunito'),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: imagePic == null
                        ? const AssetImage("assets/icon/man.png")
                        : FileImage(imagePic!) as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: _showBottomSheet,
                child: const Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                ),
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
                          "First Name",
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
                          textInputAction: TextInputAction.next,
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
                            _fName = value;
                          },
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Enter the first name';
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
                          "Last Name",
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
                          textInputAction: TextInputAction.next,
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
                            _lName = value;
                          },
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Enter the last name';
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
                          "mobile number",
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
                          textInputAction: TextInputAction.next,
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
                            _mobileNumber = value;
                          },
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Enter the mobile number';
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
                          "Email Address",
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
                          textInputAction: TextInputAction.next,
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
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            _email = value;
                          },
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Enter your email address';
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
                          "Profession",
                          style: Styles.Heading4(font: 'sans'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Radio<Profession>(
                          value: Profession.Jobless,
                          groupValue: _profession,
                          activeColor: Colors.grey,
                          onChanged: (Profession? value) {
                            setState(() {
                              _profession = value;
                            });
                          },
                        ),
                        Text(
                          "Jobless",
                          style: Styles.Heading4(
                              textColor: Constant.redTitle, font: 'sans'),
                        ),
                        Text(
                          "  /",
                          style: Styles.Heading3(font: 'sans'),
                        ),
                        Radio<Profession>(
                          value: Profession.Occupaid,
                          groupValue: _profession,
                          activeColor: Colors.grey,
                          onChanged: (Profession? value) {
                            setState(() {
                              _profession = value;
                            });
                          },
                        ),
                        Text(
                          "Occupaid",
                          style: Styles.Heading4(
                              textColor: Constant.redTitle, font: 'sans'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SignInBtn(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) =>
                                  const LoadingWidget(),
                            );
                            doSignUpWithApi();
                          }
                          // Navigator.pushNamed(
                          //     context, ProfileDetails.routeName);
                        },
                        title: "Sign In",
                        btnColor: const Color(0xffFF3D3D),
                        titleColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Constant.redTitle),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.transparent,
                          child: Image.asset('assets/icon/google_logo.png'),
                          // backgroundImage:
                          //     AssetImage('assets/icon/twitter.png'),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              AssetImage('assets/icon/fb_logo.png'),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.transparent,
                          child: Image.asset('assets/icon/twitter.png'),
                          // backgroundImage:
                          //     AssetImage('assets/icon/twitter.png'),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_rounded),
              title: const Text('Camera'),
              onTap: () {
                _getFromCamera();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image_rounded),
              title: const Text('Gallery'),
              onTap: () {
                _pickImage();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => imagePic = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 600,
        maxHeight: 900,
        preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      setState(() => imagePic = imageFile);
    }
  }

  void doSignUpWithApi() async {
    FocusManager.instance.primaryFocus?.unfocus();
    String email = _email.trim().toString();
    String password = _pass.trim().toString();
    String firstName = _fName.trim().toString();
    String lastName = _lName.trim().toString();
    String mobileNumber = _mobileNumber.trim().toString();
    final url = Uri.parse('http://35.78.201.111:3022/user/create');

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "first_name": firstName,
      "last_name": lastName,
      "profession": 1,
      "interest": ["1", "2"],
      "email": _email,
      "mobile": _mobileNumber,
      "password": password,
      "referCode": ""
    });
    try {
      final response = await http.post(url, headers: headers, body: body);
      final responseData = jsonDecode(response.body);
      if (responseData['success'] == true) {
        print(responseData);
        Navigator.of(context).pop();
        FirebaseFireStore.to.addUser(
          UserModel(
            uid: responseData['data']['_id'],
            username: '$firstName $lastName',
            phoneNumber: mobileNumber,
            email: email,
            photoId: responseData['data']['displayPhoto'],
            gender: '',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign-up successful!'),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.pushReplacementNamed(context, Login.routeName);
      } else {
        final errorMessage = responseData['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      print(e);
      const errorMessage = 'An error occurred. Please try again later.';
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
      Navigator.of(context).pop();
    }
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
            profession: _profession.toString(),
            uid: uid);
        print(model.toJson());

        await _firestore.collection('users').doc(uid).set(model.toJson());
        print('User details added');
        Navigator.pushReplacementNamed(context, Login.routeName);
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
