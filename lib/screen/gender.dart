import 'package:flutter/material.dart';
import 'package:serious_dating/utils/contants.dart' as Contsant;
import 'package:serious_dating/utils/helper.dart';
import 'package:serious_dating/utils/styles.dart';

import '../widget/sign_btn.dart';
import 'interest.dart';

class SelectGender extends StatefulWidget {
  static String routeName = "/SelectGender";

  const SelectGender({super.key});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  List<String> genderList = ['Man', 'Woman', 'Other'];
  String selectValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: UiHelper.getSize(context).height,
        child: Stack(
          children: [
            Container(
              width: UiHelper.getSize(context).width,
              color: const Color(0xffFFE3E3),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Contsant.redTitle,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: UiHelper.getSize(context).height * 0.07,
                ),
                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      "I am a",
                      style: Styles.Heading3(
                          textColor: Colors.black,
                          fontbold: true,
                          font: 'nunito'),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                SizedBox(
                  // color: Colors.white,
                  height: UiHelper.getSize(context).height / 3.9,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: false,
                    children: List.generate(
                      genderList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            selectValue = genderList[index];
                            setState(() {});
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: selectValue == genderList[index]
                                      ? Contsant.redTitle
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: UiHelper.getSize(context).width / 1.76,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text(
                                      genderList[index],
                                      style: Styles.Heading4(
                                          textColor:
                                              selectValue == genderList[index]
                                                  ? Colors.white
                                                  : Colors.grey,
                                          font: 'sans'),
                                    ),
                                    const Spacer(),
                                    if (selectValue == genderList[index])
                                      const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip >",
                      style: Styles.Heading4(
                          textColor: Contsant.redTitle, font: 'sans'),
                    ),
                    // icon: Icon(Icons.arrow_forward_ios),
                  ),
                )
              ]),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: UiHelper.getSize(context).width,
                height: UiHelper.getSize(context).height * 0.45,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icon/half_circle.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: SignInBtn(
                        onTap: () {
                          Navigator.pushNamed(context, Interest.routeName);
                        },
                        title: "Continue",
                        btnColor: const Color(0xffFF3D3D),
                        titleColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
/**
    const SizedBox(
    height: 10,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    ),
    width: UiHelper.getSize(context).width / 1.76,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(children: [
    Text(
    "Weman",
    style: Styles.Heading4(),
    )
    ]),
    ),
    ),
    ],
    ),
    const SizedBox(
    height: 10,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    ),
    width: UiHelper.getSize(context).width / 1.76,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(children: [
    Text(
    "Other",
    style: Styles.Heading4(),
    )
    ]),
    ),
    ),
    ],
    ),
 */
