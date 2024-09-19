import 'package:entry/entry.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:pet_care/main.dart';
import 'package:animations/animations.dart';
import 'provider_details.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'dart:ui';

void main() => runApp(PetWalkerPage());

class ServiceProvider {
  final String name;
  final double rating;
  final String imageUrl;
  final int YOE;

  ServiceProvider({
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.YOE,
  });
}

class PetWalkerPage extends StatelessWidget {
  final List<ServiceProvider> serviceProviders = [
    ServiceProvider(
  name: "Alice Johnson",
  rating: 4.8,
  imageUrl: "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  YOE: 5,
),
ServiceProvider(
  name: "John Doe",
  rating: 4.6,
  imageUrl: "https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2020/06/04/Pictures/spiderman-3-2007_4e232eb0-a640-11ea-ad77-c76040589f9e.jpg",
  YOE: 2,
),
ServiceProvider(
  name: "Eva Martinez",
  rating: 4.5,
  imageUrl: "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",
  YOE: 4,
),
ServiceProvider(
  name: "Sarah Wilson",
  rating: 4.0,
  imageUrl: "https://images.unsplash.com/photo-1582610285985-a42d9193f2fd?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YW1lcmljYW4lMjB3b21hbnxlbnwwfHwwfHx8MA%3D%3D",
  YOE: 2,
),
ServiceProvider(
  name: "Mike Brown",
  rating: 3.9,
  imageUrl: "https://californiamuseum.org/wp-content/uploads/robertdowneyjr_cahalloffameinductee-1.png",
  YOE: 3,
),
ServiceProvider(
  name: "Bob Smith",
  rating: 3.7,
  imageUrl: "https://i.pinimg.com/1200x/9b/5b/dc/9b5bdc97216ea1fc376e1c56d8a30d7c.jpg",
  YOE: 1,
),

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
            backgroundColor:
                Colors.transparent, // Set the app bar background color to white
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
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Center(
                  child: Text(
                    'Pet Walker',
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
          padding:
              EdgeInsets.all(8.0), // Increase the margin around the entire grid
          itemBuilder: (context, index) {

            if (index == 0) {
              final rowIndex = index ~/ 3; // Assuming 3 columns
                        final delay = Duration(milliseconds: (200 * rowIndex));
                       return Entry.all(
                      delay: delay,
                      duration: Duration(milliseconds: 600),
                      child:
              // This is the first item in the list, which contains the title
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
                    child: Text(
                      'Select a Service Provider',
                      style: TextStyle(
                        fontSize: 30, // Adjust the font size as needed
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
                      child:
              // These are the service provider tiles
               ServiceProviderTile(
                  serviceProvider: serviceProviders[index]));
            }
          },
        ),
      ),
    );
  }
}

class ServiceProviderTile extends StatefulWidget {
  final ServiceProvider serviceProvider;

  ServiceProviderTile({required this.serviceProvider});

  @override
  _ServiceProviderTileState createState() => _ServiceProviderTileState();
}

class _ServiceProviderTileState extends State<ServiceProviderTile> {
  bool selected = false;
  double tileHeight = 100; // Initial height of the tile
  bool showDetails = false;
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    Offset distance = selected ? Offset(5, 5) : Offset(10, 10);
    double blur = selected ? 5.0 : 10.0;

    return GestureDetector(
        // onTap: () {
        //   setState(() {
        //     selected = true; // Toggle selected state on tap
        //   });
        //   Future.delayed(Duration(milliseconds: 100), () {
        //     setState(() {
        //       selected = false; // Toggle selected state on tap
        //     });
        //   });

        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return YourServiceProviderDetailsWidget(
        //     serviceProvider: widget.serviceProvider,
        //   );
        // }));
        // },
        child: Listener(
            onPointerUp: (_) => setState(() => selected = false),
            onPointerDown: (_) => setState(() => selected = true),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 50),
              margin: EdgeInsets.all(7),

              //           child: Neumorphic(
              // style: NeumorphicStyle(
              //   shape: NeumorphicShape.convex,
              //   boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              //   depth: selected ? -10 : 10, // Adjust the depth based on selection
              //   intensity: 0.6, // Adjust the intensity to control the lighting
              //   lightSource: LightSource.topLeft, // Adjust the light source direction
              // ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    20), // Match the border radius of the inner container
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

                //   // boxShadow: [
                //   //   BoxShadow(

                //   //     color: selected
                //   //         ? Colors.grey.shade400
                //   //         : Colors.grey.withOpacity(0.6),
                //   //     offset: selected ? Offset(-1, -1) : Offset(1.0, 1.0),

                //   //     blurRadius: selected ? 1 : 1.0,
                //   //     spreadRadius: selected ? 0.3 : 1,
                //   //   ),
                //   //   BoxShadow(
                //   //     color: Colors.white,
                //   //     offset: selected ? Offset(1.0, 1.0) : Offset(-2, -2),
                //   //     blurRadius: 1.0,
                //   //     spreadRadius: 0.5,
                //   //   ),
                //   // ],
              ),
              child: OpenContainer(
                transitionType: ContainerTransitionType.fade,
                closedElevation: 0, // Remove elevation
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

                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return YourServiceProviderDetailsWidget(
                      //     serviceProvider: widget.serviceProvider,
                      //   );
                      // }));
                    },
                    child: AnimatedContainer(
                      height: tileHeight,
                      padding: EdgeInsets.all(10),
                      duration: Duration(milliseconds: 70),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20), // Match the border radius of the inner container
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
                              // Profile picture
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
                              // Details
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
