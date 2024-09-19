import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_care/loginPagePetOwner.dart';
import 'payment.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      theme: myTheme,
      home: LottieAnimationPayment(),
    );
  }
}

class LottieAnimationPayment extends StatefulWidget {
  @override
  _LottieAnimationPageState createState() => _LottieAnimationPageState();
}

class _LottieAnimationPageState extends State<LottieAnimationPayment> {
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
                    return LoginPage(); // Replace with your actual homepage
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
            Transform.scale(
  scale: 1.5, // Adjust the scale factor as needed to zoom in
  child: Lottie.asset('assets/paymentSuccessAnimation.json', repeat: false),
)



            // Use AnimatedOpacity to control the text's opacity
            // AnimatedOpacity(
            //   opacity: showText ? 1.0 : 0.0,
            //   duration: Duration(milliseconds: 500),
            //   child: Text(
            //     'Payment Successful!',
            //     style: TextStyle(
            //       fontSize: 28,
            //       fontWeight: FontWeight.w900,
            //       color: Color(0xFF38c172),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
