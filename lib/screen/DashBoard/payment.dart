import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/contants.dart';
import '../../utils/styles.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<Map> payList = [
    {
      "image": 'assets/dummy/cover1.png',
      "number": "2233-4455-6677",
    },
    {
      "image": 'assets/dummy/dp2.png',
      "number": "2233-4455-6677",
    },
    {
      "image": 'assets/dummy/dp3.png',
      "number": "2233-4455-6677",
    },
    {
      "image": 'assets/dummy/dp4.png',
      "number": "2233-4455-6677",
    },
    {
      "image": 'assets/dummy/dp5.png',
      "number": "2233-4455-6677",
    }
  ];
  int amount = 20;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
            backgroundColor: Colors.red,
            leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
            elevation: 2,
            centerTitle: true,
            title: Text(
              'Payment',
              style: Styles.Heading3(
                  textColor: Colors.white, fontbold: true, font: 'nunito'),
            )),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 30 * fem),
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    color: const Color(0xFFFFD4D4),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 393 * fem,
                          height: 41 * fem,
                          margin: EdgeInsets.symmetric(
                            horizontal: 20 * fem,
                            vertical: 10 * fem,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10 * fem),
                            color: const Color(0xffffffff),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Enter Phone No.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3625 * ffem / fem,
                                  color: const Color(0xff686868),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextFormField(
                                    maxLength: 2,
                                    cursorColor: redTitle,
                                    keyboardType: TextInputType.number,
                                    decoration: textFieldDecoration()),
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10 * fem),
                          width: 114 * fem,
                          height: 23 * fem,
                          decoration: BoxDecoration(
                            color: const Color(0xffff4141),
                            borderRadius: BorderRadius.circular(9 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Matches',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.3425219612 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        for (Map list in payList)
                          Container(
                            margin: EdgeInsets.all(10 * fem),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16 * fem, vertical: 9 * fem),
                            width: double.infinity,
                            height: 68 * fem,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(6 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 11 * fem, 0 * fem),
                                      width: 50 * fem,
                                      height: 50 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25 * fem),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            list['image'],
                                          ),
                                        ),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.nunito(
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.7520711327 * ffem / fem,
                                          color: const Color(0xff000000),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Phone No. -',
                                            style: GoogleFonts.nunito(
                                              fontSize: 12 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.7520711327 * ffem / fem,
                                              color: const Color(0xff535353),
                                            ),
                                          ),
                                          const TextSpan(
                                            text: ' ',
                                          ),
                                          TextSpan(
                                            text: list['number'],
                                            style: GoogleFonts.nunito(
                                              fontSize: 12 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.7520711327 * ffem / fem,
                                              color: const Color(0xffff4141),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 13 * fem, 0 * fem, 14 * fem),
                                  width: 75 * fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffff4141),
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'PAY',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.3425219612 * ffem / fem,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Container(
                    width: 430 * fem,
                    height: 90 * fem,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x1e000000),
                          offset: Offset(0 * fem, 0 * fem),
                          blurRadius: 3.5 * fem,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 30 * fem, vertical: 10 * fem),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 66 * fem,
                          height: 22 * fem,
                          child: Text(
                            'Set Amount',
                            style: GoogleFonts.nunito(
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.7520711327 * ffem / fem,
                              color: const Color(0xff868686),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 42 * fem,
                              height: 47 * fem,
                              child: Text(
                                'Rs.',
                                style: GoogleFonts.nunito(
                                  fontSize: 30 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5539999644 * ffem / fem,
                                  color: const Color(0xffff4141),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  if (amount > 10) {
                                    setState(() {
                                      amount -= 10;
                                    });
                                  }
                                },
                                child: const Icon(Icons.arrow_left)),
                            SizedBox(
                              height: 37 * fem,
                              child: Text(
                                '${amount}K',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 30 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2289999644 * ffem / fem,
                                  color: const Color(0xff252525),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    amount += 10;
                                  });
                                },
                                child: const Icon(Icons.arrow_right)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20 * fem),
                    height: 27 * fem,
                    width: 100 * fem,
                    decoration: BoxDecoration(
                      color: const Color(0xffff4141),
                      borderRadius: BorderRadius.circular(6 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Send',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 0.9039999247 * ffem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  textFieldDecoration() {
    return InputDecoration(
      isDense: true,
      counterText: "",
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFB6B6B6)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: redTitle),
      ),
    );
  }
}
