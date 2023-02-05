import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ytlogin/Homepage/BottomLogOutPage.dart';
import 'BottomHomePage.dart';
import 'BottomMenuPage.dart';
import 'BottomProfilePage.dart';

final user = FirebaseAuth.instance.currentUser!;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final BottomPages = [
    BottomHomePage(),
    BottomMenuPage(),
    BottomProfilePage(),
    BottomLogOutPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
            ),
            Text(
              user.email!,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Ionicons.notifications_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Ionicons.search_outline),
          )
        ],
      ),
      body: BottomPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 20,
        selectedFontSize: 18,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.menu_outline),
            label: 'Menu',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: 'Profile',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.log_out_outline),
            label: 'Log Out',
            backgroundColor: Colors.red,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
