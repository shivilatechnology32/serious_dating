import 'package:flutter/material.dart';

import '../../utils/commom.dart';
import '../../utils/helper.dart';

class SendCoinsBottomSheet extends StatefulWidget {
  const SendCoinsBottomSheet({Key? key}) : super(key: key);

  @override
  State<SendCoinsBottomSheet> createState() => _SendCoinsBottomSheetState();
}

class _SendCoinsBottomSheetState extends State<SendCoinsBottomSheet> {
  late String otpNumber;
  dynamic sec = 30;
  String resendText = 'Resend code in ', verifyText = "Verify OTP";
  bool invalidVisible = false;
  String selected = 'b';
  final List<Map> creditTypes = [
    {"image": 'assets/icon/ic_rose.png', "name": "Rose", "price": "99"},
    {
      "image": 'assets/icon/ic_love.png',
      "name": "Finger heart",
      "price": "134"
    },
    {"image": 'assets/icon/ic_gift_box.png', "name": "Box", "price": "399"},
    {"image": 'assets/icon/ic_rose.png', "name": "Rose", "price": "99"},
    {
      "image": 'assets/icon/ic_love.png',
      "name": "Finger heart",
      "price": "134"
    },
    {"image": 'assets/icon/ic_gift_box.png', "name": "Box", "price": "399"},
    {"image": 'assets/icon/ic_rose.png', "name": "Rose", "price": "99"},
    {
      "image": 'assets/icon/ic_love.png',
      "name": "Finger heart",
      "price": "134"
    },
    {"image": 'assets/icon/ic_gift_box.png', "name": "Box", "price": "399"},
  ];

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFFF8585),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 18),
              Image.asset(
                'assets/icon/coin.png',
                height: 18 * fem,
                width: 18 * fem,
              ),
              const SizedBox(width: 6),
              const Text(
                '99',
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected = 'b';
                        });
                      },
                      child: Container(
                        width: 84 * fem,
                        height: 31 * fem,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(4)),
                          gradient: selected != 'b'
                              ? const LinearGradient(
                                  begin: Alignment(0, -1),
                                  end: Alignment(0, 1),
                                  colors: <Color>[
                                    Color(0xffff498a),
                                    Color(0x89ff498a)
                                  ],
                                  stops: <double>[0, 1],
                                )
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            'Basic',
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1725 * ffem / fem,
                              color: selected != 'b'
                                  ? Colors.white
                                  : const Color(0xffff1e1e),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 1),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected = 'a';
                        });
                      },
                      child: Container(
                        width: 84 * fem,
                        height: 31 * fem,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: selected != 'a'
                              ? const LinearGradient(
                                  begin: Alignment(0, -1),
                                  end: Alignment(0, 1),
                                  colors: <Color>[
                                    Color(0xffff498a),
                                    Color(0x89ff498a)
                                  ],
                                  stops: <double>[0, 1],
                                )
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            'Advance',
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1725 * ffem / fem,
                              color: selected != 'a'
                                  ? Colors.white
                                  : const Color(0xffff1e1e),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 1),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected = 'v';
                        });
                      },
                      child: Container(
                        width: 84 * fem,
                        height: 31 * fem,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: selected != 'v'
                              ? const LinearGradient(
                                  begin: Alignment(0, -1),
                                  end: Alignment(0, 1),
                                  colors: <Color>[
                                    Color(0xffff498a),
                                    Color(0x89ff498a)
                                  ],
                                  stops: <double>[0, 1],
                                )
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            'Vip',
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1725 * ffem / fem,
                              color: selected != 'v'
                                  ? Colors.white
                                  : const Color(0xffff1e1e),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
              width: UiHelper.getSize(context).width,
              padding: EdgeInsets.all(20.0 * fem),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: creditTypes.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 0, mainAxisSpacing: 0),
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 37 * fem,
                    height: 74 * fem,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30 * fem,
                            height: 30 * fem,
                            child: Image.asset(
                              creditTypes[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 3 * fem),
                            child: Text(
                              creditTypes[index]['name'],
                              style: SafeGoogleFont(
                                'Open Sans',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.3625 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 6 * fem, 0 * fem),
                                width: 11 * fem,
                                height: 11 * fem,
                                child: Image.asset(
                                  'assets/icon/coin.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                creditTypes[index]['price'],
                                style: SafeGoogleFont(
                                  'Roboto',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1725 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
          Container(
            width: 136 * fem,
            height: 35 * fem,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10 * fem),
            ),
            child: Center(
              child: Text(
                'Send',
                style: SafeGoogleFont(
                  'Roboto',
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.1725 * ffem / fem,
                  color: Color(0xffff1e1e),
                ),
              ),
            ),
          ),
          SizedBox(height: 35 * fem)
        ],
      ),
    );
  }
}
