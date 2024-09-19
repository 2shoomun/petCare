import 'package:flutter/material.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/foodSupplier.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petKeeper.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petSitter.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pharmacy.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/veterinary.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pet_owner_homepage.dart';
import 'petWalker.dart';
import 'petTraveller.dart';
import 'petGroomer.dart';

void main() => runApp(MyApp(serviceName: "DefaultServiceName"));

class MyApp extends StatelessWidget {
   final String serviceName;

  MyApp({required this.serviceName});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PetSelectionPage(serviceName),
    );
  }
}

class PetSelectionPage extends StatefulWidget {
  final String serviceName; // Add this field

  PetSelectionPage(this.serviceName); // Add a constructor to initialize it
  @override
  _PetSelectionPageState createState() => _PetSelectionPageState();
}

class _PetSelectionPageState extends State<PetSelectionPage> {

  Set<String> selectedPets = Set<String>();
  Set<String> getSelectedPets() {
    return selectedPets;
  }


  final List<Map<String, String>> pets = [
    {
      'name': 'Muffin',
      'image':
          'https://www.metlifepetinsurance.com/content/dam/metlifecom/us/metlifepetinsurance/images/blog/Dog-Breeds/maltese-inline-image.webp', // Replace with actual image URL
    },
    {
      'name': 'Buddy',
      'image':
          'https://lafeber.com/pet-birds/wp-content/uploads/2018/06/Eclectus.jpg', // Replace with actual image URL
    },
    {
      'name': 'Max',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/cute-cat-photos-1593441022.jpg?crop=0.670xw:1.00xh;0.167xw,0&resize=640:*', // Replace with actual image URL
    },
    {
      'name': 'Luna',
      'image':
          'https://images.unsplash.com/photo-1615751072497-5f5169febe17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80', // Replace with actual image URL
    },
    {
      'name': 'Oreo',
      'image':
          'https://www.thesprucepets.com/thmb/H1IDKaQSKU-omll7GJzTsM53ueQ=/2119x0/filters:no_upscale():strip_icc()/GettyImages-1163899532-2-abe05a90e74e418cafa2823d7bb9dd92.jpg', // Replace with actual image URL
    },
    {
      'name': 'Bailey',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/beautiful-smooth-haired-red-cat-lies-on-the-sofa-royalty-free-image-1678488026.jpg?crop=0.88847xw:1xh;center,top&resize=1200:*', // Replace with actual image URL
    },
    // Add more pets with names and image URLs here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 16.0, left: 24.0, right: 16.0, bottom: 16.0),
            child: Text(
              'Choose Pets',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 16.0,
              ),
              padding: EdgeInsets.all(
                  8.0), // Increase the margin around the entire grid
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                final isSelected = selectedPets.contains(pet['name']);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedPets.remove(pet['name']);
                      } else {
                        selectedPets.add(pet['name']!);
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset:
                                isSelected ? Offset(-1, -1) : Offset(1.5, 1.5),
                            blurRadius: 1.0,
                            spreadRadius: 0.5,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 0),
                            blurRadius: 1.0,
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30.0, // Adjust the size of the CircleAvatar
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(pet['image']!),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            pet['name']!,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: selectedPets.isNotEmpty
    ? FloatingActionButton(
        onPressed: () {
          if (widget.serviceName == "Pet Walker") {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PetWalkerPage()));
          } else if (widget.serviceName == "Pet Traveller") {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PetTravellerPage()));
          } else if (widget.serviceName == "Pet Groomer") {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PetGroomerPage()));
          }else if (widget.serviceName == "Pharmacy") {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PharmacyPage()));
          }else if (widget.serviceName == "Pet Sitter") {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PetSitterPage()));
          }else if (widget.serviceName == "Pet Keeper") {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PetKeeperPage()));
          }else if (widget.serviceName == "Veterinary") {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => VeterinaryPage()));
          }else if (widget.serviceName == "Food Supplier") {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => FoodSupplierPage()));
          } 
          else {
            // Handle the default case here, for example, navigate to a default page.
          }
        },
        child: Icon(Icons.arrow_forward),
        backgroundColor: Theme.of(context).primaryColor,
      )
    : null,
    );
  }
}
