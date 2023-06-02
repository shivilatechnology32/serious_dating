import 'package:flutter/material.dart';
import 'package:serious_dating/utils/helper.dart';

import '../../utils/contants.dart';
import '../../utils/styles.dart';

class UserMatchScreen extends StatefulWidget {
  static String routeName = "/UserMatchScreen";
  const UserMatchScreen({super.key});

  @override
  State<UserMatchScreen> createState() => _UserMatchScreenState();
}

class _UserMatchScreenState extends State<UserMatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: iconRed)),
            elevation: 1,
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(Icons.notifications, color: iconRed))
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: UiHelper.getSize(context).width,
                height: 60,
                child: Center(
                  child: Text('Now It is Match',
                      style: Styles.Heading2(
                          font: 'sans',
                          textColor: redTitle,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.2),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: UiHelper.getSize(context).width,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    Expanded(
                                        child: Image.asset(
                                            'assets/dummy/dp1.png',
                                            fit: BoxFit.fill)),
                                    const SizedBox(height: 5),
                                    Text('Lorem Ipsum',
                                        style: Styles.Heading3(
                                            font: 'sans',
                                            textColor: redTitle,
                                            fontbold: true)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                                          style: Styles.Heading5(
                                            font: 'sans',
                                            textColor: black,
                                          )),
                                    )
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Expanded(
                                        child: Image.asset(
                                            'assets/dummy/dp11.png',
                                            fit: BoxFit.fill)),
                                    const SizedBox(height: 5),
                                    Text('Lorem Ipsum',
                                        style: Styles.Heading3(
                                            font: 'sans',
                                            textColor: redTitle,
                                            fontbold: true)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                                          style: Styles.Heading5(
                                            font: 'sans',
                                            textColor: black,
                                          )),
                                    )
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: UiHelper.getSize(context).width / 2 - 30,
                          top: UiHelper.getSize(context).width / 3.6,
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset('assets/icon/red_heart.png'),
                          ),
                        ),
                        Positioned(
                          left: UiHelper.getSize(context).width / 2 - 30,
                          top: UiHelper.getSize(context).width / 3.6,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              height: 56,
                              width: 56,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/icon/white_heart.png',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x0f000000),
                              blurRadius: 2,
                              offset: Offset(1, 1),
                              spreadRadius: 2),
                        ],
                      ),
                      child: Text(
                        'Start Chatting',
                        style: Styles.Heading4(
                            font: 'sans', textColor: redTitle, fontbold: true),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: redTitle,
                height: 90,
                child: Center(
                  child: Text(
                    'Congratulations',
                    style: Styles.Heading3(textColor: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
