import 'package:flutter/material.dart';
import 'package:serious_dating/utils/helper.dart';

import '../../utils/contants.dart';
import '../../utils/styles.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  String _cardType = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              titleWidget(
                  title: 'Card Details',
                  widget: Form(
                    child: Container(
                      color: const Color(0xFFFF9F9F),
                      width: 900,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 18),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Choose Card :',
                                    style: Styles.Heading3(
                                        textColor: Colors.white,
                                        font: 'sans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.credit_card_rounded,
                                        color: _cardType == 'D'
                                            ? redTitle
                                            : Colors.white,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _cardType = 'D';
                                          });
                                        },
                                        child: Text(
                                          'Debit Card ',
                                          style: Styles.Heading4(
                                              textColor: _cardType == 'D'
                                                  ? redTitle
                                                  : Colors.white,
                                              font: 'sans'),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Icon(Icons.credit_card_rounded,
                                          color: _cardType == 'C'
                                              ? redTitle
                                              : Colors.white),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _cardType = 'C';
                                          });
                                        },
                                        child: Text(
                                          'Credit Card ',
                                          style: Styles.Heading4(
                                              textColor: _cardType == 'C'
                                                  ? redTitle
                                                  : Colors.white,
                                              font: 'sans'),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Card No. ',
                                    style: Styles.Heading3(
                                        textColor: Colors.white,
                                        font: 'sans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    cursorColor: redTitle,
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: textFieldDecoration(),
                                  ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'CVV No. ',
                                          style: Styles.Heading3(
                                              textColor: Colors.white,
                                              font: 'sans',
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                          maxLength: 3,
                                          cursorColor: redTitle,
                                          keyboardType: TextInputType.number,
                                          decoration: textFieldDecoration(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            if (value.length == 3) {
                                              FocusScope.of(context)
                                                  .focusInDirection(
                                                      TraversalDirection.right);
                                            }
                                          },
                                        ))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Exp Date: ',
                                          style: Styles.Heading3(
                                              textColor: Colors.white,
                                              font: 'sans',
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                          maxLength: 2,
                                          cursorColor: redTitle,
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: textFieldDecoration(),
                                          onChanged: (value) {
                                            if (value.length == 2) {
                                              FocusScope.of(context)
                                                  .focusInDirection(
                                                      TraversalDirection.right);
                                            }
                                          },
                                        )),
                                        Text(
                                          '/',
                                          style: Styles.Heading3(
                                              textColor: Colors.white,
                                              font: 'sans',
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                          maxLength: 2,
                                          cursorColor: redTitle,
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: textFieldDecoration(),
                                          onChanged: (value) {
                                            if (value.length == 2) {
                                              FocusScope.of(context)
                                                  .focusInDirection(
                                                      TraversalDirection.right);
                                            } else if (value.isEmpty) {
                                              FocusScope.of(context)
                                                  .focusInDirection(
                                                      TraversalDirection.left);
                                            }
                                          },
                                        )),
                                        Text(
                                          '/',
                                          style: Styles.Heading3(
                                              textColor: Colors.white,
                                              font: 'sans',
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                          maxLength: 2,
                                          cursorColor: redTitle,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          keyboardType: TextInputType.number,
                                          decoration: textFieldDecoration(),
                                          onChanged: (value) {
                                            if (value.isEmpty) {
                                              FocusScope.of(context)
                                                  .focusInDirection(
                                                      TraversalDirection.left);
                                            }
                                          },
                                        ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0x0f000000),
                                      blurRadius: 2,
                                      offset: Offset(1, 1),
                                      spreadRadius: 2),
                                ],
                              ),
                              child: Text(
                                'Make Pay',
                                style: Styles.Heading4(
                                    font: 'sans',
                                    textColor: redTitle,
                                    fontbold: true),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              titleWidget(
                  title: 'Online Pay',
                  widget: Container(
                    color: const Color(0xFFFFD4D4),
                    width: UiHelper.getSize(context).width,
                    child: Column(
                      children: [
                        const SizedBox(height: 36),
                        Container(
                          height: 45,
                          width: UiHelper.getSize(context).width * 0.80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          height: 45,
                          width: UiHelper.getSize(context).width * 0.80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x0f000000),
                                  blurRadius: 2,
                                  offset: Offset(1, 1),
                                  spreadRadius: 2),
                            ],
                          ),
                          child: Text(
                            'Done',
                            style: Styles.Heading4(
                                font: 'sans',
                                textColor: redTitle,
                                fontbold: true),
                          ),
                        ),
                        const SizedBox(height: 18)
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  titleWidget({required String title, required Widget widget}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 30, bottom: 10),
          child: Text(
            title,
            style: Styles.Heading3(
                textColor: black, font: 'sans', fontWeight: FontWeight.w500),
          ),
        ),
        widget
      ],
    );
  }

  textFieldDecoration() {
    return InputDecoration(
      isDense: true,
      counterText: "",
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: redTitle),
      ),
    );
  }
}
