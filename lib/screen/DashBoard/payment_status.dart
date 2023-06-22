import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/styles.dart';

class PaymentStatus extends StatefulWidget {
  const PaymentStatus({super.key});

  @override
  State<PaymentStatus> createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.red,
          leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
          elevation: 2,
          title: Text(
            'Payment Type',
            style: Styles.Heading3(
                textColor: Colors.white, fontbold: true, font: 'nunito'),
          ),
          centerTitle: true),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(30 * fem, 40 * fem, 30 * fem, 0 * fem),
          decoration: const BoxDecoration(
            color: Color(0xffff8d8d),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 37 * fem),
                padding: EdgeInsets.fromLTRB(
                    80.5 * fem, 49 * fem, 80.5 * fem, 49 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(17 * fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          18.5 * fem, 0 * fem, 18.5 * fem, 19 * fem),
                      padding: EdgeInsets.all(40 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xffff3838), width: 4),
                        color: const Color(0xffffffff),
                      ),
                      child: FittedBox(
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: Color(0xFFFF3838),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Payment Successful',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.6952274323 * ffem / fem,
                        color: const Color(0xffff3838),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(89 * fem, 0 * fem, 88 * fem, 0 * fem),
                width: double.infinity,
                height: 49 * fem,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(18 * fem),
                ),
                child: Center(
                  child: Text(
                    'Add More',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.8819281769 * ffem / fem,
                      color: const Color(0xffff0000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30 * fem)
            ],
          ),
        ),
      ),
    );
  }
}
