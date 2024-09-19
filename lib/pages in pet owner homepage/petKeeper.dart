import 'package:entry/entry.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pet_owner_homepage.dart';
import 'choosePet.dart';
import 'package:animations/animations.dart';
import 'provider_details.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'dart:ui';
import 'petWalker.dart';

void main() => runApp(PetKeeperPage());

class PetKeeperPage extends StatelessWidget {
  final List<ServiceProvider> serviceProviders = [
    ServiceProvider(
      name: "Sarah Williams",
      rating: 4.8,
      imageUrl: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmVtYWxlJTIwcG9ydHJhaXR8ZW58MHx8MHx8fDA%3D",
      YOE: 3,
    ),
    ServiceProvider(
      name: "Robert Davis",
      rating: 4.6,
      imageUrl: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR-yT3ydjBa4n7txOqiQFQUPevfFrB-f2v3tWzECsTNpG8dBS4v",
      YOE: 5,
    ),
    // Add more pet keepers here
    ServiceProvider(
      name: "Mia Anderson",
      rating: 4.6,
      imageUrl: "https://img.freepik.com/premium-photo/beautiful-south-indian-female-college-student-without-anyone-else-blurred-background_878783-7184.jpg",
      YOE: 3,
    ),
    ServiceProvider(
      name: "William Jones",
      rating: 4.3,
      imageUrl: "https://images.fandango.com/ImageRenderer/400/0/redesign/static/img/default_poster.png/0/images/masterrepository/performer%20images/145137/vincentdonofrio-tvfestival-2.jpg",
      YOE: 4,
    ),
    // Add more pet keepers here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      theme: myTheme,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
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
                    'Pet Keeper',
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
        body: ListView.builder(
          itemCount: serviceProviders.length,
          padding: EdgeInsets.all(8.0),
          itemBuilder: (context, index) {
            if (index == 0) {
              final rowIndex = index ~/ 3; // Assuming 3 columns
                        final delay = Duration(milliseconds: (200 * rowIndex));
                       return Entry.all(
                      delay: delay,
                      duration: Duration(milliseconds: 600),
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
                    child: Text(
                      'Select a Pet Keeper',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                  ServiceProviderTile(serviceProvider: serviceProviders[index]),
                ],
              ));
            } else {
              final rowIndex = index ~/ 3; // Assuming 3 columns
                        final delay = Duration(milliseconds: (200 * rowIndex));
                       return Entry.all(
                      delay: delay,
                      duration: Duration(milliseconds: 600),
                      child: ServiceProviderTile(
                  serviceProvider: serviceProviders[index]));
            }
          },
        ),
      ),
    );
  }
}

class _ServiceProviderTileState extends State<ServiceProviderTile> {
  bool selected = false;
  double tileHeight = 100;
  bool showDetails = false;
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    Offset distance = selected ? Offset(5, 5) : Offset(10, 10);
    double blur = selected ? 5.0 : 10.0;

    return GestureDetector(
        child: Listener(
            onPointerUp: (_) => setState(() => selected = false),
            onPointerDown: (_) => setState(() => selected = true),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 50),
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  selected
                      ? BoxShadow(
                          blurRadius: blur,
                          offset: -distance,
                          color: Colors.white,
                        )
                      : BoxShadow(
                          blurRadius: blur,
                          offset: distance,
                          color: Colors.grey.shade400,
                        ),
                ],
              ),
              child: OpenContainer(
                transitionType: ContainerTransitionType.fade,
                closedElevation: 0,
                closedShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                openBuilder: (BuildContext context, VoidCallback _) {
                  return YourServiceProviderDetailsWidget.serviceProvider(
                    serviceProvider: widget.serviceProvider,
                  );
                },
                closedBuilder:
                    (BuildContext context, VoidCallback openContainer) {
                  return GestureDetector(
                    onTap: () {
                      Future.delayed(Duration(milliseconds: 40), () {
                        openContainer();
                      });
                    },
                    child: AnimatedContainer(
                      height: tileHeight,
                      padding: EdgeInsets.all(10),
                      duration: Duration(milliseconds: 70),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 78,
                                height: 78,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  backgroundImage: NetworkImage(
                                      widget.serviceProvider.imageUrl),
                                ),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.serviceProvider.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                      ),
                                      Text(
                                        widget.serviceProvider.rating
                                            .toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        '100 ratings',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Years of Experience: ${widget.serviceProvider.YOE}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
  }
}


