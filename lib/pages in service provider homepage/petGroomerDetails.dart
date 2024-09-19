import 'package:flutter/material.dart';
import 'package:pet_care/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: ServiceDetailPetGroomer(),
    );
  }
}

class ServiceDetailPetGroomer extends StatefulWidget {
  @override
  _ServiceDetailPetGroomerState createState() => _ServiceDetailPetGroomerState();
}

class _ServiceDetailPetGroomerState extends State<ServiceDetailPetGroomer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String serviceType = 'Pet Groomer';
  int yearsOfExperience = 3;
  String services = 'Wash, Hair trimming, Brushing';
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Center(
                child: Text(
                  'Service Details',
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: serviceType,
                enabled: isEditing,
                decoration: InputDecoration(
                  labelText: 'Service Type',
                  labelStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
                  ),
                  border: isEditing ? UnderlineInputBorder() : InputBorder.none,
                ),
                style: TextStyle(
                  color: isEditing ? null : Colors.grey.shade800,
                  fontSize: 18,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Service Type is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  serviceType = value!;
                },
              ),
              TextFormField(
                initialValue: yearsOfExperience.toString(),
                enabled: isEditing,
                decoration: InputDecoration(
                  labelText: 'Years of Experience',
                  labelStyle: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
                  ),
                  border: isEditing ? UnderlineInputBorder() : InputBorder.none,
                ),
                style: TextStyle(
                  color: isEditing ? null : Colors.grey.shade800,
                  fontSize: 18,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Years of Experience is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  yearsOfExperience = int.parse(value!);
                },
              ),
              TextFormField(
                initialValue: services,
                enabled: isEditing,
                decoration: InputDecoration(
                  labelText: 'Grooming Services',
                  labelStyle: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
                  ),
                  border: isEditing ? UnderlineInputBorder() : InputBorder.none,
                ),
                style: TextStyle(
                  color: isEditing ? null : Colors.grey.shade800,
                  fontSize: 18,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Grooming Services are required';
                  }
                  return null;
                },
                onSaved: (value) {
                  services = value!;
                },
              ),
              SizedBox(height: 16.0,),
              ElevatedButton(
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
                    Size(280.0, 45.0)), // Set the minimum button size
              ),
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing;
                  });
                },
                
                child: Text(isEditing ? 'Save' : 'Edit',style: TextStyle(fontSize: 18.0)),
              ),
              SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.white, // Set the background color to red
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.red, // Set the text color to white
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(280.0, 45.0),
                ),
              ),
              onPressed: () {
                // Implement the logic to remove the selected pet here
                _showConfirmationDialog(context);
              },
              child: Text('Remove Service', style: TextStyle(fontSize: 18.0)),
            ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set the background color to white
          elevation: 5.0, // Add shadow
          contentPadding: EdgeInsets.symmetric(
              vertical: 20, horizontal: 30), // Increase padding
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Make the dialog rounded
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Display the centered heading
              Center(
                child: Text(
                  'Are you sure you want to remove this service?',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 8), // Add some space between heading and list
            ],
          ),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      minimumSize: MaterialStateProperty.all(Size(120.0, 40.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Make the button rounded
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Close the dialog without taking any action
                      Navigator.of(context).pop();
                    },
                    child: Text('Back', style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox(width: 10), // Add some space between buttons
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red.shade600),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      minimumSize: MaterialStateProperty.all(Size(120.0, 40.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Make the button rounded
                        ),
                      ),
                    ),
                    onPressed: () {

                    },
                    child: Text('Confirm', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
