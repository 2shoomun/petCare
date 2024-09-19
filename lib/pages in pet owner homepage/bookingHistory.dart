import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/RequestSent.dart';

void main() => runApp(BookingHistoryPage());

class ServiceProvider {
  final String name;
  final String service;
  final String imageUrl;
  final DateTime dateTime;
  int rating; // Add a rating property
  List<Pet> petsServiced; // Add a list of pets serviced

  ServiceProvider({
    required this.name,
    required this.service,
    required this.imageUrl,
    required this.dateTime,
    this.rating = 0, // Set the default rating to 0
    this.petsServiced = const [], // Initialize as an empty list
  });
}

class Pet {
  final String name;
  final String type;

  Pet({required this.name, required this.type});
}

class BookingHistoryPage extends StatefulWidget {
  @override
  _BookingHistoryPageState createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  final List<ServiceProvider> bookedProviders = [
   ServiceProvider(
  name: "Emma White",
  service: "Pet Sitter",
  imageUrl:
      "https://images.unsplash.com/photo-1553322378-eb94e5966b0c?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZG9nJTIwYW5kJTIwd29tYW58ZW58MHx8MHx8fDA%3D",
  dateTime: DateTime(2023, 11, 15, 14, 30),
  petsServiced: [
    Pet(name: "Muffin", type: "Dog"),
    Pet(name: "Buddy", type: "Bird"),
  ],
),
ServiceProvider(
  name: "Liam Brown",
  service: "Pet Walker",
  imageUrl:
      "https://t3.ftcdn.net/jpg/05/09/79/48/360_F_509794813_GZ54rTzjEO09xQc0Z3Mx5dYZHNSEl4xp.jpg",
  dateTime: DateTime(2023, 10, 5, 9, 0),
  petsServiced: [
    Pet(name: "Max", type: "Cat"),
  ],
),
ServiceProvider(
  name: "Olivia Davis",
  service: "Pet Groomer",
  imageUrl:
      "https://www.dailypaws.com/thmb/EEFTv08xdBU4KSmFzpOhktzyzf0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/taylor-swift-cat-names-042af8f902bd4ebdb3a58bb96eec835d.jpg",
  dateTime: DateTime(2023, 9, 20, 11, 15),
  petsServiced: [
    Pet(name: "Muffin", type: "Dog"),
    Pet(name: "Max", type: "Cat"),
  ],
),
ServiceProvider(
  name: "Noah Johnson",
  service: "Pet Walker",
  imageUrl:
      "https://previews.123rf.com/images/lightfieldstudios/lightfieldstudios1808/lightfieldstudios180842506/106898921-handsome-young-man-with-parrot-on-shoulder.jpg",
  dateTime: DateTime(2023, 9, 10, 16, 45),
  petsServiced: [
    Pet(name: "Coco", type: "Dog"),
  ],
),
ServiceProvider(
  name: "Ava Wilson",
  service: "Pet Sitter",
  imageUrl:
      "https://media.istockphoto.com/id/1354391102/photo/loving-korean-lady-petting-her-dog-while-feeding-it.jpg?s=612x612&w=0&k=20&c=yNFbA2a4PgGCMzxBJ7FZEeig6gu9wqJaWCzblQdwR6c=",
  dateTime: DateTime(2023, 8, 3, 8, 30),
  petsServiced: [
    Pet(name: "Buddy", type: "Bird"),
  ],
),
ServiceProvider(
  name: "Dr. Oliver Lee",
  service: "Veterinary",
  imageUrl:
      "https://previews.123rf.com/images/didesign021/didesign0211604/didesign021160400042/57026774-persian-cat-with-veterinarian-doctor-at-vet-clinic.jpg",
  dateTime: DateTime(2023, 7, 15, 10, 0),
  petsServiced: [
    Pet(name: "Buddy", type: "Bird"),
  ],
),
ServiceProvider(
  name: "Sophia Harris",
  service: "Pet Sitter",
  imageUrl:
      "https://c4.wallpaperflare.com/wallpaper/372/510/576/mulan-wallpaper-preview.jpg",
  dateTime: DateTime(2023, 6, 28, 15, 45),
  petsServiced: [
    Pet(name: "Muffin", type: "Dog"),
  ],
),
ServiceProvider(
  name: "William Martin",
  service: "Pet Groomer",
  imageUrl:
      "https://4kwallpapers.com/images/walls/thumbs_3t/11990.jpeg",
  dateTime: DateTime(2023, 5, 10, 13, 0),
  petsServiced: [
    Pet(name: "max", type: "Cat"),
  ],
),
    // Add more booked providers here
  ];

