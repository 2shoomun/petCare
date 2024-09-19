import 'package:entry/entry.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pet_owner_homepage.dart';
import 'choosePet.dart';
import 'package:animations/animations.dart';
import 'provider_details.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'dart:ui';


void main() => runApp(PetGroomerPage());

class ServiceProviderGroomer {
  final String name;
  final double rating;
  final String imageUrl;
  final String serviceType;
  final String workingHours;
  final String homeServiceAvailability;
  final String address;
  final int YOE;

  ServiceProviderGroomer({
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.serviceType,
    required this.workingHours,
    required this.homeServiceAvailability,
    required this.address,
    required this.YOE,
  });
}

class PetGroomerPage extends StatelessWidget {
  final List<ServiceProviderGroomer> serviceProviders = [
    ServiceProviderGroomer(
      name: "Lisa Martinez",
      rating: 4.9,
      imageUrl: "https://images.ctfassets.net/2t8dhn7s97w9/2AzmRIM9Obq6ou8wh74kc1/9732dfeaee10a3a6cd7051d7daffb120/WEB-1371877-May22_C-ART3-1_GRM-DOG-BNB_MO.png",
      serviceType: "Wash \nHair trimming \nBrushing \nNail Clipping \nEye and Ear Cleaning \nDematting treatments",
      homeServiceAvailability: 'Yes',
      address: '3562 Parkview Drive,\nChicago,\nIllinois, 60606',
      workingHours: '9:00 AM - 5:00 PM',
      YOE: 3,
    ),
    ServiceProviderGroomer(
      name: "Sebastian Stan",
      rating: 4.9,
      imageUrl: "https://i.guim.co.uk/img/media/d8562814c131092f47d25eecd352a80df8bdd22a/0_404_7360_4417/master/7360.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=957f7591586da5045ffd305c7b09cced",
      serviceType: "Wash \nHair trimming \nBrushing \nNail Clipping \nEye and Ear Cleaning \nDematting treatments",
      homeServiceAvailability: 'Yes',
      address: '3562 Parkview Drive,\nChicago,\nIllinois, 60606',
      workingHours: '9:00 AM - 5:00 PM',
      YOE: 3,
    ),
    ServiceProviderGroomer(
      name: "Olivia Wilson",
      rating: 4.8,
      imageUrl: "https://static2.bigstockphoto.com/9/6/4/large1500/469459137.jpg",
      serviceType: "Wash\nHair trimming\nBrushing\nNail Clipping\nDe-shedding treatments",
      homeServiceAvailability: 'Yes',
      address: '3562 Parkview Drive,\nChicago,\nIllinois, 60606',
      workingHours: '9:00 AM - 5:00 PM',
      YOE: 5,
    ),
    ServiceProviderGroomer(
      name: "Sophia White",
      rating: 4.7,
      imageUrl: "https://www.shutterstock.com/image-photo/happy-young-woman-sitting-on-260nw-2018571389.jpg",
      serviceType: "Hair trimming\nNail Trimming\nBath\nBrushing\nNail Clipping\nEye and Ear Cleaning\nTeeth brushing\nDe-shedding treatments",
      homeServiceAvailability: 'No',
      address: '3562 Parkview Drive,\nChicago,\nIllinois, 60606',
      workingHours: '9:00 AM - 5:00 PM',
      YOE: 4,
    ),
    ServiceProviderGroomer(
      name: "Steve Rogers",
      rating: 4.6,
      imageUrl: "https://www.koimoi.com/wp-content/new-galleries/2021/11/chris-evans-has-been-awarded-the-title-of-2021s-sxiest-man-alive-read-more-to-find-out-001.jpg",
      serviceType: "Hair trimming\nNail Trimming\nBath\nBrushing\nNail Clipping\nEye and Ear Cleaning\nTeeth brushing\nDe-shedding treatments",
      homeServiceAvailability: 'No',
      address: '3562 Parkview Drive,\nChicago,\nIllinois, 60606',
      workingHours: '9:00 AM - 5:00 PM',
      YOE: 4,
    ),
    // Add more pet groomers here
    ServiceProviderGroomer(
      name: "Michael Smith",
      rating: 4.5,
      imageUrl: "https://cdn.romania-insider.com/sites/default/files/styles/article_large_image/public/2019-02/sebastian_stan_shuttestock.com_.jpg",
      serviceType: "Wash\nBrushing\nNail Clipping\nEye and Ear Cleaning",
      homeServiceAvailability: 'Yes',
      address: '3562 Parkview Drive,\nChicago,\nIllinois, 60606',
      workingHours: '9:00 AM - 5:00 PM',
      YOE: 2,
    ),
    ServiceProviderGroomer(
      name: "Olivia Wilson",
      rating: 4.8,
      imageUrl: "https://static2.bigstockphoto.com/9/6/4/large1500/469459137.jpg",
      serviceType: "Wash\nHair trimming\nBrushing\nNail Clipping\nDe-shedding treatments",
      homeServiceAvailability: 'Yes',
      address: '3562 Parkview Drive,\nChicago,\nIllinois, 60606',
      workingHours: '9:00 AM - 5:00 PM',
      YOE: 5,
    ),
    // Add more pet groomers here
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
                    'Pet Groomer',
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
                      'Select a Pet Groomer',
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

class ServiceProviderTile extends StatefulWidget {
  final ServiceProviderGroomer serviceProvider;

  ServiceProviderTile({required this.serviceProvider});

  @override
  _ServiceProviderTileState createState() => _ServiceProviderTileState();
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
                  return YourServiceProviderDetailsWidget.serviceProviderGroomer(
                    serviceProviderGroomer: widget.serviceProvider,
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
                                    'Home Service: ${widget.serviceProvider.homeServiceAvailability}',
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


