import 'package:flutter/material.dart';
import 'package:pet_care/main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'serviceProviderProfilePage.dart';

class ProfileAppPet extends StatelessWidget {
  final SPUserProfile
      selectedUserProfile; // Add this line to receive the selected user's details

  final List<SPUserProfile> userProfiles; // Pass the list of user profiles

  ProfileAppPet(this.selectedUserProfile, this.userProfiles);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: ProfilePageService(selectedUserProfile, userProfiles),
    );
  }
}

class ProfilePageService extends StatefulWidget {
  final SPUserProfile user; // Pass the selected user's details
  final List<SPUserProfile> userProfiles; // Pass the list of user profiles

  ProfilePageService(this.user,
      this.userProfiles); // Constructor to receive user details and userProfiles

  @override
  _ProfilePageServiceState createState() => _ProfilePageServiceState();
}

class _ProfilePageServiceState extends State<ProfilePageService> {
  bool _isEditing = false;
  TextEditingController petNameController = TextEditingController();
  TextEditingController petTypeController = TextEditingController();
  TextEditingController petWeightController = TextEditingController();
  TextEditingController petHeightController = TextEditingController();
  String petGrade = 'Friendly'; // Default value for pet grade

  void _removePet(SPUserProfile user) {
    // Implement the logic to remove the selected pet from the petOwnerProfilePage

    // Find the index of the selected user in the list
    int index = widget.userProfiles.indexOf(user);

    if (index != -1) {
      // If the user is found, remove them from the list
      setState(() {
        widget.userProfiles.removeAt(index);
      });

      Navigator.of(context, rootNavigator: true).pop();

      // Navigate back to the pet owner's profile page after removing the pet
      Navigator.of(context).pop(widget.userProfiles);
    }
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
                      _removePet(widget.user);
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

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the received user details
    petNameController.text = widget.user.name;
    petTypeController.text = widget.user.type;
    petWeightController.text = widget.user.weight;
    petHeightController.text = widget.user.height;
    petGrade = widget.user.grade;
    // Set other controller values as needed
  }

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Center(
            //   child: CircleAvatar(
            //     radius: 60,
            //     backgroundImage: NetworkImage(widget.user.profileImageUrl),
            //   ),
            // ),
            SizedBox(height: 16.0),
            _buildTextField("Pet Name", petNameController),
            _buildTextField("Pet Type", petTypeController),
            _buildTextField("Pet Weight", petWeightController),
            _buildTextField("Pet Height", petHeightController),
            _buildGradeDropdown(),
            SizedBox(height: 16),
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
                    Size(140.0, 45.0)), // Set the minimum button size
              ),
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                });
              },
              child: Text(_isEditing ? 'Cancel' : 'Edit',
                  style: TextStyle(fontSize: 18.0)),
            ),
            if (_isEditing) ...{
              SizedBox(height: 8),
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
                      Size(140.0, 45.0)), // Set the minimum button size
                ),
                onPressed: () {
                  // Save the edited data here
                  _savePetData();
                },
                child: Text('Save', style: TextStyle(fontSize: 18.0)),
              ),
            },
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
                  Size(140.0, 45.0),
                ),
              ),
              onPressed: () {
                // Implement the logic to remove the selected pet here
                _showConfirmationDialog(context);
              },
              child: Text('Remove Pet', style: TextStyle(fontSize: 18.0)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      enabled: _isEditing,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey.shade700,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
        ),
        border: _isEditing ? UnderlineInputBorder() : InputBorder.none,
      ),
      style: TextStyle(
        color: _isEditing ? null : Colors.grey.shade800,
      ),
    );
  }

  Widget _buildGradeDropdown() {
    TextStyle uneditedTextStyle = TextStyle(
      color: Colors.grey.shade800,
    );

    return DropdownButton<String>(
      value: petGrade,
      onChanged: _isEditing
          ? (String? newValue) {
              setState(() {
                petGrade = newValue ?? 'Friendly';
              });
            }
          : null,
      items: <DropdownMenuItem<String>>[
        DropdownMenuItem<String>(
          value: 'Friendly',
          child: Text(
            'Friendly',
            style: _isEditing ? null : uneditedTextStyle,
          ),
        ),
        DropdownMenuItem<String>(
          value: 'Neutral',
          child: Text(
            'Neutral',
            style: _isEditing ? null : uneditedTextStyle,
          ),
        ),
        DropdownMenuItem<String>(
          value: 'Unfriendly',
          child: Text(
            'Unfriendly',
            style: _isEditing ? null : uneditedTextStyle,
          ),
        ),
        DropdownMenuItem<String>(
          value: 'Hostile',
          child: Text(
            'Hostile',
            style: _isEditing ? null : uneditedTextStyle,
          ),
        ),
      ],
    );
  }

  void _savePetData() {
    // Save the edited data here
    // You can use the text from the controllers and the selected petGrade to save the data to your database or storage.
    setState(() {
      _isEditing = false;
    });
  }
}
