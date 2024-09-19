import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/newbottom.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pet_owner_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      theme: myTheme,
      home: LottieAnimationPage(),
    );
  }
}

class LottieAnimationPage extends StatefulWidget {
  @override
  _LottieAnimationPageState createState() => _LottieAnimationPageState();
}

class _LottieAnimationPageState extends State<LottieAnimationPage> {
  bool showText = false;

  @override
  void initState() {
    super.initState();
    // Add a delay to show the text after two seconds
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          showText = true;
          // Add a delay before transitioning to the next page
          Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              // Use Navigator to navigate to the next page with a fade transition
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return MyHomePage(); // Replace with your actual homepage
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Load a Lottie animation from an asset
            Lottie.asset('assets/SentAnimation.json', repeat: false),

            // Use AnimatedOpacity to control the text's opacity
            AnimatedOpacity(
              opacity: showText ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Text(
                'REQUEST SENT!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
