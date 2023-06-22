import 'package:flutter/material.dart';
import 'package:serious_dating/utils/contants.dart';

import '../../utils/helper.dart';
import '../../utils/styles.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final Map<String, dynamic> settingsValue = {
    'Notification': true,
    'Dark Mode': false,
    'Disable Adds': false,
    'Font Size': 1,
    'Language': 'English'
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
            backgroundColor: Colors.red,
            leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
            elevation: 2,
            centerTitle: true,
            title: Text(
              'Settings',
              style: Styles.Heading3(
                  textColor: Colors.white, fontbold: true, font: 'nunito'),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 15),
                    listTileWidget(
                        title: 'Notification',
                        trail: Switch(
                          activeColor: redTitle,
                          value: settingsValue['Notification'] ?? false,
                          onChanged: (value) {
                            setState(() {
                              settingsValue['Notification'] = value;
                            });
                          },
                        )),
                    const SizedBox(height: 15),
                    listTileWidget(
                        title: 'Dark Mode',
                        trail: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: const BoxDecoration(
                                  color: Color(0xFF81BBFF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text('VIP',
                                  style: Styles.Heading5(
                                      fontbold: true,
                                      textColor: Colors.white,
                                      font: 'nunito')),
                            ),
                            Switch(
                              activeColor: redTitle,
                              value: settingsValue['Dark Mode'] ?? false,
                              onChanged: (value) {
                                setState(() {
                                  settingsValue['Dark Mode'] = value;
                                });
                              },
                            ),
                          ],
                        )),
                    const SizedBox(height: 15),
                    listTileWidget(
                        title: 'Font Size',
                        trail: Container(
                          height: 26,
                          width: 78,
                          margin: const EdgeInsets.only(left: 6),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: redTitle, width: 1),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                    child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  iconSize: 18,
                                  icon: const Icon(Icons.remove),
                                  color: redTitle,
                                  onPressed: () {
                                    if (settingsValue['Font Size'] > 1) {
                                      setState(() {
                                        settingsValue['Font Size']--;
                                      });
                                    }
                                  },
                                )),
                                Expanded(
                                    child: Center(
                                  child: Text(
                                    settingsValue['Font Size'].toString(),
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF4F4F4F)),
                                  ),
                                )),
                                Expanded(
                                    child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  iconSize: 18,
                                  icon: const Icon(Icons.add),
                                  color: redTitle,
                                  onPressed: () {
                                    setState(() {
                                      settingsValue['Font Size']++;
                                    });
                                  },
                                )),
                              ]),
                        )),
                    const SizedBox(height: 15),
                    listTileWidget(
                        title: 'Language',
                        trail: SizedBox(
                          child: DropdownButton<String>(
                            style: const TextStyle(color: Color(0xFF4F4F4F)),
                            iconEnabledColor: Colors.red,
                            value: settingsValue['Language'],
                            onChanged: (value) {
                              setState(() {
                                settingsValue['Language'] = value;
                              });
                            },
                            items: <String>['English', 'Detuch', 'Chinese']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )),
                    const SizedBox(height: 15),
                    listTileWidget(
                        title: 'Disable Ads',
                        trail: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: const BoxDecoration(
                                  color: Color(0xFF81BBFF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text('VIP',
                                  style: Styles.Heading5(
                                      fontbold: true,
                                      textColor: Colors.white,
                                      font: 'nunito')),
                            ),
                            Switch(
                              activeColor: redTitle,
                              value: settingsValue['Disable Adds'] ?? false,
                              onChanged: (value) {
                                setState(() {
                                  settingsValue['Disable Adds'] = value;
                                });
                              },
                            ),
                          ],
                        )),
                    const SizedBox(height: 15),
                    listTileWidget(title: 'Profile'),
                    const SizedBox(height: 15),
                    Container(
                      height: 90,
                      width: UiHelper.getSize(context).width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/dummy/sale.png'),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(height: 15)
                  ],
                ),
              ],
            ),
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
