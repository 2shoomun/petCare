import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'paymentAddAnotherPet.dart';
import 'package:pet_care/main.dart';
import 'package:image_picker/image_picker.dart'; // Add this import for image selection

void main() {
  runApp(MaterialApp(
    title: 'Pet Details',
    theme: myTheme,
    home: AddAnotherPetPage(),
  ));
}

class PetCount {
  static int numberOfRegisteredPets = 0;
}

class AddAnotherPetPage extends StatefulWidget {
  const AddAnotherPetPage({super.key});

  @override
  _AddAnotherPetPageState createState() => _AddAnotherPetPageState();
}

class _AddAnotherPetPageState extends State<AddAnotherPetPage> {
  final _formKey = GlobalKey<FormState>(); // Key for the form
  bool _validateOnSubmit = false; // Define _validateOnSubmit here
  // Define variables for pet registration details
  String petName = ''; // Variable to store the name of the pet
  String petRegistrationId = '';
  String petType = '';
  String petSize = '';
  String petWeight = '';
  String? petGrade;
  String vetName = '';
  String vetContactNumber = '';
  String vetAddress = '';
  File? proofOfOwnershipFile; // Store the selected document file
  DateTime? ownershipDateValue;
  File? petImageFile; // Variable to store the selected pet image

  final List<String> petGradeOptions = [
    'Friendly',
    'Neutral',
    'Unfriendly',
    'Hostile'
  ];

  ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> registeredPets = []; // List to store pet details

  int calculateOwnershipPeriod() {
    if (ownershipDateValue == null) {
      return 0;
    }
    final now = DateTime.now();
    final difference = now.difference(ownershipDateValue!);
    return difference.inDays;
  }