  void _onRatingChanged(int index, int newRating) {
    setState(() {
      bookedProviders[index].rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      theme: myTheme,
      home: Scaffold(
        body: ListView.builder(
          padding: EdgeInsets.only(bottom: 24.0), // Adjust the value as needed
          itemCount: bookedProviders.length,
          itemBuilder: (context, index) {
            
            if (index == 0) {
              return Entry.all(
                      delay: Duration(milliseconds: (10 * (index % 3))),
                      duration: Duration(milliseconds: 300),
                      child:
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BookedProviderTile(
                    bookedProvider: bookedProviders[index],
                    index: index,
                    onRatingChanged: _onRatingChanged,
                  ),
                ],
              ));
            } else {
              return Entry.all(
                      delay: Duration(milliseconds: (10 * (index % 3))),
                      duration: Duration(milliseconds: 300),
                      child:
               BookedProviderTile(
                bookedProvider: bookedProviders[index],
                index: index,
                onRatingChanged: _onRatingChanged,
              ));
            }
          },
        ),
      ),
    );
  }
}

class BookedProviderTile extends StatefulWidget {
  final ServiceProvider bookedProvider;
  final int index;
  final Function(int, int) onRatingChanged;

  BookedProviderTile({
    required this.bookedProvider,
    required this.index,
    required this.onRatingChanged,
  });

  @override
  _BookedProviderTileState createState() => _BookedProviderTileState();
}

class _BookedProviderTileState extends State<BookedProviderTile> {
  bool selected = false;
  bool ratingInProgress = false;
  double tileHeight = 100;
  bool showDetails = false;
  bool isButtonPressed = false; // Define isButtonPressed here
  bool isReportPressed = false; // Define isButtonPressed here

