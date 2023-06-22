import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serious_dating/utils/helper.dart';

import '../../utils/contants.dart';
import '../../utils/styles.dart';
import '../../widget/sign_btn.dart';

class DiscoverySettings extends StatefulWidget {
  static String routeName = "/DiscoverySettings";
  const DiscoverySettings({super.key});

  @override
  State<DiscoverySettings> createState() => _DiscoverySettingsState();
}

class _DiscoverySettingsState extends State<DiscoverySettings> {
  double _sliderValue = 1.0;
  double _sliderValue2 = 18;
  bool showWomen = true;
  bool showMen = false;
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
  List<String> selectedInterests = [];
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

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
            title: Text(
              'Discovery Settings',
              style: Styles.Heading3(
                  textColor: redTitle, fontbold: true, font: 'nunito'),
            ),
            centerTitle: true,
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(Icons.notifications, color: iconRed))
            ]),
        body: SingleChildScrollView(
          child: SizedBox(
            width: UiHelper.getSize(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 38 * fem),
                  padding:
                      EdgeInsets.fromLTRB(38 * fem, 9 * fem, 38 * fem, 8 * fem),
                  width: 386 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0x33000000)),
                    color: const Color(0xfffffcfc),
                    borderRadius: BorderRadius.circular(2 * fem),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 18 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Maximum distance',
                              style: GoogleFonts.nunito(
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.3625 * ffem / fem,
                                color: const Color(0xff000000),
                              ),
                            ),
                            Text(
                              '${_sliderValue.round()}mi',
                              style: GoogleFonts.nunito(
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.3625 * ffem / fem,
                                color: const Color(0xff6b6b6b),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 18 * fem),
                        height: 14 * fem,
                        alignment: Alignment.centerLeft,
                        child: Slider(
                          value: _sliderValue,
                          min: 1.0,
                          max: 99.0,
                          onChanged: (newValue) {
                            setState(() {
                              _sliderValue = newValue;
                            });
                          },
                          activeColor: const Color(0xFFF23131),
                          inactiveColor: const Color(0xFFA49595),
                        ),
                      ),
                      Text(
                        'Only show people in the range',
                        style: GoogleFonts.openSans(
                          fontSize: 14 * ffem,
                          color: const Color(0xa3000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 38 * fem),
                  padding:
                      EdgeInsets.fromLTRB(38 * fem, 9 * fem, 38 * fem, 8 * fem),
                  width: 386 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0x33000000)),
                    color: const Color(0xfffffcfc),
                    borderRadius: BorderRadius.circular(2 * fem),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 18 * fem),
                        width: double.infinity,
                        child: Text(
                          'Show me',
                          style: GoogleFonts.nunito(
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3625 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 19 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showWomen = !showWomen;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 28 * fem, 0 * fem),
                                width: 76 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: showWomen
                                      ? const Color(0xfff23131)
                                      : const Color(0xffdbdbdb),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x26000000),
                                      offset: Offset(0 * fem, 0 * fem),
                                      blurRadius: 2.5 * fem,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Women',
                                    style: GoogleFonts.openSans(
                                      fontSize: 10 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2024196596 * ffem / fem,
                                      color: showWomen
                                          ? const Color(0xffffffff)
                                          : const Color(0xff757575),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showMen = !showMen;
                                });
                              },
                              child: Container(
                                width: 76 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: showMen
                                      ? const Color(0xfff23131)
                                      : const Color(0xffdbdbdb),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x26000000),
                                      offset: Offset(0 * fem, 0 * fem),
                                      blurRadius: 2.5 * fem,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Men',
                                    style: GoogleFonts.openSans(
                                      fontSize: 10 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2024196596 * ffem / fem,
                                      color: showMen
                                          ? const Color(0xffffffff)
                                          : const Color(0xff757575),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 38 * fem),
                  padding:
                      EdgeInsets.fromLTRB(38 * fem, 9 * fem, 38 * fem, 8 * fem),
                  width: 386 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0x33000000)),
                    color: const Color(0xfffffcfc),
                    borderRadius: BorderRadius.circular(2 * fem),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 18 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Age range',
                              style: GoogleFonts.nunito(
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.3625 * ffem / fem,
                                color: const Color(0xff000000),
                              ),
                            ),
                            Text(
                              '${_sliderValue2.round()}-${_sliderValue2.round() + 10}',
                              style: GoogleFonts.nunito(
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.3625 * ffem / fem,
                                color: const Color(0xff6b6b6b),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 18 * fem),
                        height: 14 * fem,
                        alignment: Alignment.centerLeft,
                        child: Slider(
                          value: _sliderValue2,
                          min: 18.0,
                          max: 50.0,
                          onChanged: (newValue) {
                            setState(() {
                              _sliderValue2 = newValue;
                            });
                          },
                          activeColor: const Color(0xFFF23131),
                          inactiveColor: const Color(0xFFA49595),
                        ),
                      ),
                      Text(
                        'Only show people in the range',
                        style: GoogleFonts.openSans(
                          fontSize: 14 * ffem,
                          color: const Color(0xa3000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 38 * fem),
                  padding:
                      EdgeInsets.fromLTRB(38 * fem, 9 * fem, 38 * fem, 8 * fem),
                  width: 386 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0x33000000)),
                    color: const Color(0xfffffcfc),
                    borderRadius: BorderRadius.circular(2 * fem),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 18 * fem),
                        width: double.infinity,
                        child: Text(
                          'Profession',
                          style: GoogleFonts.nunito(
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3625 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
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
                            showAll ? interestsListAll.length : 4,
                            (index) => InkWell(
                              onTap: () {
                                if (selectedInterests.contains(
                                    interestsListAll[index]["text"])) {
                                  selectedInterests
                                      .remove(interestsListAll[index]["text"]);
                                } else {
                                  selectedInterests
                                      .add(interestsListAll[index]["text"]);
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: selectedInterests.contains(
                                          interestsListAll[index]["text"])
                                      ? const Color(0xFFF23131)
                                      : const Color(0xFFFFFFFF),
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
                                          color: selectedInterests.contains(
                                                  interestsListAll[index]
                                                      ["text"])
                                              ? Colors.white
                                              : const Color(0xFF130101)),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      interestsListAll[index]["text"],
                                      style: Styles.Heading5(
                                          textColor: selectedInterests.contains(
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showAll = !showAll;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x0A000000),
                                    blurRadius: 15,
                                    offset: Offset(0, 0),
                                    spreadRadius: 1),
                              ],
                            ),
                            child: Text(
                              showAll ? 'Show less' : 'Show more',
                              style: Styles.Heading5(
                                  textColor: const Color(0xFF130101),
                                  font: 'sans'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 65,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2,
                      vertical: 15),
                  child: SignInBtn(
                    title: "Done",
                    btnColor: redTitle,
                    titleColor: Colors.white,
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
