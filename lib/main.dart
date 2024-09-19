import 'package:flutter/material.dart';
import 'loginPagePetOwner.dart';

void main() {
  runApp(PetCareApp());
}

final Color customPrimaryColor =
    Color(0xFFff6500); 
final Color customSecondaryColor =
    Color(0xFFffa100); 

final ThemeData myTheme = ThemeData(
  androidOverscrollIndicator: AndroidOverscrollIndicator.stretch, // For Android
  primaryColor: customPrimaryColor, // Set your custom primary color
  secondaryHeaderColor: customSecondaryColor, // Set your custom secondary color
);

class PetCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care App',
      theme: myTheme,
      home: LoginPage(),
      debugShowCheckedModeBanner: false, // Set this to false
    );
  }
}

