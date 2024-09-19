import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pet_care/main.dart';
import 'pet_registration.dart';
import 'loginPagePetOwner.dart';

void main() {
  runApp(PetOwnerRegistrationApp());
}

class PetOwnerRegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Owner Registration',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: PetOwnerRegistrationPage(),
    );
  }
}

class PetOwnerRegistrationPage extends StatefulWidget {
  @override
  _PetOwnerRegistrationPageState createState() =>
      _PetOwnerRegistrationPageState();
}

class _PetOwnerRegistrationPageState extends State<PetOwnerRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String userType = '';
  String ssn = '';
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String addressLine1 = '';
  String addressLine2 = '';
  String city = '';
  String pinCode = '';
  String contactNumber = '';
  String alternatePhoneNumber = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  ScrollController _scrollController = ScrollController();

  final List<String> petGradeOptions = [
    'Friendly',
    'Neutral',
    'Unfriendly',
    'Hostile'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Pet Owner Registration',
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
                controller: _scrollController,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Social Security Number (XXX-XX-XXXX)*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '###-##-####',
                    filter: {"#": RegExp(r'[0-9]')},
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Social Security Number';
                  }
                  if (!RegExp(r'^\d{3}-\d{2}-\d{4}$').hasMatch(value)) {
                    return 'Invalid SSN format. Please use XXX-XX-XXXX';
                  }
                  return null;
                },
                onChanged: (value) {
                  ssn = value.replaceAll('-', '');
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'First Name*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your First Name';
                  }
                  return null;
                },
                onChanged: (value) {
                  firstName = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Middle Name',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                onChanged: (value) {
                  middleName = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Last Name*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Last Name';
                  }
                  return null;
                },
                onChanged: (value) {
                  lastName = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address Line 1*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Address Line 1';
                  }
                  return null;
                },
                onChanged: (value) {
                  addressLine1 = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address Line 2',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                onChanged: (value) {
                  addressLine2 = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'City*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter City';
                  }
                  return null;
                },
                onChanged: (value) {
                  city = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Pincode*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '#####',
                    filter: {"#": RegExp(r'[0-9]')},
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Pincode';
                  }
                  return null;
                },
                onChanged: (value) {
                  pinCode = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contact number*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '##########',
                    filter: {"#": RegExp(r'[0-9]')},
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Contact number';
                  }
                  return null;
                },
                onChanged: (value) {
                  contactNumber = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Alternate Contact number',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '##########',
                    filter: {"#": RegExp(r'[0-9]')},
                  ),
                ],
                onChanged: (value) {
                  alternatePhoneNumber = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
  decoration: InputDecoration(
    labelText: 'Email ID*',
    labelStyle: TextStyle(
      color: Colors.black54, // Use your custom color here
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
      ),
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an Email ID';
    }
    // Define a regular expression for a valid email address
    // This regex checks for basic email format but doesn't ensure the existence of the email address.
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid Email ID';
    }
    return null;
  },
  onChanged: (value) {
    email = value;
  },
),

              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Password';
                  }
                  if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
                  return null;
                },
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your Password';
                  }
                  if (value != password) {
                    return 'Passwords do not match';
                  }
                  if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
                  return null;
                },
                onChanged: (value) {
                  confirmPassword = value;
                },
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
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
                        borderRadius: BorderRadius.circular(
                            30.0), // Set the border radius
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                        Size(150.0, 45.0)), // Set the minimum button size
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetRegistrationPage(),
                        ),
                      );
                    }
                    else{
                       _scrollController.animateTo(
          0.0,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
                    }
                  },
                  child: Text('Add Pet Details'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
