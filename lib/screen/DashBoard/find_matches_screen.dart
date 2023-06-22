import 'package:flutter/material.dart';
import 'package:serious_dating/utils/contants.dart';

import '../../utils/helper.dart';
import '../../utils/styles.dart';
import 'gifts_likes_tab_screen.dart';

class FindMatches extends StatefulWidget {
  const FindMatches({super.key});

  @override
  State<FindMatches> createState() => _FindMatchesState();
}

class _FindMatchesState extends State<FindMatches> {
  final List<Map> profiles = [
    {
      "image": 'assets/dummy/dp1.png',
      "name": "Ira Guha",
    },
    {
      "image": 'assets/dummy/dp2.png',
      "name": "Ira Guha",
    },
    {
      "image": 'assets/dummy/dp3.png',
      "name": "Ira Guha",
    },
    {
      "image": 'assets/dummy/dp4.png',
      "name": "Ira Guha",
    },
    {
      "image": 'assets/dummy/dp5.png',
      "name": "Ira Guha",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
          elevation: 0,
          title: Text('Matches',
              style: Styles.Heading3(
                  textColor: Colors.white, fontbold: true, font: 'nunito')),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: UiHelper.getSize(context).width / 5,
                    right: UiHelper.getSize(context).width / 5,
                    bottom: 18),
                color: Colors.red,
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: Styles.Heading5(textColor: Colors.white, font: 'sans'),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 16),
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
                  'Find Matches',
                  style: Styles.Heading4(
                      font: 'sans', textColor: redTitle, fontbold: true),
                ),
              ),
              ProfileCardListView(profiles: profiles),
            ],
          ),
        ));
  }

  listTileWidget({required String title, Widget? trail}) {
    return ListTile(
      title: Text(title,
          style: Styles.Heading3(
              textColor: redTitle, fontbold: true, font: 'nunito')),
      trailing: trail,
    );
  }
}