  String _getFormattedPets(List<Pet> pets) {
    if (pets.isEmpty) {
      return 'None';
    }
    return pets.map((pet) => '${pet.name} (${pet.type})').join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!ratingInProgress) {
            selected = !selected;
            tileHeight = selected ? 250 : 100;
            if (selected) {
              Future.delayed(Duration(milliseconds: 50), () {
                setState(() {
                  showDetails = true;
                });
              });
            } else {
              showDetails = false;
            }
          }
        });
      },
      child: Container(
        child: AnimatedContainer(
          height: tileHeight,
          duration: Duration(milliseconds: 70),
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 18, right: 18, top: 16),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: selected ? Colors.grey : Colors.grey.withOpacity(0.4),
                  offset: selected ? Offset(-0.85, -0.85) : Offset(1.0, 1.0),
                  blurRadius: selected ? 0.2 : 1.0,
                  spreadRadius: selected ? 0.2 : 0.5,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-1.0, -1.0),
                  blurRadius: 1.0,
                  spreadRadius: 0.5,
                ),
              ],
            ),
            child: Stack(children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 78,
                    height: 78,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      backgroundImage:
                          NetworkImage(widget.bookedProvider.imageUrl),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.bookedProvider.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: <Widget>[
                          Text(
                            'Service: ',
                          ),
                          Text(
                            widget.bookedProvider.service,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 3),
                        ],
                      ),
                      SizedBox(height: 6),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Date: ',
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: DateFormat('dd-MM-yyyy HH:mm')
                                  .format(widget.bookedProvider.dateTime),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (showDetails) ...[
                        SizedBox(height: 6),
                        Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Text('Rating: '),
                                Row(
                                  children: List.generate(5, (index) {
                                    final star = index + 1;
                                    return GestureDetector(
                                      onTap: () {
                                        widget.onRatingChanged(
                                            widget.index, star);
                                        setState(() {
                                          ratingInProgress = true;
                                        });
                                      },
                                      child: Icon(
                                        Icons.star,
                                        size: 20,
                                        color:
                                            star <= widget.bookedProvider.rating
                                                ? Theme.of(context)
                                                    .secondaryHeaderColor
                                                : Colors.grey,
                                      ),
                                    );
                                  }),
                                ),
                                if (ratingInProgress)
                                  GestureDetector(
                                    onTap: () {
                                      widget.onRatingChanged(widget.index,
                                          widget.bookedProvider.rating);
                                      setState(() {
                                        ratingInProgress = false;
                                      });
                                    },
                                    child: Text(
                                      '\t\t\tSubmit',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ],
                  )
                ],
              ),
              if (showDetails) // Show details after the delay
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 45,
                      width: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            30.0), // Set the border radius
                        border: Border.all(
                          color: Theme.of(context)
                              .primaryColor, // Set the color of the additional border
                          width:
                              2.5, // Adjust the width of the additional border as needed
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isButtonPressed = !isButtonPressed;
                            Future.delayed(Duration(milliseconds: 100), () {
                              setState(() {
                                isButtonPressed = !isButtonPressed;
                                Future.delayed(Duration(milliseconds: 100), () {
                                  _showPetSelectionDialog(
                                      context); // Show the dialog with pet selection
                                });
                              });
                            });
                          });
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(
                            isButtonPressed
                                ? Theme.of(context).primaryColor
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            isButtonPressed
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: isButtonPressed
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                width: 1.5,
                              ),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(Size(134.0, 45.0)),
                          //remove inksplash effect
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.transparent;
                              return null; // Defer to the widget's default.
                            },
                          ),
                        ),
                        child: Text(
                          "Request Again",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (showDetails) // Show details after the delay
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 45,
                      width: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            30.0), // Set the border radius
                        border: Border.all(
                          color: Colors
                              .black, // Set the color of the additional border
                          width:
                              2.5, // Adjust the width of the additional border as needed
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isReportPressed = !isReportPressed;
                            Future.delayed(Duration(milliseconds: 100), () {
                              _showReportDialog(
                                  context); // Show the report dialog
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (_) => PetSelectionPage(),
                              //   ),
                              // );
                            });
                          });
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          foregroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(Size(134.0, 45.0)),
                          //remove inksplash effect
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.transparent;
                              return null; // Defer to the widget's default.
                            },
                          ),
                        ),
                        child: Text(
                          "Report",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                  top: 104, // adjust this value to position the text box
                  left: 0,
                  right: 0,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Pets Serviced: ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: _getFormattedPets(
                              widget.bookedProvider.petsServiced),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
void _showReportDialog(BuildContext context) {
  final customTextFieldDecoration = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: Theme.of(context).secondaryHeaderColor,
        width: 2.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: Colors.grey, // Grey border color
        width: 2.0,
      ),
    ),
    hintText: "Enter your reason here",
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text("Report"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Please enter your reason for reporting:"),
            SizedBox(height: 16),
            TextField(
              decoration: customTextFieldDecoration,
              maxLines: 5,
            ),
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
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Back', style: TextStyle(fontSize: 16)),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    minimumSize: MaterialStateProperty.all(Size(120.0, 40.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Handle confirm button logic here

                    // Close the dialog
                    Navigator.of(context).pop();

                    // Show a Snackbar message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Report successfully submitted'),
                        duration: Duration(
                            seconds: 3), // Adjust the duration as needed
                      ),
                    );
                  },
                  child: Text('Report', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}



void _showPetSelectionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          height: 400.0, // Adjust the height as needed
          child:
              PetSelectionPage(), // Use the PetSelectionPage as the content of the dialog
        ),
      );
    },
  );
}

class PetSelectionPage extends StatefulWidget {
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
          'https://wallpaperaccess.com/full/94009.jpg', // Replace with actual image URL
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
    return ClipRRect(
        borderRadius:
            BorderRadius.circular(20.0), // Adjust the radius as needed
        child: Scaffold(
          backgroundColor: Colors.white,
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
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  padding: EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                      bottom:
                          80.0), // Increase the margin around the entire grid
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
                          height: 100,
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
                                offset: isSelected
                                    ? Offset(-1, -1)
                                    : Offset(1.5, 1.5),
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
                                radius:
                                    30.0, // Adjust the size of the CircleAvatar
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
              ? Container(
                  width: 160.0, // Adjust the width to your desired value
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => LottieAnimationPage(),
                      ));
                      // Add your logic for the next button action here
                      // This is where you can navigate to the next screen or perform the desired action.
                    },
                    label: Text('Send Request'), // Text inside the button
                    icon: Icon(Icons.done_rounded),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}
