import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/styles.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  double baseWidth = 430;
  late double fem;
  late double ffem;
  final List<Map> friends = [
    {
      "image": 'assets/dummy/cover1.png',
      "name": "Lorem Ipsum",
      "status": "Add Friend",
      "distance": "1 mile away",
      "match": "10%",
    },
    {
      "image": 'assets/dummy/dp2.png',
      "name": "Lorem Ipsum",
      "status": "Send Money",
      "distance": "1 mile away",
      "match": "10%",
    },
    {
      "image": 'assets/dummy/dp3.png',
      "name": "Lorem Ipsum",
      "status": "Sent",
      "distance": "1 mile away",
      "match": "10%",
    },
    {
      "image": 'assets/dummy/dp4.png',
      "name": "Lorem Ipsum",
      "status": "Add Friend",
      "distance": "1 mile away",
      "match": "10%",
    },
    {
      "image": 'assets/dummy/dp5.png',
      "name": "Lorem Ipsum",
      "status": "Send Money",
      "distance": "1 mile away",
      "match": "10%",
    },
    {
      "image": 'assets/dummy/dp1.png',
      "name": "Lorem Ipsum",
      "status": "Add Friend",
      "distance": "1 mile away",
      "match": "10%",
    }
  ];

  @override
  Widget build(BuildContext context) {
    fem = MediaQuery.of(context).size.width / baseWidth;
    ffem = fem * 0.97;
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
            backgroundColor: Colors.red,
            leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
            elevation: 2,
            centerTitle: true,
            title: Text(
              'Friends',
              style: Styles.Heading3(
                  textColor: Colors.white, fontbold: true, font: 'nunito'),
            )),
        body: SingleChildScrollView(
          child: Column(children: [
            for (Map friend in friends)
              Container(
                // group25sHG (59:49)
                margin: EdgeInsets.only(
                    right: 12 * fem,
                    bottom: 0 * fem,
                    top: 12 * fem,
                    left: 12 * fem),
                padding:
                    EdgeInsets.fromLTRB(10 * fem, 9 * fem, 14 * fem, 10 * fem),
                width: double.infinity,
                height: 121 * fem,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x26000000),
                      offset: Offset(0 * fem, 0 * fem),
                      blurRadius: 3 * fem,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // rectangle898iz (59:30)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 13 * fem, 0 * fem),
                      width: 107 * fem,
                      height: 102 * fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4 * fem),
                        child: Image.asset(
                          friend['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      // group24SUn (59:48)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 10 * fem, 49 * fem, 9 * fem),
                      width: 119 * fem,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            // loremipsumAfg (59:31)
                            friend['name'],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5023460636 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                          Container(
                            // autogrouprqja6ZL (QtQCPjq3K7CcXd1MPYRQJA)
                            padding: EdgeInsets.fromLTRB(
                                1 * fem, 15 * fem, 1 * fem, 0 * fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // autogroupyvtnRLi (QtQCBkB2T2cK6AtNTByvtn)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 60 * fem, 15 * fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        // vectorLia (59:33)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 5 * fem, 0 * fem),
                                        width: 8 * fem,
                                        height: 10 * fem,
                                        child: Image.asset(
                                          'assets/icon/location.png',
                                          width: 8 * fem,
                                          height: 10 * fem,
                                        ),
                                      ),
                                      Text(
                                        // mileawayfVx (59:32)
                                        friend['distance'],
                                        style: GoogleFonts.nunito(
                                          fontSize: 8 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.3625 * ffem / fem,
                                          color: const Color(0xffff3c3c),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // autogrouphsz8CVt (QtQCHABftrbgf1L5TZHsZ8)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 45 * fem, 0 * fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // matchratingXHG (59:34)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 8 * fem, 0 * fem),
                                        child: Text(
                                          'Match rating',
                                          style: GoogleFonts.nunito(
                                            fontSize: 8 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3625 * ffem / fem,
                                            color: const Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // RtS (59:36)
                                        friend['match'],
                                        style: GoogleFonts.nunito(
                                          fontSize: 8 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.3625 * ffem / fem,
                                          color: const Color(0xffff3c3c),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroup25dgyf4 (QtQBwauxD22GDzBuWh25dG)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 3 * fem),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // group21VdQ (59:45)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 13 * fem),
                            width: 18 * fem,
                            height: 18 * fem,
                            child: Image.asset(
                              'assets/icon/close.png',
                              width: 18 * fem,
                              height: 18 * fem,
                            ),
                          ),
                          Container(
                            // group22cT8 (59:46)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 3 * fem, 13 * fem),
                            width: 91 * fem,
                            height: 22 * fem,
                            decoration: BoxDecoration(
                              color: friend['status'] == 'Sent'
                                  ? const Color(0xffb5b5b5)
                                  : const Color(0xffff3c3c),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Center(
                              child: Text(
                                friend['status'],
                                style: GoogleFonts.nunito(
                                  fontSize: 8 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3625 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // group23rsG (59:47)
                            width: 91 * fem,
                            height: 22 * fem,
                            margin: EdgeInsets.only(right: 3 * fem),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffff3c3c)),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Check Match',
                                    style: GoogleFonts.nunito(
                                      fontSize: 8 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3625 * ffem / fem,
                                      color: const Color(0xffff3c3c),
                                    ),
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
          ]),
        ));
  }
}
