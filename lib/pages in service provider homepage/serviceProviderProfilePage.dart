import 'package:flutter/material.dart';
import 'package:pet_care/loginPagePetOwner.dart';
import 'package:pet_care/loginPageServiceProvider.dart';
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/addAnotherPet.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petOwnerProfilePage.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petProfilePage.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pet_owner_homepage.dart';
import 'package:pet_care/pages%20in%20service%20provider%20homepage/addAnotherService.dart';
import 'package:pet_care/pages%20in%20service%20provider%20homepage/petGroomerDetails.dart';
import 'package:pet_care/pages%20in%20service%20provider%20homepage/petSitterDetails.dart';
import 'package:pet_care/pages%20in%20service%20provider%20homepage/petWalkerDetails.dart';
import 'package:pet_care/pages%20in%20service%20provider%20homepage/serviceProfilePage.dart';
import 'package:pet_care/pet_registration.dart';
import 'package:image_picker/image_picker.dart'; // Import the image_picker package
import 'dart:io';

void main() {
  runApp(ProfileApp());
}

class SPUserProfile {
  bool isButtonPressed; // Add this property
  final String name;
  final String type;
  final String profileImageUrl;
  final String weight;
  final String height;
  final String grade;
  SPUserProfile(this.name, this.type, this.profileImageUrl, this.weight,
      this.height, this.grade, this.isButtonPressed);
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image; // Variable to store the selected profile picture
  final ImagePicker _imagePicker = ImagePicker(); // ImagePicker instance

  bool _isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController alternatePhoneNumberController =
      TextEditingController();
  TextEditingController numberOfPetsController = TextEditingController();
  bool isButtonPressed = false;

  List<SPUserProfile> SPUserProfiles = [
    SPUserProfile("Pet Sitter", "5", "assets/pet sitter_icon.png", '3',
        '', '', false),
    SPUserProfile("Pet Groomer", "3", "assets/pet groomer_icon.png",
        'Wash\nHair trimming\nBrushing\nNail Clipping\nDe-shedding treatments', '', '', false),
    SPUserProfile(
        "Pet Walker",
        "1",
        "assets/serviceprofileimages/pet_walker_icon_for_service_profile.jpg",
        '',
        '',
        '',
        false),
  ];

  List<Widget> destinationPages = [
    ServiceDetailPetSitter(),
    ServiceDetailPetGroomer(),
    ServiceDetailPetWalker(),
  ];

