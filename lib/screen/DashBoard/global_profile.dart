import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import '../../utils/helper.dart';
import '../../utils/styles.dart';

class GlobalProfile extends StatefulWidget {
  const GlobalProfile({super.key});

  @override
  State<GlobalProfile> createState() => _GlobalProfileState();
}

class _GlobalProfileState extends State<GlobalProfile> {
  final List<Map> userInterests = [
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
    }
  ];

  List<String> posts = [
    'assets/dummy/post1.png',
    'assets/dummy/post2.png',
    'assets/dummy/post3.png',
    'assets/dummy/post3.png',
    'assets/dummy/cover.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.arrow_back_ios, color: iconRed),
            elevation: 1,
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(Icons.notifications, color: iconRed))
            ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: UiHelper.getSize(context).width,
                  height: 240,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 160,
                        width: UiHelper.getSize(context).width,
                        child: Image.asset('assets/dummy/cover.png',
                            fit: BoxFit.cover),
                      ),
                      Positioned(
                        top: 80,
                        left: (UiHelper.getSize(context).width / 2 - 80),
                        child: const SizedBox(
                          height: 160,
                          width: 160,
                          child: CircleAvatar(
                            foregroundImage: AssetImage('assets/dummy/dp5.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 18,
                        right: 18,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person_add_alt_outlined,
                                color: redTitle),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 70,
                        right: 18,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.message,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Text('Ira Guha',
                      style: Styles.Heading3(
                          fontbold: true,
                          textColor: Colors.black,
                          font: 'sans')),
                  const SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UiHelper.getSize(context).width * 0.12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buttonIcon('99', Icons.thumb_up, () {}),
                            buttonIcon('99', Icons.wallet_giftcard, () {})
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Location',
                            style: Styles.Heading4(
                                fontbold: true,
                                textColor: Colors.black,
                                font: 'sans')),
                        const SizedBox(
                          height: 6,
                        ),
                        Text('Mumbai',
                            style: Styles.Heading5(
                                textColor: Colors.black, font: 'sans')),
                        const SizedBox(
                          height: 15,
                        ),
                        Text('My Self',
                            style: Styles.Heading4(
                                fontbold: true,
                                textColor: Colors.black,
                                font: 'sans')),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500',
                            style: Styles.Heading5(
                                textColor: Colors.black, font: 'sans')),
                        const SizedBox(
                          height: 18,
                        ),
                        Text('Hobby',
                            style: Styles.Heading4(
                                fontbold: true,
                                textColor: Colors.black,
                                font: 'sans')),
                        const SizedBox(height: 8),
                        LayoutBuilder(
                          builder: (context, constraints) => GridView.count(
                            padding: const EdgeInsets.only(
                                top: 5, left: 2, right: 2, bottom: 2),
                            childAspectRatio:
                                MediaQuery.of(context).size.aspectRatio *
                                    5 /
                                    0.6,
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(
                              userInterests.length,
                              (index) => InkWell(
                                child: Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0x0a000000),
                                          blurRadius: 8,
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
                                            userInterests[index]["image"],
                                            color: const Color(0xFF130101)),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        userInterests[index]["text"],
                                        style: Styles.Heading5(
                                            textColor: const Color(0xFF130101),
                                            font: 'sans'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).toList(),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  Container(
                    height: 36,
                    width: UiHelper.getSize(context).width,
                    color: const Color(0xFFFF5353),
                    child: Center(
                        child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Gallery',
                            textAlign: TextAlign.center,
                            style: Styles.Heading4(
                                fontbold: true,
                                textColor: Colors.white,
                                font: 'sans'),
                          ),
                        ),
                        Container(
                          height: 36,
                          width: 36,
                          color: Colors.white,
                          child: const Icon(
                            Icons.add,
                            color: Color(0xFFFF5353),
                            size: 27,
                          ),
                        )
                      ],
                    )),
                  ),
                  Container(
                      color: const Color(0xffFFDFDF),
                      width: UiHelper.getSize(context).width,
                      // constraints: const BoxConstraints.tightForFinite(width: 200, height: double.maxFinite ) ,
                      padding: const EdgeInsets.all(12.0),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: posts.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.asset(
                            posts[index],
                            fit: BoxFit.cover,
                          );
                        },
                      )),
                ],
              ),
            ],
          ),
        ));
  }

  buttonIcon(String text, IconData icon, void Function() onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 30),
        decoration: BoxDecoration(
          color: const Color(0xFFFF5353),
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
                color: Color(0x0f000000),
                blurRadius: 15,
                offset: Offset(0, 0),
                spreadRadius: 1),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(text,
                style: Styles.Heading4(
                    fontbold: true, textColor: Colors.white, font: 'sans')),
            const SizedBox(width: 8),
            Icon(
              icon,
              color: Colors.white,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
