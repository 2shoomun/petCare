import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pet_owner_homepage.dart';
import 'choosePet.dart';
import 'package:animations/animations.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

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
      name: "John Doe",
      rating: 4.5,
      imageUrl:
          "https://depor.com/resizer/Ho8hCX_y8uU-8yxffDOHQbCUY5k=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/DPIGOGAZKRAQRK54VGPHVSZATY.jpg",
      YOE: 3,
    ),
    ServiceProvider(
      name: "Jane Smith",
      rating: 5.0,
      imageUrl:
          "https://external-preview.redd.it/spider-man-beyond-the-spider-verse-to-feature-multiple-v0-miitZeDX1wov8Zvvn91ra-V1fQGzCQLuZcEykJgbsqM.jpg?width=640&crop=smart&auto=webp&s=75cf56c19e47f0d85c4f2072d38162b6c059556e",
      YOE: 4,
    ),
    // Add more service providers here
    ServiceProvider(
      name: "Jane Smith",
      rating: 5.0,
      imageUrl: "https://cdn.wallpapersafari.com/22/72/pzRFkg.jpg",
      YOE: 2,
    ),
    ServiceProvider(
      name: "Jane Smith",
      rating: 5.0,
      imageUrl:
          "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
      YOE: 3,
    ),
    ServiceProvider(
      name: "Jane Smith",
      rating: 5.0,
      imageUrl:
          "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
      YOE: 1,
    ),
    ServiceProvider(
      name: "Jane Smith",
      rating: 5.0,
      imageUrl:
          "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
      YOE: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              // This is the first item in the list, which contains the title
              return Column(
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
              );
            } else {
              // These are the service provider tiles
              return ServiceProviderTile(
                  serviceProvider: serviceProviders[index]);
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
      onPointerDown: (_) => setState(() => selected = !selected),
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
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage:
                        NetworkImage(widget.serviceProvider.imageUrl),
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
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        Text(
                          widget.serviceProvider.rating.toString(),
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
    ));
  }
}
