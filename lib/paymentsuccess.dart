import 'package:flutter/material.dart';
import 'pages in service provider homepage/serviceproviderhomepage.dart';
import 'pages in pet owner homepage/pet_owner_homepage.dart';
import 'loginPagePetOwner.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay the navigation to the next screen after 2 seconds (adjust the duration as needed)
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
          context, '/loginPage'); // Navigate to the home screen
    });
    // initialRoute:
    // '/'; // Set an initial route (can be any route)
    // routes:
    // {
    //   '/';
    //   (context) =>
    //       SplashScreen(); // Replace 'SplashScreen' with your splash screen
    //   '/service_provider_home';
    //   (context) => ServiceProviderHomePage();
    //   // Other routes...
    // }
    // ;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Wrap the splash screen with GestureDetector
      onTap: () {
        // Navigate to ServiceProviderHomePage when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
      child: Scaffold(
        body: Container(
          color: Colors.green,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Payment Successful!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0), // Add spacing between texts
                Text(
                  'PetCARE',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}