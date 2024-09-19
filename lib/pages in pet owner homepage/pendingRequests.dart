import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_care/main.dart';

void main() => runApp(PendingRequestsPage());

class ServiceProvider {
  final String name;
  final String service;
  final String imageUrl;
  final DateTime dateTime;
  List<Pet> petsServiced; // Add a list of pets serviced

  ServiceProvider({
    required this.name,
    required this.service,
    required this.imageUrl,
    required this.dateTime,
    this.petsServiced = const [], // Initialize as an empty list
  });
}

class Pet {
  final String name;
  final String type;

  Pet({required this.name, required this.type});
}

class PendingRequestsPage extends StatefulWidget {
  @override
  _PendingRequestsPageState createState() => _PendingRequestsPageState();
}

class _PendingRequestsPageState extends State<PendingRequestsPage> {
  final List<ServiceProvider> bookedProviders = [
    ServiceProvider(
      name: "John Doe",
      service: "Pet Walker",
      imageUrl:
          "https://depor.com/resizer/Ho8hCX_y8uU-8yxffDOHQbCUY5k=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/DPIGOGAZKRAQRK54VGPHVSZATY.jpg",
      dateTime: DateTime(2023, 4, 12, 10, 0),
      petsServiced: [
        Pet(name: "Muffin", type: "Dog"),
        Pet(name: "Buddy", type: "Bird"),
      ],
    ),
    ServiceProvider(
      name: "Jane Smith",
      service: "Pet Groomer",
      imageUrl:
          "https://external-preview.redd.it/spider-man-beyond-the-spider-verse-to-feature-multiple-v0-miitZeDX1wov8Zvvn91ra-V1fQGzCQLuZcEykJgbsqM.jpg?width=640&crop=smart&auto=webp&s=75cf56c19e47f0d85c4f2072d38162b6c059556e",
      dateTime: DateTime(2023, 4, 12, 10, 0),
      petsServiced: [
        Pet(name: "Max", type: "Cat"),
      ],
    ),
  ];
  void removeTile(int index) {
    setState(() {
      bookedProviders.removeAt(index);
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
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BookedProviderTile(
                    bookedProvider: bookedProviders[index],
                    index: index,
                    onRemove: removeTile, // Pass the callback function
                  ),
                ],
              ));
            } else {
              return Entry.all(
                      delay: Duration(milliseconds: (10 * (index % 3))),
                      duration: Duration(milliseconds: 300),
                      child: BookedProviderTile(
                bookedProvider: bookedProviders[index],
                onRemove: removeTile, // Pass the callback function
                index: index,
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
  final Function(int) onRemove; // Define the onRemove callback function

  BookedProviderTile({
    required this.bookedProvider,
    required this.index,
    required this.onRemove, // Add the onRemove parameter
  });

  @override
  _BookedProviderTileState createState() => _BookedProviderTileState();
}

class _BookedProviderTileState extends State<BookedProviderTile> {
  bool selected = false;
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
          selected = !selected;
          tileHeight = selected ? 225 : 100;
          if (selected) {
            Future.delayed(Duration(milliseconds: 50), () {
              setState(() {
                showDetails = true;
              });
            });
          } else {
            showDetails = false;
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
                                fontSize: 16.0,
                              ),
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
                        Column(),
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Request successfully canceled'),
                                  duration: Duration(
                                      seconds:
                                          3), // Adjust the duration as needed
                                ),
                              );
                              setState(() {
                                isButtonPressed = !isButtonPressed;
                              });

                              // Remove the tile from the list
                              widget.onRemove(widget.index);
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
                          "Cancel Request",
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
                  top: 90, // adjust this value to position the text box
                  left: 0,
                  right: 0,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Pets Selected: ',
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: _getFormattedPets(
                              widget.bookedProvider.petsServiced),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
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
            SizedBox(height: 12),
            TextField(
              decoration: customTextFieldDecoration,
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
