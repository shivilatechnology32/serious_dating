import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:serious_dating/screen/DashBoard/payment.dart';
import 'package:serious_dating/screen/DashBoard/payment_status.dart';
import 'package:serious_dating/screen/DashBoard/people_nearby.dart';
import 'package:serious_dating/screen/DashBoard/shop.dart';
import 'package:serious_dating/utils/contants.dart';

import 'discovery_settings.dart';

class BottomNavigator extends StatefulWidget {
  static String routeName = "/BottomNavigator";
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 4;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    DiscoverySettings(),
    PeopleNearby(),
    Shop(),
    PaymentStatus(),
    PaymentScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          // borderRadius: const BorderRadius.only(
          //     topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: const Color.fromARGB(248, 188, 187, 187),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 30,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.white30,
            backgroundColor: red,
            color: Colors.white,
            tabs: const [
              GButton(
                icon: Icons.home,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
              ),
              GButton(
                icon: Icons.person_pin_circle_rounded,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
              ),
              GButton(
                icon: Icons.message_outlined,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
              ),
              GButton(
                icon: Icons.person,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
              ),
              GButton(
                icon: Icons.settings,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
