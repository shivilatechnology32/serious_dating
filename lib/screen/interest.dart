import 'package:flutter/material.dart';
import 'package:serious_dating/utils/contants.dart' as Constant;
import 'package:serious_dating/utils/helper.dart';

class Interest extends StatefulWidget {
  static String routeName = "/Interest";
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Constant.bgColor,
          height: UiHelper.getSize(context).height / 1,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Constant.redTitle,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: []),
              )
            ],
          )),
    );
  }
}
