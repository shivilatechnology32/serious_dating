import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serious_dating/screen/profile_details.dart';
import 'package:serious_dating/utils/contants.dart' as Constant;
import 'package:serious_dating/widget/sign_btn.dart';

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
  @override
  final _formKey = GlobalKey<FormState>();
  Profession? _profession = Profession.Jobless;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          width: UiHelper.getSize(context).width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg/bg1.jpg"), fit: BoxFit.cover)),
          // color: const Color(0xffFFE3E3),
          height: UiHelper.getSize(context).height,
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
                style: Styles.Heading3(textColor: Colors.white),
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
                            ? AssetImage("assets/icon/man.png")
                            : FileImage(imagePic!) as ImageProvider)),
              ),
              const SizedBox(
                height: 5,
              ),
              const Icon(
                Icons.photo_camera,
                color: Colors.white,
              ),
              const SizedBox(
                height: 40,
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
                          style: Styles.Heading4(),
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
                          style: Styles.Heading4(),
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
                          style: Styles.Heading4(),
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
                          style: Styles.Heading4(),
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
                          style: Styles.Heading4(),
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
                          style: Styles.Heading4(textColor: Constant.redTitle),
                        ),
                        Text(
                          "  /",
                          style: Styles.Heading3(),
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
                          style: Styles.Heading4(textColor: Constant.redTitle),
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
                          Navigator.pushNamed(
                              context, ProfileDetails.routeName);
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
                        Text(
                          "Login",
                          style: TextStyle(color: Constant.redTitle),
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
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/icon/fb_logo.png'),
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

          // child: Stack(
          //   children: [
          //     Positioned(
          //       top: 0,
          //       child: Container(
          //         width: UiHelper.getSize(context).width,
          //         height: UiHelper.getSize(context).height * 0.32,
          //         // color: Colors.red,
          //         decoration: const BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage('assets/icon/red_circle.png'),
          //                 fit: BoxFit.cover)),
          //         // child: Column(
          //         //   mainAxisAlignment: MainAxisAlignment.center,
          //         //   children: [
          //         //     const SizedBox(
          //         //       height: 10,
          //         //     ),
          //         //     Padding(
          //         //       padding: const EdgeInsets.symmetric(horizontal: 30),
          //         //       child: Row(
          //         //         children: const [
          //         //           Icon(
          //         //             Icons.arrow_back_ios,
          //         //             color: Colors.white60,
          //         //           )
          //         //         ],
          //         //       ),
          //         //     ),
          //         //     Text(
          //         //       "Profile Details",
          //         //       style: Styles.Heading3(textColor: Colors.white),
          //         //     ),
          //         //     const SizedBox(
          //         //       height: 10,
          //         //     ),
          //         //     Container(
          //         //       width: 100,
          //         //       height: 100,
          //         //       decoration: BoxDecoration(
          //         //           color: Colors.white,
          //         //           borderRadius: BorderRadius.circular(50),
          //         //           image: DecorationImage(
          //         //               image: imagePic == null
          //         //                   ? AssetImage("assets/icon/man.png")
          //         //                   : FileImage(imagePic!) as ImageProvider)),
          //         //       // child: imagePic == null
          //         //       //     ? Image.asset("assets/icon/man.png")
          //         //       //     : Image.file(
          //         //       //         imagePic!,
          //         //       //         fit: BoxFit.cover,
          //         //       //       ),
          //         //     ),
          //         //     // CircleAvatar(
          //         //     //   radius: 50,
          //         //     //   backgroundColor: Colors.white,
          //         //     //   child: imagePic == null
          //         //     //       ? Image.asset("assets/icon/man.png")
          //         //     //       : Image.file(
          //         //     //           imagePic!,
          //         //     //           fit: BoxFit.cover,
          //         //     //         ),
          //         //     //   // backgroundImage: AssetImage("assets/icon/man.png"),
          //         //     // ),
          //         //     const SizedBox(
          //         //       height: 5,
          //         //     ),
          //         //     const Icon(
          //         //       Icons.photo_camera,
          //         //       color: Colors.white,
          //         //     )
          //         //   ],
          //         // ),
          //       ),
          //     ),

          //     // Column(
          //     //   mainAxisAlignment: MainAxisAlignment.center,
          //     //   children: [
          //     //     // Spacer(),
          //     //     Padding(
          //     //       padding: const EdgeInsets.symmetric(horizontal: 30),
          //     //       child: Column(
          //     //         mainAxisAlignment: MainAxisAlignment.center,
          //     //         children: [
          //     //           Row(
          //     //             mainAxisAlignment: MainAxisAlignment.start,
          //     //             crossAxisAlignment: CrossAxisAlignment.start,
          //     //             children: [
          //     //               Text(
          //     //                 "First Name",
          //     //                 style: Styles.Heading4(),
          //     //               ),
          //     //             ],
          //     //           ),
          //     //           const SizedBox(
          //     //             height: 10,
          //     //           ),
          //     //           Container(
          //     //             color: Colors.white,
          //     //             child: Padding(
          //     //               padding:
          //     //                   const EdgeInsets.symmetric(horizontal: 10),
          //     //               child: TextFormField(
          //     //                 decoration: const InputDecoration(
          //     //                   suffix: CircleAvatar(
          //     //                     backgroundColor: Colors.grey,
          //     //                     radius: 12,
          //     //                     child: Icon(
          //     //                       Icons.edit,
          //     //                       size: 14,
          //     //                       color: Colors.white,
          //     //                     ),
          //     //                   ),
          //     //                   enabledBorder: InputBorder.none,
          //     //                   focusedBorder: InputBorder.none,
          //     //                 ),
          //     //               ),
          //     //             ),
          //     //           )
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     const SizedBox(
          //     //       height: 10,
          //     //     ),
          //     //     Padding(
          //     //       padding: const EdgeInsets.symmetric(horizontal: 30),
          //     //       child: Column(
          //     //         mainAxisAlignment: MainAxisAlignment.center,
          //     //         children: [
          //     //           Row(
          //     //             mainAxisAlignment: MainAxisAlignment.start,
          //     //             crossAxisAlignment: CrossAxisAlignment.start,
          //     //             children: [
          //     //               Text(
          //     //                 "Last Name",
          //     //                 style: Styles.Heading4(),
          //     //               ),
          //     //             ],
          //     //           ),
          //     //           const SizedBox(
          //     //             height: 10,
          //     //           ),
          //     //           Container(
          //     //             color: Colors.white,
          //     //             child: Padding(
          //     //               padding:
          //     //                   const EdgeInsets.symmetric(horizontal: 10),
          //     //               child: TextFormField(
          //     //                 decoration: const InputDecoration(
          //     //                   suffix: CircleAvatar(
          //     //                     backgroundColor: Colors.grey,
          //     //                     radius: 12,
          //     //                     child: Icon(
          //     //                       Icons.edit,
          //     //                       size: 14,
          //     //                       color: Colors.white,
          //     //                     ),
          //     //                   ),
          //     //                   enabledBorder: InputBorder.none,
          //     //                   focusedBorder: InputBorder.none,
          //     //                 ),
          //     //               ),
          //     //             ),
          //     //           )
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     const SizedBox(
          //     //       height: 10,
          //     //     ),
          //     //     Padding(
          //     //       padding: const EdgeInsets.symmetric(horizontal: 30),
          //     //       child: Column(
          //     //         mainAxisAlignment: MainAxisAlignment.center,
          //     //         children: [
          //     //           Row(
          //     //             mainAxisAlignment: MainAxisAlignment.start,
          //     //             crossAxisAlignment: CrossAxisAlignment.start,
          //     //             children: [
          //     //               Text(
          //     //                 "Password",
          //     //                 style: Styles.Heading4(),
          //     //               ),
          //     //             ],
          //     //           ),
          //     //           const SizedBox(
          //     //             height: 10,
          //     //           ),
          //     //           Container(
          //     //             color: Colors.white,
          //     //             child: Padding(
          //     //               padding:
          //     //                   const EdgeInsets.symmetric(horizontal: 10),
          //     //               child: TextFormField(
          //     //                 decoration: const InputDecoration(
          //     //                   suffix: CircleAvatar(
          //     //                     backgroundColor: Colors.grey,
          //     //                     radius: 12,
          //     //                     child: Icon(
          //     //                       Icons.edit,
          //     //                       size: 14,
          //     //                       color: Colors.white,
          //     //                     ),
          //     //                   ),
          //     //                   enabledBorder: InputBorder.none,
          //     //                   focusedBorder: InputBorder.none,
          //     //                 ),
          //     //               ),
          //     //             ),
          //     //           )
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     const SizedBox(
          //     //       height: 10,
          //     //     ),
          //     //     Padding(
          //     //       padding: const EdgeInsets.symmetric(horizontal: 30),
          //     //       child: Column(
          //     //         mainAxisAlignment: MainAxisAlignment.center,
          //     //         children: [
          //     //           Row(
          //     //             mainAxisAlignment: MainAxisAlignment.start,
          //     //             crossAxisAlignment: CrossAxisAlignment.start,
          //     //             children: [
          //     //               Text(
          //     //                 "Confirm Password",
          //     //                 style: Styles.Heading4(),
          //     //               ),
          //     //             ],
          //     //           ),
          //     //           const SizedBox(
          //     //             height: 10,
          //     //           ),
          //     //           Container(
          //     //             color: Colors.white,
          //     //             child: Padding(
          //     //               padding:
          //     //                   const EdgeInsets.symmetric(horizontal: 10),
          //     //               child: TextFormField(
          //     //                 decoration: const InputDecoration(
          //     //                   suffix: CircleAvatar(
          //     //                     backgroundColor: Colors.grey,
          //     //                     radius: 12,
          //     //                     child: Icon(
          //     //                       Icons.edit,
          //     //                       size: 14,
          //     //                       color: Colors.white,
          //     //                     ),
          //     //                   ),
          //     //                   enabledBorder: InputBorder.none,
          //     //                   focusedBorder: InputBorder.none,
          //     //                 ),
          //     //               ),
          //     //             ),
          //     //           )
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     const SizedBox(
          //     //       height: 10,
          //     //     ),
          //     //     Padding(
          //     //       padding: const EdgeInsets.symmetric(horizontal: 30),
          //     //       child: Column(
          //     //         mainAxisAlignment: MainAxisAlignment.center,
          //     //         children: [
          //     //           Row(
          //     //             mainAxisAlignment: MainAxisAlignment.start,
          //     //             crossAxisAlignment: CrossAxisAlignment.start,
          //     //             children: [
          //     //               Text(
          //     //                 "Confirm Password",
          //     //                 style: Styles.Heading4(),
          //     //               ),
          //     //             ],
          //     //           ),
          //     //           const SizedBox(
          //     //             height: 10,
          //     //           ),
          //     //           Container(
          //     //             color: Colors.white,
          //     //             child: Padding(
          //     //               padding:
          //     //                   const EdgeInsets.symmetric(horizontal: 10),
          //     //               child: TextFormField(
          //     //                 decoration: const InputDecoration(
          //     //                   suffix: CircleAvatar(
          //     //                     backgroundColor: Colors.grey,
          //     //                     radius: 12,
          //     //                     child: Icon(
          //     //                       Icons.edit,
          //     //                       size: 14,
          //     //                       color: Colors.white,
          //     //                     ),
          //     //                   ),
          //     //                   enabledBorder: InputBorder.none,
          //     //                   focusedBorder: InputBorder.none,
          //     //                 ),
          //     //               ),
          //     //             ),
          //     //           )
          //     //         ],
          //     //       ),
          //     //     ),
          //     //   ],
          //     // ),

          //     // Container(
          //     //   width: UiHelper.getSize(context).width,
          //     //   color: const Color(0xffFFE3E3),
          //     //   child: Column(
          //     //       mainAxisAlignment: MainAxisAlignment.center,
          //     //       children: [
          //     //         Spacer(),
          //     //         Text("WELCOME",
          //     //             style: Styles.Heading2(
          //     //                 textColor: const Color(0xffFF3D3D))),
          //     //         const SizedBox(
          //     //           height: 50,
          //     //         ),
          //     //         Padding(
          //     //           padding: const EdgeInsets.symmetric(horizontal: 30),
          //     //           child: TextFormField(
          //     //             decoration: const InputDecoration(
          //     //               icon: Icon(
          //     //                 Icons.phone,
          //     //                 color: Colors.black,
          //     //               ),
          //     //               enabledBorder: InputBorder.none,
          //     //               focusedBorder: InputBorder.none,
          //     //             ),
          //     //           ),
          //     //         ),
          //     //         const Padding(
          //     //           padding: EdgeInsets.symmetric(horizontal: 30),
          //     //           child: Divider(
          //     //               thickness: 2, color: const Color(0xffFF3D3D)),
          //     //         ),
          //     //         const SizedBox(
          //     //           height: 10,
          //     //         ),
          //     //         Padding(
          //     //           padding: const EdgeInsets.symmetric(horizontal: 30),
          //     //           child: TextFormField(
          //     //             decoration: const InputDecoration(
          //     //               icon: Icon(
          //     //                 Icons.password,
          //     //                 color: Colors.black,
          //     //               ),
          //     //               enabledBorder: InputBorder.none,
          //     //               focusedBorder: InputBorder.none,
          //     //             ),
          //     //             obscureText: true,
          //     //             obscuringCharacter: "*",
          //     //           ),
          //     //         ),
          //     //         const Padding(
          //     //           padding: EdgeInsets.symmetric(horizontal: 30),
          //     //           child: Divider(
          //     //               thickness: 2, color: const Color(0xffFF3D3D)),
          //     //         ),
          //     //         Padding(
          //     //           padding: const EdgeInsets.symmetric(horizontal: 30),
          //     //           child: Row(
          //     //             mainAxisAlignment: MainAxisAlignment.end,
          //     //             children: [
          //     //               TextButton(
          //     //                   onPressed: () {},
          //     //                   child: Text(
          //     //                     "Forget Password?",
          //     //                     style: Styles.Heading5(
          //     //                         textColor: const Color(0xffFF3D3D)),
          //     //                   ))
          //     //             ],
          //     //           ),
          //     //         ),
          //     //         const Spacer(
          //     //           flex: 3,
          //     //         )
          //     //       ]),
          //     // ),
          //   ],
          // ),
        ),
      ),
    ));
  }

  File? imagePic;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.imagePic = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
