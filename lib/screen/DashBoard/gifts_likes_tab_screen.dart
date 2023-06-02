import 'package:flutter/material.dart';
import 'package:serious_dating/utils/styles.dart';

import '../../utils/contants.dart';
import 'user_match_screen.dart';

class GiftsLikesScreen extends StatefulWidget {
  const GiftsLikesScreen({super.key});

  @override
  State<GiftsLikesScreen> createState() => _GiftsLikesScreenState();
}

class _GiftsLikesScreenState extends State<GiftsLikesScreen> {
  final List<Map> gifts = [
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
  final List<Map> likes = [
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
          centerTitle: true,
          elevation: 1,
          bottom: TabBar(
            indicatorColor: red,
            labelColor: red,
            tabs: [
              Tab(
                text: "${gifts.length} Gifts",
              ),
              Tab(
                text: "${likes.length} Likes",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProfileCardListView(profiles: gifts),
            ProfileCardListView(profiles: likes)
          ],
        ),
      ),
    );
  }
}

class ProfileCardListView extends StatelessWidget {
  const ProfileCardListView({
    super.key,
    required this.profiles,
  });

  final List<Map> profiles;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFFF5F5F5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) => GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                childAspectRatio: MediaQuery.of(context).size.aspectRatio / 0.7,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  profiles.length,
                  (index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, UserMatchScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x0a000000),
                              blurRadius: 4,
                              offset: Offset(1, 2),
                              spreadRadius: 1),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            profiles[index]["image"]),
                                        fit: BoxFit.cover))),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(profiles[index]["name"],
                                        style: Styles.Heading5(
                                            font: 'nunito',
                                            textColor: redTitle,
                                            fontbold: true)),
                                    Text('1 mile away',
                                        style: Styles.Heading5(
                                            font: 'nunito',
                                            textColor: redTitle)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.thumb_up_off_alt,
                                        size: 16, color: redTitle),
                                    const SizedBox(width: 6),
                                    Icon(Icons.cancel_outlined,
                                        size: 16, color: redTitle)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
