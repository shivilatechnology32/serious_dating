import 'package:flutter/material.dart';
import 'package:serious_dating/utils/contants.dart' as Constant;
import 'package:serious_dating/utils/helper.dart';

import '../utils/styles.dart';
import '../widget/sign_btn.dart';
import 'DashBoard/bottom_navigation.dart';

class Interest extends StatefulWidget {
  static String routeName = "/Interest";
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  final List<Map> interestsListAll = [
    {
      "image": 'assets/icon/Cycling.png',
      "text": "Cycling",
    },
    {
      "image": 'assets/icon/Football.png',
      "text": "Football",
    },
    {
      "image": 'assets/icon/Painting.png',
      "text": "Painting",
    },
    {
      "image": 'assets/icon/Dance.png',
      "text": "Dance",
    },
    {
      "image": 'assets/icon/Shopping.png',
      "text": "Shopping",
    },
    {
      "image": 'assets/icon/Writting.png',
      "text": "Writing",
    },
    {
      "image": 'assets/icon/Cooking.png',
      "text": "Cooking",
    },
    {
      "image": 'assets/icon/Running.png',
      "text": "Running",
    },
    {
      "image": 'assets/icon/Acting.png',
      "text": "Acting",
    },
    {
      "image": 'assets/icon/FlimMaking.png',
      "text": "Film Making",
    },
    {
      "image": 'assets/icon/Chess.png',
      "text": "Chess",
    },
    {
      "image": 'assets/icon/Swimming.png',
      "text": "Swimming",
    },
    {
      "image": 'assets/icon/Hikking.png',
      "text": "Hiking",
    },
    {
      "image": 'assets/icon/Photograph.png',
      "text": "Photograph",
    },
    {
      "image": 'assets/icon/Guitar.png',
      "text": "Guitar",
    },
    {
      "image": 'assets/icon/BoardGame.png',
      "text": "Board Game",
    }
  ];
  List<String> userInterests = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Constant.bgColor,
          height: UiHelper.getSize(context).height / 1,
          child: SingleChildScrollView(
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
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Constant.redTitle,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Interests',
                          style: Styles.Heading3(
                              textColor: const Color(0xFFF23131),
                              font: 'nunito')),
                      const SizedBox(height: 15),
                      Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                          style: Styles.Heading5(
                              textColor: const Color(0xFF616161),
                              font: 'sans')),
                      const SizedBox(height: 20),
                      LayoutBuilder(
                        builder: (context, constraints) => GridView.count(
                          padding: const EdgeInsets.only(
                              top: 5, left: 2, right: 2, bottom: 2),
                          childAspectRatio:
                              MediaQuery.of(context).size.aspectRatio * 5 / 0.6,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                            interestsListAll.length,
                            (index) => InkWell(
                              onTap: () {
                                if (userInterests.contains(
                                    interestsListAll[index]["text"])) {
                                  userInterests
                                      .remove(interestsListAll[index]["text"]);
                                } else {
                                  userInterests
                                      .add(interestsListAll[index]["text"]);
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: userInterests.contains(
                                          interestsListAll[index]["text"])
                                      ? const Color(0xFFF23131)
                                      : const Color(0x80FFFDFD),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x0A000000),
                                        blurRadius: 15,
                                        offset: Offset(0, 0),
                                        spreadRadius: 1),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 6),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image.asset(
                                          interestsListAll[index]["image"],
                                          color: userInterests.contains(
                                                  interestsListAll[index]
                                                      ["text"])
                                              ? Colors.white
                                              : const Color(0xFF130101)),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      interestsListAll[index]["text"],
                                      style: Styles.Heading5(
                                          textColor: userInterests.contains(
                                                  interestsListAll[index]
                                                      ["text"])
                                              ? Colors.white
                                              : const Color(0xFF130101),
                                          font: 'sans'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(' Skip > ',
                            style: Styles.Heading4(
                                textColor: const Color(0xF0F23131),
                                font: 'sans')),
                      ),
                      Container(
                        height: 70,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.10,
                            vertical: 15),
                        child: SignInBtn(
                          title: "Continue",
                          btnColor: Constant.redTitle,
                          titleColor: Colors.white,
                          onTap: () {
                            Navigator.pushNamed(
                                context, BottomNavigator.routeName);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
