import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serious_dating/screen/DashBoard/send_coins_bottomsheet.dart';
import 'package:serious_dating/utils/contants.dart';
import 'package:serious_dating/utils/helper.dart';

import '../../utils/commom.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key});

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return ColoredBox(
      color: const Color(0xffffa8dc),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 15 * fem),
          decoration: BoxDecoration(
            color: const Color(0xffffa8dc),
            boxShadow: [
              BoxShadow(
                color: const Color(0x3f000000),
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 2 * fem,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15 * fem),
                  padding:
                      EdgeInsets.fromLTRB(8 * fem, 18 * fem, 8 * fem, 26 * fem),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/dummy/livePic.png',
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24 * fem, vertical: 9 * fem),
                        width: double.infinity,
                        height: 42 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0x3a000000),
                          borderRadius: BorderRadius.circular(6 * fem),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.arrow_back_ios, color: Colors.white),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.settings, color: Colors.white),
                                SizedBox(width: 15),
                                Icon(Icons.account_balance_wallet_outlined,
                                    color: Colors.white),
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6.0 * fem),
                                child: Text(
                                  'Nitisha',
                                  style: SafeGoogleFont(
                                    'Nunito Sans',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3625 * ffem / fem,
                                    color: const Color(0xfffffbfb),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 40 * fem,
                                  height: 40 * fem,
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.person_add_alt_outlined,
                                        color: Color(0xFFFF7878)),
                                  )),
                            ],
                          ),
                          SizedBox(height: 10 * fem),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.location_on,
                                      color: Color(0xFFFF7878)),
                                  Text(
                                    '1 mile away',
                                    style: SafeGoogleFont(
                                      'Nunito Sans',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3625 * ffem / fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  width: 40 * fem,
                                  height: 40 * fem,
                                  child: Icon(
                                    Icons.chat,
                                    color: Colors.white,
                                    size: 36 * fem,
                                  )),
                            ],
                          ),
                          SizedBox(height: 10 * fem),
                          GestureDetector(
                            onTap: _showBottomSheet,
                            child: Container(
                              width: 376 * fem,
                              height: 33 * fem,
                              padding: EdgeInsets.symmetric(
                                  vertical: 6 * fem, horizontal: 12 * fem),
                              decoration: BoxDecoration(
                                color: const Color(0x38ffffff),
                                borderRadius: BorderRadius.circular(6 * fem),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/icon/ic_cross.png',
                                  ),
                                  Image.asset(
                                    'assets/icon/ic_star.png',
                                  ),
                                  Image.asset(
                                    'assets/icon/ic_heart.png',
                                  ),
                                  Image.asset(
                                    'assets/icon/ic_cart.png',
                                  ),
                                  Image.asset(
                                    'assets/icon/ic_gift.png',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0, 0.949),
                    end: Alignment(-0, -1),
                    colors: <Color>[Color(0xffff8484), Color(0x00ff0000)],
                    stops: <double>[0, 1],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: UiHelper.getSize(context).height / 7,
                      child: ListView(
                        children: List.generate(
                            3,
                            (index) => Container(
                                  margin: EdgeInsets.only(
                                      top: 15 * fem,
                                      left: 15 * fem,
                                      right: 15 * fem),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 38 * fem,
                                        height: 38 * fem,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 9 * fem),
                                          child: Text(
                                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                                            style: SafeGoogleFont(
                                              'Nunito Sans',
                                              fontSize: 10 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.3625 * ffem / fem,
                                              color: const Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Icon(Icons.thumb_up_off_alt,
                                          color: Colors.white),
                                      SizedBox(width: 9 * fem),
                                      const Icon(
                                          CupertinoIcons.arrow_turn_up_left,
                                          color: Colors.white),
                                      SizedBox(width: 9 * fem),
                                      const Icon(Icons.error_outline_rounded,
                                          color: Colors.white),
                                    ],
                                  ),
                                )),
                      ),
                    ),
                    SizedBox(height: 15 * fem),
                    Container(
                      width: double.infinity,
                      height: 36 * fem,
                      margin: EdgeInsets.only(
                          bottom: 15 * fem, left: 15 * fem, right: 15 * fem),
                      padding: EdgeInsets.symmetric(
                          vertical: 3 * fem, horizontal: 12 * fem),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9 * fem),
                        color: const Color(0xffffffff),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: TextFormField()),
                          const SizedBox(width: 6),
                          Icon(Icons.send_rounded, color: red),
                          const SizedBox(width: 6),
                          Icon(Icons.add_box_rounded, color: red),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        enableDrag: true,
        isDismissible: true,
        context: context,
        builder: (context) {
          return const SendCoinsBottomSheet();
        });
  }
}