  Future<void> _pickDocument() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, // Specify the file type(s) you want to allow
        allowedExtensions: [
          'pdf',
          'doc',
          'docx'
        ], // Example: Allow PDF, DOC, and DOCX files
      );

      if (result != null) {
        setState(() {
          proofOfOwnershipFile = File(result.files.single.path!);
        });
      }
    } catch (e) {
      // Handle any errors or exceptions that may occur during file selection
      print('Error picking a document: $e');
    }
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(
      source: ImageSource
          .gallery, // You can change this to ImageSource.camera for camera access
    );

    if (pickedFile != null) {
      setState(() {
        petImageFile = File(pickedFile.path);
      });
    }
  }

  void _showRegisteredPetsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set the background color to white
          elevation: 5.0, // Add shadow
          contentPadding: EdgeInsets.symmetric(
              vertical: 30, horizontal: 40), // Increase padding
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
                  'Registered Pets:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10), // Add some space between heading and list

              // // Display the list of registered pets here
              for (int i = 0; i < registeredPets.length; i++)
                Text('${registeredPets[i]['petType']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              SizedBox(height: 7),
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
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
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
                      // Handle confirm button logic here
                      // Close the dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPagePet(),
                        ),
                      );
                      // Navigate to the next page here if needed
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

  // Function to add a new pet to the list
  void addNewPet() {
    setState(() {
      _validateOnSubmit = false; // Enable validation when the button is clicked
    });

    // Only add a new pet if the form is valid
    registeredPets.add({
      'petRegistrationId': petRegistrationId,
      'petType': petType,
      'petSize': petSize,
      'petWeight': petWeight,
      'petGrade': petGrade,
      'vetName': vetName,
      'vetContactNumber': vetContactNumber,
      'vetAddress': vetAddress,
      'proofOfOwnershipFile': proofOfOwnershipFile,
      'ownershipDateValue': ownershipDateValue,
    });
    // Update the number of registered pets
    PetCount.numberOfRegisteredPets = registeredPets.length;

    // Clear input fields for the current pet and reset validators
    _formKey.currentState!.reset();

    // Show a notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pet added successfully.'),
        duration: Duration(seconds: 2),
      ),
    );

    // Clear input fields for the current pet and reset validators
    setState(() {
      petRegistrationId = '';
      petType = '';
      petSize = '';
      petWeight = '';
      petGrade = null;
      vetName = '';
      vetContactNumber = '';
      vetAddress = '';
      proofOfOwnershipFile = null;
      ownershipDateValue = null;
    });
  }

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
                    PetCount.numberOfRegisteredPets = 0;
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Center(
                child: Text(
                  'Pet Details',
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
      backgroundColor: Colors.white, // Set the scaffold color to white
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Set the key for the form
          autovalidateMode: _validateOnSubmit
              ? AutovalidateMode
                  .always // Show validation errors if the flag is true
              : AutovalidateMode.disabled, // Disable validation by default
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name of Pet*',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name of the pet';
                  }
                  return null;
                },
                onChanged: (value) {
                  petName = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Pet Registration ID from MOAH*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, // Border color
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Pet Registration ID';
                  }
                  return null;
                },
                onChanged: (value) {
                  petRegistrationId = value;
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Type of Pet*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  hintText: 'E.g., Cat, Dog, Bird', // Add examples here
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, // Border color
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Type of Pet';
                  }
                  return null;
                },
                onChanged: (value) {
                  petType = value;
                },
              ),

              SizedBox(height: 16),

              // Add a button to select the pet's image
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Photo of Pet*',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      controller: TextEditingController(
                        text: petImageFile != null
                            ? 'Selected Image: ${petImageFile!.path.split('/').last}'
                            : 'No image selected',
                      ),
                      readOnly: true,
                      onTap: () {
                        _pickImage(); // Call the _pickImage function when the field is tapped
                      },
                      validator: (value) {
                        if (petImageFile == null) {
                          return 'Please select an image';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(150.0, 45.0)),
                    ),
                    onPressed:
                        _pickImage, // Call the _pickImage function when the button is pressed
                    child: Text(
                      'Select Image',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Size of Pet (in inches)',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, // Border color
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter Size of Pet';
                //   }
                //   return null;
                // },
                onChanged: (value) {
                  petSize = value;
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Weight of Pet (in grams)',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, // Border color
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter Weight of Pet';
                //   }
                //   return null;
                // },
                onChanged: (value) {
                  petWeight = value;
                },
              ),

              SizedBox(height: 16),

              //proof of ownership
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Proof of Ownership*',
                        labelStyle: TextStyle(
                          color: Colors.black54, // Use your custom color here
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Theme.of(context).primaryColor, // Border color
                          ),
                        ),
                      ),
                      controller: TextEditingController(
                        text: proofOfOwnershipFile != null
                            ? 'Selected Document: ${proofOfOwnershipFile!.path.split('/').last}'
                            : 'No file selected',
                      ),
                      readOnly: true,
                      onTap: () {
                        _pickDocument(); // Call the _pickDocument function when the field is tapped
                      },
                      validator: (value) {
                        if (proofOfOwnershipFile == null) {
                          return 'Please add your Proof of Ownership Document';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors
                            .white, // Set the background color to secondary header color
                      ),

                      foregroundColor: MaterialStateProperty.all(
                        Theme.of(context)
                            .primaryColor, // Set the text color to white
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
                    onPressed:
                        _pickDocument, // Call the _pickDocument function when the button is pressed

                    child: Text(
                      'Select Document',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              //ownership date
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ownership Date',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, // Border color
                    ),
                  ),
                ),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(), // Prevent future dates
                  );
                  if (picked != null && picked != ownershipDateValue) {
                    setState(() {
                      ownershipDateValue = picked;
                    });
                  }
                },
                readOnly: true,
                controller: TextEditingController(
                  text: ownershipDateValue != null
                      ? "${ownershipDateValue!.day}/${ownershipDateValue!.month}/${ownershipDateValue!.year}"
                      : '',
                ),
                // validator: (value) {
                //   if (ownershipDateValue == null) {
                //     return 'Please select an ownership date';
                //   }
                //   return null;
                // },
              ),

              SizedBox(height: 16),

              Text(
                'Ownership Period: ${calculateOwnershipPeriod()} days',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 16),

              // Dropdown for pet grade
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Grade of Pet*',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, // Border color
                    ),
                  ),
                ),
                value: petGrade,
                items: petGradeOptions.map((String grade) {
                  return DropdownMenuItem<String>(
                    value: grade,
                    child: Text(grade),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    petGrade = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select Grade of Pet';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Associated Vet Name (if any)',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, // Border color
                    ),
                  ),
                ),
                onChanged: (value) {
                  vetName = value;
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Associated Vet Contact Number',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, // Border color
                    ),
                  ),
                ),
                onChanged: (value) {
                  vetContactNumber = value;
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Associated Vet Address',
                  labelStyle: TextStyle(
                    color: Colors.black54, // Use your custom color here
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, // Border color
                    ),
                  ),
                ),
                onChanged: (value) {
                  vetAddress = value;
                },
              ),

              // // Display the number of registered pets
              // Text(
              //   'Number of Registered Pets: ${PetCount.numberOfRegisteredPets}',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),

              SizedBox(height: 16),

              Center(
                child: ElevatedButton(
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
                        borderRadius: BorderRadius.circular(
                            30.0), // Set the border radius
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                        Size(150.0, 45.0)), // Set the minimum button size
                  ),
                  onPressed: () {
                    _scrollController.animateTo(
                      0.0,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      _validateOnSubmit =
                          true; // Enable validation on button click
                    });
                    if (_formKey.currentState!.validate()) {
                      // Only add a new pet if the form is valid
                      addNewPet(); // Add the current pet to the list
                      // Scroll to the top of the page
                    } else {
                      // Show a notification
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill all the required fields'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Add another Pet',
                  ),
                ),
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
                    setState(() {
                      _validateOnSubmit =
                          true; // Enable validation on button click
                    });
                    if (_formKey.currentState!.validate() ||
                        PetCount.numberOfRegisteredPets > 0) {
                      // Only register if the form is valid
                      addNewPet(); // Add the current pet to the list
                      _showRegisteredPetsDialog(context);
                      // Handle the pet registration logic here
                      // You can save the pet details or perform other actions
                    } else {
                      _scrollController.animateTo(
                        0.0,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );

                      // Show a notification
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill all the required fields'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Display the list of registered pets
              // if (registeredPets.isNotEmpty)
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         'Registered Pets:',
              //         style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       SizedBox(height: 10),
              //       for (int i = 0; i < registeredPets.length; i++)
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text('Pet ${i + 1}:'),
              //             Text(
              //                 'Pet Registration ID: ${registeredPets[i]['petRegistrationId']}'),
              //             Text('Type of Pet: ${registeredPets[i]['petType']}'),
              //             // Add more pet details here...
              //             SizedBox(height: 10),
              //           ],
              //         ),
              //     ],
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
