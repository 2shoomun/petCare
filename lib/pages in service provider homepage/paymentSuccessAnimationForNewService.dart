import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/newbottom.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pet_owner_homepage.dart';
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20service%20provider%20homepage/homeServiceProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      theme: myTheme,
      home: LottieAnimationPaymentService(),
    );
  }
}

class LottieAnimationPaymentService extends StatefulWidget {
  @override
  _LottieAnimationPageState createState() => _LottieAnimationPageState();
}

class _LottieAnimationPageState extends State<LottieAnimationPaymentService> {
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
            
              // Use Navigator to navigate to the next page with a fade transition
             Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
            
            
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
