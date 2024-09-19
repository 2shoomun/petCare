import 'package:flutter/material.dart';
import 'package:pet_care/loginPagePetOwner.dart';
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petOwnerProfilePage.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petProfilePage.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/slidingbar.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pet_owner_homepage.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      theme: myTheme,
      home: MyHomePage(),
    );
  }
}

class FrostedBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  FrostedBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color:
                Colors.transparent, // Adjust opacity to control the lightness
            child: BottomNavigationBar(
              elevation: 0.0,
              selectedItemColor: Theme.of(context).primaryColor,
              currentIndex: currentIndex,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              backgroundColor:
                  Colors.transparent, // Make the background transparent
            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(), // Disable swiping
      ),
      bottomNavigationBar: FrostedBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
      extendBody:
          true, // Allow content to extend behind the BottomNavigationBar
    );
  }

  final List<Widget> _pages = [
    History(),
    HomePage(),
    ProfilePage(),
  ];
}
