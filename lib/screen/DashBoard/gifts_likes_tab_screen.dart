import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:serious_dating/utils/styles.dart';

import '../../utils/contants.dart';
import 'user_match_screen.dart';

const kPageTitle = 'Settings';
const kTabBgColor = Color(0xffF23131);
const kTabFgColor = Colors.white;

class GiftsLikesPage extends HookWidget {
  const GiftsLikesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map> gifts = [
      {
        "image": 'assets/dummy/dp1.png',
        "name": "Ira Guha",
      },
      {
        "image": 'assets/dummy/dp2.png',
        "name": "Ira Guha",
      },
      {
        "image": 'assets/dummy/dp3.png',
        "name": "Ira Guha",
      },
      {
        "image": 'assets/dummy/dp4.png',
        "name": "Ira Guha",
      },
      {
        "image": 'assets/dummy/dp5.png',
        "name": "Ira Guha",
      }
    ];
    final List<Map> likes = [
      {
        "image": 'assets/dummy/dp2.png',
        "name": "Ira Guha",
      },
      {
        "image": 'assets/dummy/dp3.png',
        "name": "Ira Guha",
      },
      {
        "image": 'assets/dummy/dp4.png',
        "name": "Ira Guha",
      },
      {
        "image": 'assets/dummy/dp5.png',
        "name": "Ira Guha",
      }
    ];
    final controller = useTabController(initialLength: 2);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 2),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1C000000), // Shadow color with opacity
                    offset: Offset(2, 0), // Shadow position
                    blurRadius: 5, // Shadow blur radius
                    spreadRadius: 1, // Shadow spread radius
                  ),
                ],
              ),
              child: MyTabBar(
                controller: controller,
                labels: ["${gifts.length} Gifts", "${likes.length} Likes"],
                backgroundColor: kTabBgColor,
                foregroundColor: kTabFgColor,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ListView(
                    children: [
                      AppBar(
                        backgroundColor: const Color(0xFFF5F5F5),
                        leading: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios, color: iconRed)),
                        elevation: 1,
                      ),
                      ProfileCardListView(profiles: gifts),
                    ],
                  ),
                  ListView(
                    children: [
                      AppBar(
                        backgroundColor: const Color(0xFFF5F5F5),
                        leading: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios, color: iconRed)),
                        elevation: 1,
                      ),
                      ProfileCardListView(profiles: likes),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCardListView extends StatelessWidget {
  const ProfileCardListView({
    super.key,
    required this.profiles,
  });

  final List<Map> profiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              childAspectRatio: MediaQuery.of(context).size.aspectRatio / 0.7,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                profiles.length,
                (index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, UserMatchScreen.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x0a000000),
                            blurRadius: 4,
                            offset: Offset(1, 2),
                            spreadRadius: 1),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(profiles[index]["image"]),
                                      fit: BoxFit.cover))),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(profiles[index]["name"],
                                      style: Styles.Heading5(
                                          font: 'nunito',
                                          textColor: redTitle,
                                          fontbold: true)),
                                  Text('1 mile away',
                                      style: Styles.Heading5(
                                          font: 'nunito', textColor: redTitle)),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.thumb_up_off_alt,
                                      size: 16, color: redTitle),
                                  const SizedBox(width: 6),
                                  Icon(Icons.cancel_outlined,
                                      size: 16, color: redTitle)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyTabBar extends HookWidget {
  final TabController controller;
  final List<String> labels;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? activeBackgroundColor;
  final Color? activeForegroundColor;
  final double? fontSize;

  const MyTabBar({
    Key? key,
    required this.controller,
    required this.labels,
    required this.backgroundColor,
    required this.foregroundColor,
    this.activeBackgroundColor,
    this.activeForegroundColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ids = useState([1, 0]);
    return AspectRatio(
      aspectRatio: 8 / 1,
      child: ColoredBox(
        color: red,
        child: Stack(
          fit: StackFit.expand,
          children: ids.value.map((id) {
            final active = controller.index == id;
            return MyTab(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                activeBackgroundColor: activeBackgroundColor,
                activeForegroundColor: activeForegroundColor,
                fontSize: fontSize ?? 14,
                active: active,
                reversed: id == 1,
                label: labels[id],
                onTap: () {
                  controller.animateTo(id);
                  ids.value = ids.value.reversed.toList();
                });
          }).toList(),
        ),
      ),
    );
  }
}

class MyTab extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? activeBackgroundColor;
  final Color? activeForegroundColor;
  final double fontSize;
  final bool active;
  final bool reversed;
  final String label;
  final VoidCallback onTap;

  Color get bgColor =>
      active ? activeBackgroundColor ?? foregroundColor : backgroundColor;
  Color get fgColor =>
      active ? activeForegroundColor ?? backgroundColor : foregroundColor;

  const MyTab({
    Key? key,
    required this.active,
    this.reversed = false,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    this.activeBackgroundColor,
    this.activeForegroundColor,
    required this.fontSize,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: reversed
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: CustomPaint(painter: TabPainter(color: bgColor)),
                  )
                : CustomPaint(painter: TabPainter(color: bgColor)),
          ),
        ),
        Align(
          alignment: reversed ? Alignment.centerRight : Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: .5,
            heightFactor: 1,
            child: TextButton(
              onPressed: active ? null : onTap,
              child: Text(
                label,
                style: TextStyle(color: fgColor, fontSize: fontSize),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabPainter extends CustomPainter {
  final Color color;

  TabPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path();
    path.lineTo(.45 * size.width, 0);
    path.lineTo(.55 * size.width, .8 * size.height);
    path.quadraticBezierTo(
        .58 * size.width, size.height, .62 * size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
