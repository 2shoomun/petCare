

// import 'package:flutter/material.dart';
// import 'package:pet_care/main.dart';
// import 'package:pet_care/pet_owner_homepage.dart';
// import 'choosePet.dart';

// void main() => runApp(PetWalkerPage());

// class ServiceProvider {
//   final String name;
//   final double rating;
//   final String imageUrl;
//   final int YOE;

//   ServiceProvider({
//     required this.name,
//     required this.rating,
//     required this.imageUrl,
//     required this.YOE,
//   });
// }

// class PetWalkerPage extends StatelessWidget {
//   final List<ServiceProvider> serviceProviders = [
//     ServiceProvider(
//       name: "John Doe",
//       rating: 4.5,
//       imageUrl:
//           "https://depor.com/resizer/Ho8hCX_y8uU-8yxffDOHQbCUY5k=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/DPIGOGAZKRAQRK54VGPHVSZATY.jpg",
//       YOE: 3,
//     ),
//     ServiceProvider(
//       name: "Jane Smith",
//       rating: 5.0,
//       imageUrl:
//           "https://external-preview.redd.it/spider-man-beyond-the-spider-verse-to-feature-multiple-v0-miitZeDX1wov8Zvvn91ra-V1fQGzCQLuZcEykJgbsqM.jpg?width=640&crop=smart&auto=webp&s=75cf56c19e47f0d85c4f2072d38162b6c059556e",
//       YOE: 4,
//     ),
//     // Add more service providers here
//     ServiceProvider(
//       name: "Jane Smith",
//       rating: 5.0,
//       imageUrl: "https://cdn.wallpapersafari.com/22/72/pzRFkg.jpg",
//       YOE: 2,
//     ),
//     ServiceProvider(
//       name: "Jane Smith",
//       rating: 5.0,
//       imageUrl:
//           "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
//       YOE: 3,
//     ),
//     ServiceProvider(
//       name: "Jane Smith",
//       rating: 5.0,
//       imageUrl:
//           "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
//       YOE: 1,
//     ),
//     ServiceProvider(
//       name: "Jane Smith",
//       rating: 5.0,
//       imageUrl:
//           "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
//       YOE: 1,
//     ),
//     // ServiceProvider(
//     //   name: "Jane Smith",
//     //   rating: 5.0,
//     //   imageUrl:
//     //       "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
//     // ),
//     // ServiceProvider(
//     //   name: "Jane Smith",
//     //   rating: 5.0,
//     //   imageUrl:
//     //       "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
//     // ),
//     // ServiceProvider(
//     //   name: "Jane Smith",
//     //   rating: 5.0,
//     //   imageUrl:
//     //       "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
//     // ),
//     // ServiceProvider(
//     //   name: "Jane Smith",
//     //   rating: 5.0,
//     //   imageUrl:
//     //       "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
//     // ),
//     // ServiceProvider(
//     //   name: "Jane Smith",
//     //   rating: 5.0,
//     //   imageUrl:
//     //       "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
//     // ),
//     // ServiceProvider(
//     //   name: "Jane Smith",
//     //   rating: 5.0,
//     //   imageUrl:
//     //       "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
//     // ),
//     // ServiceProvider(
//     //   name: "Jane Smith",
//     //   rating: 5.0,
//     //   imageUrl:
//     //       "https://images.wallpapersden.com/image/download/cool-phoenix-valorant-art_bGZoZW2UmZqaraWkpJRobWllrWdma2U.jpg",
//     // ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: myTheme,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(60.0),
//           child: AppBar(
//             elevation: 0,
//             backgroundColor:
//                 Colors.white, // Set the app bar background color to white
//             automaticallyImplyLeading: false,
//             iconTheme: IconThemeData(
//               color: Theme.of(context).primaryColor, // Set the icon color
//             ),
//             title: Stack(
//               alignment: Alignment.center,
//               children: [
//                 Positioned(
//                   left: -10,
//                   child: IconButton(
//                     icon: Icon(Icons.arrow_back_ios_new),
//                     onPressed: () {
//                       // Use Navigator to navigate back to loginPage.dart and RegistrationPage
//                       Navigator.of(context).pushAndRemoveUntil(
//                         MaterialPageRoute(
//                             builder: (context) => PetSelectionPage()),
//                         (route) => false, // Remove all routes from the stack
//                       );
//                     },
//                   ),
//                 ),
//                 Center(
//                   child: Text(
//                     'Pet Walker',
//                     style: TextStyle(
//                       color: Theme.of(context).primaryColor,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         body: ListView.builder(
//           itemCount: serviceProviders.length,
//           itemBuilder: (context, index) {
//             if (index == 0) {
//               // This is the first item in the list, which contains the title
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.only(
//                         top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
//                     child: Text(
//                       'Select a Service Provider',
//                       style: TextStyle(
//                         fontSize: 30, // Adjust the font size as needed
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   ServiceProviderTile(serviceProvider: serviceProviders[index]),
//                 ],
//               );
//             } else {
//               // These are the service provider tiles
//               return ServiceProviderTile(
//                   serviceProvider: serviceProviders[index]);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// class ServiceProviderTile extends StatefulWidget {
//   final ServiceProvider serviceProvider;

//   ServiceProviderTile({required this.serviceProvider});

//   @override
//   _ServiceProviderTileState createState() => _ServiceProviderTileState();
// }

// class _ServiceProviderTileState extends State<ServiceProviderTile> {
//   bool selected = false;
//   double tileHeight = 100; // Initial height of the tile
//   bool showDetails = false;
//   bool isButtonPressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) {
//         setState(() {
//           selected = !selected; // Toggle selected state on tap
//           tileHeight = selected ? 175 : 100; // Adjust tile height accordingly
//           if (selected) {
//             // Delay showing details for one second
//             Future.delayed(Duration(milliseconds: 50), () {
//               setState(() {
//                 showDetails = true;
//               });
//             });
//           } else {
//             showDetails = false;
//           }
//         });
//       },
//       child: Container(
//         margin: EdgeInsets.all(6),
//         padding: EdgeInsets.all(10),
//         child: AnimatedContainer(
//           height: tileHeight,
//           padding: EdgeInsets.all(10),
//           duration: Duration(milliseconds: 70), // Animation duration
//           curve: Curves.easeInOut, // Animation curve
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: Colors.transparent, // Change this color based on your button click
//               width: 1.0, // Adjust the width of the border as needed
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: selected ? Colors.black : Colors.black.withOpacity(0.6),
//                 offset: selected ? Offset(-0.85, -0.85) : Offset(1.0, 1.0),
//                 blurRadius: selected ? 0.2 : 1.0,
//                 spreadRadius: selected ? 0.2 : 0.5,
//               ),
//               BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(-1.0, -1.0),
//                 blurRadius: 1.0,
//                 spreadRadius: 0.5,
//               ),
//             ],
//           ),
//           child: Stack(
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   // Profile picture
//                   Container(
//                     width: 78, // Add a fixed width for the profile picture
//                     height: 78, // Add a fixed height for the profile picture

//                     child: CircleAvatar(
//                       backgroundColor: Theme.of(context).primaryColor,
//                       backgroundImage:
//                           NetworkImage(widget.serviceProvider.imageUrl),
//                     ),
//                   ),
//                   SizedBox(width: 15),
//                   // Details
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         widget.serviceProvider.name,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.star,
//                             color: Theme.of(context).secondaryHeaderColor,
//                           ),
//                           Text(
//                             widget.serviceProvider.rating.toString(),
//                             style: TextStyle(
//                               color: Theme.of(context).primaryColor,
//                             ),
//                           ),
//                           SizedBox(width: 3),
//                           Text(
//                             '100 ratings',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 5), // Add some space here (optional
//                       Text(
//                         'Years of Experience: ${widget.serviceProvider.YOE}',
//                       ),
//                       if (showDetails) // Show details after the delay
//                         Divider(
//                           thickness: 1,
//                           color: Colors.black,
//                         ),
//                     ],
//                   ),
//                 ],
//               ),
//               if (showDetails) // Show details after the delay
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: Container(
//                     alignment: Alignment.bottomRight,
//                     child: Container(
//                       height: 45,
//                       width: 95,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                             30.0), // Set the border radius
//                         border: Border.all(
//                           color: Theme.of(context)
//                               .primaryColor, // Set the color of the additional border
//                           width:
//                               2.5, // Adjust the width of the additional border as needed
//                         ),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             isButtonPressed = !isButtonPressed;
//                             Future.delayed(Duration(milliseconds: 100), () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (_) => PetSelectionPage(),
//                                 ),
//                               );
//                             });
//                           });
//                         },
//                         style: ButtonStyle(
//                           elevation: MaterialStateProperty.all(0),
//                           backgroundColor: MaterialStateProperty.all(
//                             isButtonPressed
//                                 ? Theme.of(context).primaryColor
//                                 : Theme.of(context)
//                                     .primaryColor
//                                     .withOpacity(0.1),
//                           ),
//                           foregroundColor: MaterialStateProperty.all(
//                             isButtonPressed
//                                 ? Colors.white
//                                 : Theme.of(context).primaryColor,
//                           ),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               side: BorderSide(
//                                 color: isButtonPressed
//                                     ? Theme.of(context).primaryColor
//                                     : Colors.white,
//                                 width: 1.5,
//                               ),
//                             ),
//                           ),
//                           minimumSize:
//                               MaterialStateProperty.all(Size(95.0, 45.0)),
//                           //remove inksplash effect
//                           overlayColor:
//                               MaterialStateProperty.resolveWith<Color?>(
//                             (Set<MaterialState> states) {
//                               if (states.contains(MaterialState.pressed))
//                                 return Colors.transparent;
//                               return null; // Defer to the widget's default.
//                             },
//                           ),
//                         ),
//                         child: Text(
//                           "Continue",
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
