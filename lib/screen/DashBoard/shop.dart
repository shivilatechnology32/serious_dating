import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/styles.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  double baseWidth = 430;
  late double fem;
  late double ffem;

  final List<Map> credits = [
    {
      "image": 'assets/icon/coin.png',
      "count": "7",
    },
    {
      "image": 'assets/icon/heart_3d.png',
      "count": "7",
    },
    {
      "image": 'assets/icon/diamond.png',
      "count": "7",
    }
  ];

  final List<Map> offers = [
    {
      "coins": '500',
      "price": "\$4.99",
    },
    {
      "coins": '1,700',
      "price": "\$14.99",
    },
    {
      "coins": '3,000',
      "price": "\$20.99",
    },
    {
      "coins": '6,800',
      "price": "\$40.99",
    },
    {
      "coins": '10,000',
      "price": "\$74.99",
    },
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
              'Shop',
              style: Styles.Heading3(
                  textColor: Colors.white, fontbold: true, font: 'nunito'),
            )),
        body: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.fromLTRB(22 * fem, 28 * fem, 22 * fem, 100 * fem),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      30 * fem, 0 * fem, 30 * fem, 30 * fem),
                  width: double.infinity,
                  height: 26 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (Map m in credits)
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              17 * fem, 4 * fem, 15 * fem, 3 * fem),
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0x33000000)),
                            color: const Color(0xfffff8f8),
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 4 * fem, 1 * fem),
                                width: 14 * fem,
                                height: 14 * fem,
                                child: Image.asset(
                                  m["image"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                m["count"],
                                style: TextStyle(
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1725 * ffem / fem,
                                  color: const Color(0xff0e0101),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      64 * fem, 19.1 * fem, 65 * fem, 36.37 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                    color: const Color(0xfffff9f9),
                    borderRadius: BorderRadius.circular(5 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            1 * fem, 0 * fem, 0 * fem, 5.01 * fem),
                        child: Text(
                          'Coins',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 25 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3625 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            1 * fem, 0 * fem, 0 * fem, 32.56 * fem),
                        child: Text(
                          'Get More Coins to buy Power ups',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w300,
                            height: 1.3625 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      for (Map offer in offers)
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 44.56 * fem),
                          width: double.infinity,
                          height: 20.91 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 0.91 * fem, 0 * fem, 0.91 * fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0.91 * fem, 5 * fem, 0 * fem),
                                      width: 12 * fem,
                                      height: 10.91 * fem,
                                      child: Image.asset(
                                        'assets/icon/coin.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0 * fem, 2.09 * fem),
                                      child: Text(
                                        '${offer["coins"]} coins',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunito(
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.3625 * ffem / fem,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 87 * fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 87 * fem,
                                          height: 18.19 * fem,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      3 * fem),
                                              border: Border.all(
                                                  color:
                                                      const Color(0x33000000)),
                                              color: const Color(0xffe7d52c),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 25 * fem,
                                      top: 0.9093017578 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          height: 20 * fem,
                                          child: Text(
                                            offer["price"],
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.nunito(
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.3625 * ffem / fem,
                                              color: const Color(0xff000000),
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
                        padding: EdgeInsets.fromLTRB(
                            45 * fem, 7 * fem, 45 * fem, 5 * fem),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0x33000000)),
                          color: const Color(0xffe7d52c),
                          borderRadius: BorderRadius.circular(4 * fem),
                        ),
                        child: Text(
                          'Continue',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 25 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3625 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
