import 'package:flutter/material.dart';
import 'package:pet_care/loginPageServiceProvider.dart';
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/newbottom.dart';
import 'pet owner registration.dart';
import 'service_provider_registration.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pet_owner_homepage.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(PetCareApp());
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  void _login() {
    final String email = emailController.text;
    final String password = passwordController.text;

    // Validate email and password here
    if (email.isNotEmpty && password.isNotEmpty) {
      // Perform login logic, e.g., check credentials
      // You can add your authentication logic here

      // For now, let's print the entered email and password
      print('Email: $email');
      print('Password: $password');
    } else {
      // Show an error message if email or password is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter both email and password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset : false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 175, // Set the width as needed
              height: 175, // Set the height as needed
              child: Image.asset(
                'assets/images/petcarelogo2 orange.png',
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Use your custom color here
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Use your custom color here
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    color: Colors.black54, // Use your custom color here
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    // Toggle the icon based on password visibility state
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 24),
            // ElevatedButton(
            //   onPressed: _login,
            //   child: Text('Login'),
            // ),
            ElevatedButton(
              onPressed: () {
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      HomePage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SharedAxisTransition(
                      child: child,
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                    );
                  },
                );
                // Handle "Continue for Pet Details" logic here
                // You can navigate to the pet details page or perform any other action
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context)
                      .primaryColor, // Set the background color to secondary header color
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.white, // Set the text color to white
                ),

                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Set the border radius
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                    Size(200.0, 50.0)), // Set the minimum button size
              ),
              child: Text(
                'Login as Pet Owner',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // Navigate to the login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageProvider()),
                );
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).secondaryHeaderColor),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Click Here for',
                      style: TextStyle(
                        color: Colors.black, // Change the color here
                      ),
                    ),
                    TextSpan(
                        text: ' Service Provider Login Page',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),

            Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).secondaryHeaderColor),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              child: Text('Register Here'),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class PetCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care App',
      theme: myTheme,
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set the scaffold background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Register as a:',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87), // Use your custom color here),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.white, // Set the background color to white
                ),
                foregroundColor: MaterialStateProperty.all(
                  Theme.of(context)
                      .primaryColor, // Set the text color to secondary header color
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Set the border radius
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                    Size(200.0, 50.0)), // Set the minimum button size
              ),
              onPressed: () {
                // Navigate to the pet owner registration page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetOwnerRegistrationApp(),
                  ),
                );
              },
              child: Text(
                'Pet Owner',
                style: TextStyle(fontSize: 18), // Set the font size
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.white, // Set the background color to white
                ),
                foregroundColor: MaterialStateProperty.all(
                  Theme.of(context)
                      .primaryColor, // Set the text color to secondary header color
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Set the border radius
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                    Size(200.0, 50.0)), // Set the minimum button size
              ),
              onPressed: () {
                // Navigate to the service provider registration page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceRegistrationApp(),
                  ),
                );
              },
              child: Text(
                'Service Provider',
                style: TextStyle(fontSize: 18), // Set the font size
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor:
              Colors.white, // Set the app bar background color to white
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor, // Set the icon color
          ),
          title: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: -10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    // Use Navigator to navigate back to loginPage.dart and RegistrationPage
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false, // Remove all routes from the stack
                    );
                  },
                ),
              ),
              Center(
                child: Text(
                  'Pet CARE Registration',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PetOwnerRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add a back button to the AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // Navigate back to the login page
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => PetCareApp()),
              (route) => false, // Remove all routes from the stack
            );
          },
        ),
        title: Text('Pet Owner Registration'),
      ),
      body: Center(
        child: Text('Pet Owner Registration Form'),
      ),
    );
  }
}

class ServiceProviderRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider Registration'),
        // Add a back button to the AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // Navigate back to the login page
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => PetCareApp()),
              (route) => false, // Remove all routes from the stack
            );
          },
        ),
      ),
      body: Center(
        child: Text('Service Provider Registration Form'),
      ),
    );
  }
}
