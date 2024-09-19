import 'package:flutter/material.dart';
import 'loginPagePetOwner.dart';
import 'main.dart';
import 'services_registration.dart';




void main() {
  runApp(ServiceRegistrationApp());
}

class ServiceRegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServiceRegistrationPage(),
      theme: myTheme,
      debugShowCheckedModeBanner: false, // Set this to false
    );
  }
}

class ServiceRegistrationPage extends StatefulWidget {
  @override
  _ServiceRegistrationPageState createState() =>
      _ServiceRegistrationPageState();
}

class _ServiceRegistrationPageState extends State<ServiceRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _email;
  String? _password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set the scaffold background color to white
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          title: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: -10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()),
                      (route) => false,
                    );
                  },
                ),
              ),
              Center(
                child: Text(
                  'Service Provider Registration',
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .primaryColor, // Secondary header color
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid Email ID';
    }
                  return null;
                },
              ),
              SizedBox(height: 16), // Add spacing between fields
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .primaryColor, // Secondary header color
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
                  return null;
                },
              ),
              SizedBox(height: 16), // Add spacing between fields
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .primaryColor, // Secondary header color
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
                  return null;
                },
              ),
              SizedBox(height: 16), // Add spacing between fields
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColor,
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(150.0, 45.0)),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _email = _emailController.text;
                    _password = _passwordController.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceProviderRegistrationApp(),
                      ),
                    );
                    // Handle registration logic here
                  }
                },
                child: Text(
                  'Add Service Details',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
