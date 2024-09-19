import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pet_care/payment.dart';
import '../service_provider_registration.dart';
import '../main.dart';
// import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
// import 'package:latlong2/latlong.dart';

void main() {
  runApp(ServiceProviderRegistrationAgain());
}

class ServiceCount {
  static int numberOfRegisteredServices = 0;
}

class ServiceProviderRegistrationAgain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Provider Registration',
      theme: myTheme,
      debugShowCheckedModeBanner: false, // Set this to false
      home: ServiceProviderRegistrationPage(),
    );
  }
}

class ServiceProviderRegistrationPage extends StatefulWidget {
  @override
  _ServiceProviderRegistrationPageState createState() =>
      _ServiceProviderRegistrationPageState();
}

class _ServiceProviderRegistrationPageState
    extends State<ServiceProviderRegistrationPage> {
  final _formKey = GlobalKey<FormState>(); // Form key
  String selectedService =
      'Select a Service'; // Initialize with a default message
  List<String> serviceTypes = [
    'Select a Service',
    'Pet Walker',
    'Pet Sitter',
    'Pet Keeper',
    'Pet Traveller',
    'Veterinary',
    'Pet Groomer',
    'Pharmacy',
    'Food Supplier',
  ];
  String unfriendlyOrHostilePets = 'No';
  String selectedVehicleType = 'Car'; // Variable to store the selected value
  List<String> vehicleTypes = ['Car', 'Bike', 'Truck', 'Scooter']; // List of options
  DateTime? licenseExpiryDate; // Variable to store the selected date
  String? selectedMedicalLicense;
  bool isIndividualPetGroomer = true; // Initialize with a default choice
  String homeServiceAvailability = 'No';
  String homeDeliveryAvailPharm = 'No';
  String homeDeliveryAvailFoodSupplier = 'No';
  List<String> selectedServices = [];
  // LatLng? selectedLocation;

ScrollController _scrollController = ScrollController();


  // Declare a TextEditingController for the password and confirm password fields
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
          selectedMedicalLicense = result.files.single.name;
        });
      }
    } catch (e) {
      // Handle any errors or exceptions that may occur during file selection
      print('Error picking a document: $e');
    }
  }

  bool isFormValid = false; // Variable to store the form validity

  Widget _buildServiceSpecificFields() {
    if (selectedService.isEmpty || selectedServices.contains(selectedService)) {
      return SizedBox.shrink();
    } else if (selectedService == 'Pet Walker') {
      return Form(
        key: _formKey, // Assign the form key
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Social Security Number (SSN)
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Social Security Number (XXX-XX-XXXX)*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                // MaskFormatter for SSN format
                MaskTextInputFormatter(
                  mask: '###-##-####',
                  filter: {"#": RegExp(r'[0-9]')},
                ),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Social Security Number';
                }
                // Add additional validation logic for SSN format if needed
                if (!RegExp(r'^\d{3}-\d{2}-\d{4}$').hasMatch(value)) {
                  return 'Invalid SSN format. Please use XXX-XX-XXXX';
                }
                return null;
              },
            ),

            SizedBox(height: 16),

            // First Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'First Name*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Middle Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Middle Name',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Last Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Last Name';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

        //     if (selectedLocation != null)
        //       Text(
        //         'Selected Location: ${selectedLocation!.latitude}, ${selectedLocation!.longitude}',
        //         style: TextStyle(fontSize: 16),
        //       ),
        //     SizedBox(height: 16),
        //     Container(
        //       width: 300,
        //       height: 300,
        //       child: FlutterLocationPicker(
        // initZoom: 11,
        // minZoomLevel: 5,
        // maxZoomLevel: 16,
        // trackMyPosition: true,
        // onPicked: (pickedData) {
        // })
        //     ),
          

          SizedBox(height: 16),

            // Address Line 1
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address Line 1*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Address Line 1';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Address Line 2
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address Line 2',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // City
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter City';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Pincode
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Pincode*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Contact Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contact Number*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
                  return 'Please enter Contact Number';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Alternate Contact Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Alternate Contact Number',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
            ),

            SizedBox(height: 16),

            // Years of Experience
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Years of Experience*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Years of Experience';
                }
                return null; // Return null if the input is valid
              },
            ),
          ],
        ),
      );
    } else if (selectedService == 'Pet Sitter') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add the Form widget for Pet Keeper fields
          Form(
            key: _formKey, // Assign the form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Dropdown and other fields for Pet Keeper
                // Social Security Number (SSN)

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Social Security Number (XXX-XX-XXXX)*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    // MaskFormatter for SSN format
                    MaskTextInputFormatter(
                      mask: '###-##-####',
                      filter: {"#": RegExp(r'[0-9]')},
                    ),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Social Security Number';
                    }
                    // Add additional validation logic for SSN format if needed
                    if (!RegExp(r'^\d{3}-\d{2}-\d{4}$').hasMatch(value)) {
                      return 'Invalid SSN format. Please use XXX-XX-XXXX';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // First Name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your First Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Middle Name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Middle Name',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Last Name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Last Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Address Line 1
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address Line 1*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Address Line 1';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Address Line 2
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address Line 2',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // City
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'City*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter City';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Pincode
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Pincode*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
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
                ),
                SizedBox(height: 16),

                // Contact Number
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact Number*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
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
                      return 'Please enter Contact Number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Alternate Contact Number
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Alternate Contact Number',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
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
                ),

                SizedBox(height: 16),

                // Number of Existing Pets in the Household
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Number of Existing Pets in the Household*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the number of existing pets';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Years of Experience
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Years of Experience*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Years of Experience';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      );
    } else if (selectedService == 'Pet Keeper') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add the Form widget for Pet Keeper fields
          Form(
            key: _formKey, // Assign the form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Dropdown and other fields for Pet Keeper

                //ssn
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Social Security Number (XXX-XX-XXXX)',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    // MaskFormatter for SSN format
                    MaskTextInputFormatter(
                        mask: '###-##-####', filter: {"#": RegExp(r'[0-9]')}),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Social Security Number';
                    }
                    // Add additional validation logic for SSN format if needed
                    if (!RegExp(r'^\d{3}-\d{2}-\d{4}$').hasMatch(value)) {
                      return 'Invalid SSN format. Please use XXX-XX-XXXX';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                //first name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your First Name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                //middle name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Middle Name',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                //last name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Last Name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                //address line 1
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address Line 1*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Address Line 1';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                //address line 2
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address Line 2',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                //city
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'City*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your City';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                //pincode
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Pincode*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
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
                      return 'Please enter your Pincode';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                //number of existing pets in the household
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Number of Existing Pets in the Household*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the number of existing pets';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                //any unfriendly or hostile pets in the household?
                DropdownButtonFormField<String>(
                  value:
                      unfriendlyOrHostilePets, // Declare a variable for storing the selected value
                  items: ['Yes', 'No'].map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      unfriendlyOrHostilePets = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText:
                        'Any Unfriendly or Hostile Pets in the Household?*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                //contact number
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact Number*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
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
                      return 'Please enter your Contact Number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                //alternate contact number
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Alternate Contact Number',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
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
                ),

                SizedBox(height: 16),

                //years of experience
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Years of Experience*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Years of Experience';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                //number of members in the family
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Number of Members in the Family*',
                    labelStyle: TextStyle(
                      color: Colors.black54, // Use your custom color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .secondaryHeaderColor, // Your custom color
                        width: 2.5, // You can adjust the border width if needed
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the number of members in the family';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      );
    } else if (selectedService == 'Pet Traveller') {
      return Form(
        key: _formKey, // Assign the form key
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Social Security Number (SSN)
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Social Security Number (XXX-XX-XXXX)*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                // MaskFormatter for SSN format
                MaskTextInputFormatter(
                  mask: '###-##-####',
                  filter: {"#": RegExp(r'[0-9]')},
                ),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Social Security Number';
                }
                // Add additional validation logic for SSN format if needed
                if (!RegExp(r'^\d{3}-\d{2}-\d{4}$').hasMatch(value)) {
                  return 'Invalid SSN format. Please use XXX-XX-XXXX';
                }
                return null;
              },
            ),

            SizedBox(height: 16),

            // First Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'First Name*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Middle Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Middle Name',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              // You can make this field required if needed by adding a validator similar to the above fields.
            ),

            SizedBox(height: 16),

            // Last Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Last Name';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Address Line 1
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address Line 1*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Address Line 1';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Address Line 2
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address Line 2',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              // You can make this field required if needed by adding a validator similar to the above fields.
            ),

            SizedBox(height: 16),

            // City
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter City';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Pincode
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Pincode*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Contact Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contact Number*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
                  return 'Please enter Contact Number';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Alternate Contact Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Alternate Contact Number',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
              // You can make this field required if needed by adding a validator similar to the above fields.
            ),

            SizedBox(height: 16),

            // Dropdown for Vehicle Type
            DropdownButtonFormField<String>(
              value: selectedVehicleType, // Selected value
              items: vehicleTypes.map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedVehicleType = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Vehicle Type',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a Vehicle Type';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Years of Experience
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Years of Experience*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Years of Experience';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Vehicle Registration Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Vehicle Registration Number*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Vehicle Registration Number';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Max Size or Weight of Pet that can be Transported
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Max Size or Weight of Pet that can be Transported*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the maximum size or weight of pet that can be transported';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Driving License Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Driving License Number*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Driving License Number';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Driving License Expiry Date
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Driving License Expiry Date',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              onTap: () async {
                final DateTime currentDate = DateTime.now();
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate:
                      currentDate, // Set the first date as the current date
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != licenseExpiryDate) {
                  if (picked.isBefore(currentDate)) {
                    // Show an error message if the selected date is before the current date
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Please select a date on or after the current date.'),
                      ),
                    );
                  } else {
                    setState(() {
                      licenseExpiryDate = picked;
                    });
                  }
                }
              },
              readOnly: true,
              controller: TextEditingController(
                text: licenseExpiryDate != null
                    ? "${licenseExpiryDate!.day}/${licenseExpiryDate!.month}/${licenseExpiryDate!.year}"
                    : '',
              ),
              validator: (value) {
                if (licenseExpiryDate == null) {
                  return 'Please select a Driving License Expiry Date';
                }
                return null; // Return null if the input is valid
              },
            ),
          ],
        ),
      );
    } else if (selectedService == 'Veterinary') {
      return Form(
        key: _formKey, // Assign the form key
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Social Security Number (SSN)
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Social Security Number (XXX-XX-XXXX)*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                // MaskFormatter for SSN format
                MaskTextInputFormatter(
                  mask: '###-##-####',
                  filter: {"#": RegExp(r'[0-9]')},
                ),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Social Security Number';
                }
                // Add additional validation logic for SSN format if needed
                if (!RegExp(r'^\d{3}-\d{2}-\d{4}$').hasMatch(value)) {
                  return 'Invalid SSN format. Please use XXX-XX-XXXX';
                }
                return null;
              },
            ),

            SizedBox(height: 16),

            // First Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'First Name*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Middle Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Middle Name',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              // You can make this field required if needed by adding a validator similar to the above fields.
            ),

            SizedBox(height: 16),

            // Last Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Last Name';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Address Line 1
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address Line 1*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Address Line 1';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),

            // Address Line 2
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address Line 2',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              // You can make this field required if needed by adding a validator similar to the above fields.
            ),
            SizedBox(height: 16),

            // City
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter City';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),

            // Pincode
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Pincode*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),

            // Contact Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contact Number*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
                  return 'Please enter Contact Number';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),

            // Alternate Contact Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Alternate Contact Number',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
              // You can make this field required if needed by adding a validator similar to the above fields.
            ),
            SizedBox(height: 16),

            // Years of Experience
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Years of Experience*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Years of Experience';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),

            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Medical License*',
                      labelStyle: TextStyle(
                        color: Colors.black54, // Use your custom color here
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .secondaryHeaderColor, // Your custom color
                          width:
                              2.5, // You can adjust the border width if needed
                        ),
                      ),
                    ),
                    controller: TextEditingController(
                      text: selectedMedicalLicense ?? 'No file selected',
                    ),
                    readOnly: true,
                    onTap: () {
                      _pickDocument(); // Call the _pickDocument function when the field is tapped
                    },
                    validator: (value) {
                      if (selectedMedicalLicense == null ||
                          selectedMedicalLicense!.isEmpty) {
                        return 'Please add your Medical License';
                      }
                      return null; // Return null if the input is valid
                    },
                  ),
                ),
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
                    style: TextStyle(fontSize: 16), // Set the font size
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
          ],
        ),
      );
    } else if (selectedService == 'Pet Groomer') {
      List<Widget> fields = []; // Create a list to store the input fields

      // Add a radio button to choose between individual and company
      fields.add(Row(
        children: [
          Radio(
            value: true,
            groupValue: isIndividualPetGroomer,
            onChanged: (bool? value) {
              setState(() {
                isIndividualPetGroomer = true;
              });
            },
            activeColor: Theme.of(context)
                .primaryColor, // Set the active color to your primary color
          ),
          Text('Individual'),
        ],
      ));

      fields.add(Row(
        children: [
          Radio(
            value: false,
            groupValue: isIndividualPetGroomer,
            onChanged: (bool? value) {
              setState(() {
                isIndividualPetGroomer = false;
              });
            },
            activeColor: Theme.of(context)
                .primaryColor, // Set the active color to your primary color
          ),
          Text('Company'),
        ],
      ));

      if (isIndividualPetGroomer) {
        // Input fields for individual's name
        fields.add(
          TextFormField(
            decoration: InputDecoration(
              labelText: 'First Name*',
              labelStyle: TextStyle(
                color: Colors.black54, // Use your custom color here
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .secondaryHeaderColor, // Your custom color
                  width: 2.5, // You can adjust the border width if needed
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null; // Return null if the input is valid
            },
          ),
        );
        fields.add(SizedBox(height: 16)); // Add a SizedBox between fields

        fields.add(TextFormField(
          decoration: InputDecoration(
            labelText: 'Middle Name',
            labelStyle: TextStyle(
              color: Colors.black54, // Use your custom color here
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    Theme.of(context).secondaryHeaderColor, // Your custom color
                width: 2.5, // You can adjust the border width if needed
              ),
            ),
          ),
          validator: (value) {
            return null; // Return null if the input is valid
          },
        ));

        fields.add(SizedBox(height: 16)); // Add a SizedBox between fields

        fields.add(TextFormField(
          decoration: InputDecoration(
            labelText: 'Last Name*',
            labelStyle: TextStyle(
              color: Colors.black54, // Use your custom color here
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    Theme.of(context).secondaryHeaderColor, // Your custom color
                width: 2.5, // You can adjust the border width if needed
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your last name';
            }
            return null; // Return null if the input is valid
          },
        ));
        fields.add(SizedBox(height: 16)); // Add a SizedBox between fields
      } else {
        // Input field for company name
        fields.add(TextFormField(
          decoration: InputDecoration(
            labelText: 'Company Name*',
            labelStyle: TextStyle(
              color: Colors.black54, // Use your custom color here
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    Theme.of(context).secondaryHeaderColor, // Your custom color
                width: 2.5, // You can adjust the border width if needed
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your company name';
            }
            return null; // Return null if the input is valid
          },
        ));

        fields.add(SizedBox(height: 16)); // Add a SizedBox between fields
      }

      // Registration number
      fields.add(
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Registration Number*',
            labelStyle: TextStyle(
              color: Colors.black54, // Use your custom color here
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    Theme.of(context).secondaryHeaderColor, // Your custom color
                width: 2.5, // You can adjust the border width if needed
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your registration number';
            }
            return null; // Return null if the input is valid
          },
        ),
      );
      fields.add(SizedBox(height: 16)); // Add a SizedBox between fields
      // Service type
      fields.add(
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Service Type*',
            labelStyle: TextStyle(
              color: Colors.black54, // Use your custom color here
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    Theme.of(context).secondaryHeaderColor, // Your custom color
                width: 2.5, // You can adjust the border width if needed
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your service type';
            }
            return null; // Return null if the input is valid
          },
        ),
      );
      fields.add(SizedBox(height: 16)); // Add a SizedBox between fields
      // Working hours
      fields.add(
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Working Hours*',
            labelStyle: TextStyle(
              color: Colors.black54, // Use your custom color here
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    Theme.of(context).secondaryHeaderColor, // Your custom color
                width: 2.5, // You can adjust the border width if needed
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your working hours';
            }
            return null; // Return null if the input is valid
          },
        ),
      );
      fields.add(SizedBox(height: 16)); // Add a SizedBox between fields
      // Service rate
      fields.add(
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Service Rate*',
            labelStyle: TextStyle(
              color: Colors.black54, // Use your custom color here
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    Theme.of(context).secondaryHeaderColor, // Your custom color
                width: 2.5, // You can adjust the border width if needed
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your service rate';
            }
            return null; // Return null if the input is valid
          },
        ),
      );
      fields.add(SizedBox(height: 16)); // Add a SizedBox between fields
      // Dropdown field for home service availability
      fields.add(DropdownButtonFormField<String>(
        value: homeServiceAvailability,
        items: ['Yes', 'No'].map((option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            homeServiceAvailability = value!;
          });
        },
        decoration: InputDecoration(
          labelText: 'Available for Home Service?',
          labelStyle: TextStyle(
            color: Colors.black54, // Use your custom color here
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  Theme.of(context).secondaryHeaderColor, // Your custom color
              width: 2.5, // You can adjust the border width if needed
            ),
          ),
        ),
      ));
      fields.add(SizedBox(height: 16)); // Add a SizedBox between fields

      return Form(
        key: _formKey, // Assign the form key
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: fields,
        ),
      );
    } else if (selectedService == 'Pharmacy') {
      return Form(
        key: _formKey, // Assign the form key
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Social Security Number (SSN)
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Social Security Number (XXX-XX-XXXX)',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                // MaskFormatter for SSN format
                MaskTextInputFormatter(
                  mask: '###-##-####',
                  filter: {"#": RegExp(r'[0-9]')},
                ),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Social Security Number';
                }
                // Add additional validation logic for SSN format if needed
                if (!RegExp(r'^\d{3}-\d{2}-\d{4}$').hasMatch(value)) {
                  return 'Invalid SSN format. Please use XXX-XX-XXXX';
                }
                return null;
              },
            ),

            SizedBox(height: 16),

            // First Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'First Name*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null; // Return null if the input is valid
              },
            ),

            SizedBox(height: 16),

            // Middle Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Middle Name',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Last Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Last Name';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Address Line 1
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address Line 1*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Address Line 1';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Address Line 2
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address Line 2',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // City
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter City';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Pincode
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Pincode*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Contact Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contact Number*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
                  return 'Please enter Contact Number';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Alternate Contact Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Alternate Contact Number',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
            ),
            SizedBox(height: 16),

            // Home Delivery
            DropdownButtonFormField<String>(
              value: homeDeliveryAvailPharm,
              items: ['Yes', 'No'].map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  homeDeliveryAvailPharm = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Available for Home Delivery?',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (selectedService == 'Food Supplier') {
      return Form(
        key: _formKey, // Assign the form key
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Social Security Number (SSN)
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Social Security Number (XXX-XX-XXXX)',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                // MaskFormatter for SSN format
                MaskTextInputFormatter(
                  mask: '###-##-####',
                  filter: {"#": RegExp(r'[0-9]')},
                ),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Social Security Number';
                }
                // Add additional validation logic for SSN format if needed
                if (!RegExp(r'^\d{3}-\d{2}-\d{4}$').hasMatch(value)) {
                  return 'Invalid SSN format. Please use XXX-XX-XXXX';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            // First Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'First Name*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Middle Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Middle Name',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Last Name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Last Name';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Address Line 1
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address Line 1*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Address Line 1';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Address Line 2
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address Line 2',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // City
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter City';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Pincode
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Pincode*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Contact Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contact Number*',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
                  return 'Please enter Contact Number';
                }
                return null; // Return null if the input is valid
              },
            ),
            SizedBox(height: 16),
            // Alternate Contact Number
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Alternate Contact Number',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
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
            ),
            SizedBox(height: 16),

            // Home Delivery
            DropdownButtonFormField<String>(
              value: homeDeliveryAvailFoodSupplier,
              items: ['Yes', 'No'].map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  homeDeliveryAvailFoodSupplier = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Available for Home Delivery?',
                labelStyle: TextStyle(
                  color: Colors.black54, // Use your custom color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .secondaryHeaderColor, // Your custom color
                    width: 2.5, // You can adjust the border width if needed
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _buildServiceDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedService,
      items: serviceTypes
          .where((serviceType) => !selectedServices.contains(serviceType))
          .map((serviceType) {
        return DropdownMenuItem<String>(
          value: serviceType,
          child: Text(serviceType),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedService = value!;
        });
      },
      decoration: InputDecoration(
        labelText: 'Select Service Type',
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
    );
  }

  void _showRegisteredServicesDialog(BuildContext context) {
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
                  'Registered Services:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10), // Add some space between heading and list

              // Display the list of registered services here
              for (int i = 0; i < selectedServices.length; i++)
                Text(' ${selectedServices[i]}', //bold text
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
                          builder: (context) => PaymentPageService(),
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

  void _addAnotherService() {
    if (selectedService.isNotEmpty &&
        !selectedServices.contains(selectedService)) {
      selectedServices.add(selectedService);
    }

    // Check if all compulsory fields are filled
    bool areAllFieldsFilled = _formKey.currentState!.validate();

    if (selectedServices.length < serviceTypes.length && areAllFieldsFilled) {
      ServiceCount.numberOfRegisteredServices++;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Service added successfully.'),
          duration: Duration(seconds: 2),
        ),
      );
      // Reset selectedService and show another registration page
      setState(() {
        selectedService = 'Select a Service';
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all the required fields.'),
          duration: Duration(seconds: 2),
        ),
      );
      _scrollController.animateTo(
                      0.0,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
      // All services are registered or not all fields are filled
      // You can handle this case, e.g., show a message or disable further registration
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ServiceCount.numberOfRegisteredServices = 0;
                    // Use Navigator to navigate back to loginPage.dart and RegistrationPage
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => ServiceRegistrationPage()),
                      (route) => false, // Remove all routes from the stack
                    );
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
      backgroundColor:
          Colors.white, // Set the scaffold background color to white
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // DropdownButtonFormField<String>(
            //   value: selectedService, // Set the initial value here
            //   items: serviceTypes.map((serviceType) {
            //     return DropdownMenuItem<String>(
            //       value: serviceType,
            //       child: Text(serviceType),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       selectedService = value!;
            //     });
            //   },
            //   decoration: InputDecoration(
            //     labelText: 'Select Service Type',
            //   ),
            // ),
            _buildServiceDropdown(),
            SizedBox(height: 10),
            _buildServiceSpecificFields(),
            SizedBox(height: 16),

            if (selectedServices.length < serviceTypes.length)
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
                        Size(200.0, 50.0)), // Set the minimum button size
                  ),
                  onPressed: 
                    _addAnotherService,
                  
                  child: Text(
                    'Add Another Service',
                    style: TextStyle(fontSize: 16), // Set the font size
                  ),
                  // Disable the button if the form is not valid
                ),
              ),
            SizedBox(height: 10),
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
                      borderRadius:
                          BorderRadius.circular(30.0), // Set the border radius
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      Size(150.0, 45.0)), // Set the minimum button size
                ),
                onPressed: () {
                  // Validate the form
                  if (_formKey.currentState!.validate()) {
                    _addAnotherService();
                    _showRegisteredServicesDialog(context); // Show the dialog

                    // If the form is valid, handle registration logic here based on selectedService
                    // You can access the field values and perform registration-related actions
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all the required fields.'),
          duration: Duration(seconds: 2),
        ),
      );
       _scrollController.animateTo(
                      0.0,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 16), // Set the font size
                ),
              ),
            ),

            SizedBox(height: 10),
            // // Display the list of registered services
            // if (selectedServices.isNotEmpty)
            //   Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         'Registered Services:',
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //           color: Theme.of(context).primaryColor,
            //         ),
            //       ),
            //       SizedBox(height: 10),
            //       for (int i = 0; i < selectedServices.length; i++)
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             Text('Service ${i + 1}: ${selectedServices[i]}',style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor,),
            //             ),
            //             // Text('${selectedServices[i]}',style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor,),

            //             // Add more pet details here...
            //             SizedBox(height: 10),
            //           ],
            //         ),
            //     ],
            //   ),
          ],
        ),
      ),
    );
  }
}