  SPUserProfile? selectedSPUserProfile;
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
                  'Are you sure you want to log out?',
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
                      backgroundColor: MaterialStateProperty.all(Colors.black),
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
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginPageProvider(),
                        ),
                      );
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
    // Initialize the controllers with default values here
    nameController.text = "John Doe";
    phoneNumberController.text = "123-456-7890";
    typeController.text = "john.doe@example.com";
    addressLine1Controller.text = "123 Main St";
    addressLine2Controller.text = "Apt 45";
    cityController.text = "Cityville";
    pincodeController.text = "12345";
    alternatePhoneNumberController.text = "987-654-3210";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(60.0), // Set the AppBar height to 0 to hide it
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor, // Set the icon color
            ),
            title: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: -10, // Adjust the left position as needed
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      // Use Navigator to navigate back to PetSelectionPage
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Center(
                  child: Text(
                    '',
                  ),
                ),
              ],
            ),
          )),
      backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60.0),
      //   child: AppBar(
      //     elevation: 0,
      //     backgroundColor: Colors.white,
      //     automaticallyImplyLeading: false,
      //     iconTheme: IconThemeData(
      //       color: Theme.of(context).primaryColor,
      //     ),
      //     title: Stack(
      //       alignment: Alignment.center,
      //       children: [
      //         Center(
      //           child: Text(
      //             'Profile Details',
      //             style: TextStyle(
      //               color: Theme.of(context).primaryColor,
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                left: 24.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Text(
                'Profile Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 48.0),
              child: Column(
                children: [
                  SizedBox(height: 16.0),
                  Center(
                    child: _buildProfilePicture(),
                  ),
                  SizedBox(height: 16.0),
                  _buildTextField("Name", nameController),
                  _buildTextField("Phone Number", phoneNumberController),
                  _buildTextField("E-Mail", typeController),
                  _buildTextField("Address Line 1", addressLine1Controller),
                  _buildTextField("Address Line 2", addressLine2Controller),
                  _buildTextField("City", cityController),
                  _buildTextField("Pincode", pincodeController),
                  _buildTextField(
                      "Alternate Phone Number", alternatePhoneNumberController),
                  SizedBox(height: 16.0),
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
                      minimumSize: MaterialStateProperty.all(Size(140.0, 45.0)),
                    ),
                    onPressed: () {
                      setState(() {
                        _isEditing = !_isEditing;
                      });
                    },
                    child: Text(
                      _isEditing ? 'Cancel' : 'Edit Profile',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  if (_isEditing) ...{
                    SizedBox(height: 8),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor,
                        ),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        minimumSize:
                            MaterialStateProperty.all(Size(140.0, 45.0)),
                      ),
                      onPressed: () {
                        // Save the edited data here
                        _saveProfileData();
                      },
                      child: Text('Save', style: TextStyle(fontSize: 16.0)),
                    ),
                  },
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Services',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _buildHorizontalProfileList(),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(200.0, 45.0)),
                    ),
                    onPressed: () {
                      // Use Navigator to navigate back to loginPage.dart and RegistrationPage
                      _showConfirmationDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons
                              .logout, // You can replace 'Icons.logout' with the appropriate logout icon.
                          size: 24, // Adjust the size as needed.
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                            width:
                                8), // Add some spacing between the icon and text.
                        Text(
                          'Log out',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return GestureDetector(
      onTap: _isEditing ? _pickImage : null,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70.0,
            backgroundColor: Theme.of(context).primaryColor,
            backgroundImage: () {
              if (_image != null && _image is File) {
                // Use FileImage for the selected image
                return FileImage(_image!) as ImageProvider<Object>;
              } else {
                // Provide a default image URL with NetworkImage
                return NetworkImage(
                        'https://media.istockphoto.com/id/1147066751/photo/hispanic-adult-standing-outside-and-smiling.jpg?s=612x612&w=0&k=20&c=5BWiJRFV-eqg7gDFlu8khQ7Eol_dvsip0Ds2p_zDwAo=')
                    as ImageProvider<Object>;
              }
            }(),
          ),
          if (_isEditing)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: _pickImage,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Function to open the image picker
  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      enabled: _isEditing,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 22.0,
            fontWeight: FontWeight.bold),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
        ),
        border: _isEditing ? UnderlineInputBorder() : InputBorder.none,
      ),
      style: TextStyle(
        color: _isEditing ? null : Colors.grey.shade800,
        fontSize: 18,
      ),
    );
  }

  Widget _buildHorizontalProfileList() {
    return Container(
      height: 230.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            SPUserProfiles.length + 1, // Add 1 for the "Add New Pet" container
        itemBuilder: (context, index) {
          if (index == SPUserProfiles.length) {
            // This is the "Add New Pet" container
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: _buildAddNewPetContainer(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: _buildProfileContainer(index),
            );
          }
        },
      ),
    );
  }

  Widget _buildAddNewPetContainer() {
    return GestureDetector(
      onTap: () {
        // Navigate to a different page when the "Add New Pet" container is tapped
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => AddAnotherServicePage(),
        ));
      },
      child: Container(
        width: 130.0,
        height: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.6),
              Theme.of(context).secondaryHeaderColor.withOpacity(0.3),
            ],
          ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black.withOpacity(0.1),
              child: Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Add a Service",
              style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileContainer(int index) {
    SPUserProfile user = SPUserProfiles[index];
    return Container(
      width: 130.0,
      height: 330.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.6),
            Theme.of(context).secondaryHeaderColor.withOpacity(0.3),
          ],
        ),
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: ClipOval(
              // Clip the image with a circular shape
              child: Container(
                width: 100, // Adjust the width to control the zoom level
                height: 100, // Adjust the height to control the zoom level
                child: Image(
                  image: AssetImage(user.profileImageUrl),
                  fit:
                      BoxFit.scaleDown, // Ensure the image covers the container
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            user.name,
            style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                SPUserProfiles[index].isButtonPressed =
                    !SPUserProfiles[index].isButtonPressed;
                Future.delayed(Duration(milliseconds: 150), () {
                  if (SPUserProfiles[index].isButtonPressed) {
                    selectedSPUserProfile = SPUserProfiles[index];
                    Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => destinationPages[index],
              ));
                       
                    
                    setState(() {
                      SPUserProfiles[index].isButtonPressed =
                          !SPUserProfiles[index].isButtonPressed;
                    });
                  }
                });
              });
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                SPUserProfiles[index].isButtonPressed
                    ? Colors.transparent
                    : Colors.white.withOpacity(0.2),
              ),
              foregroundColor: MaterialStateProperty.all(
                SPUserProfiles[index].isButtonPressed
                    ? Colors.white
                    : Colors.grey.shade800,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                    color: SPUserProfiles[index].isButtonPressed
                        ? Colors.transparent
                        : Colors.white,
                    width: 1.5,
                  ),
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(60.0, 30.0)),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.transparent;
                  return null;
                },
              ),
            ),
            child: Text(
              "Details",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveProfileData() {
    // Save the edited data here
    // You can use the text from the controllers to save the data to your database or storage.
    setState(() {
      _isEditing = false;
    });
  }
}
