// import 'package:flutter/material.dart';
// import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:geolocator/geolocator.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Location Picker Example',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Picker Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => LocationPickerScreen()),
//             );
//           },
//           child: Text('Select Location'),
//         ),
//       ),
//     );
//   }
// }

// class LocationPickerScreen extends StatefulWidget {
//   @override
//   _LocationPickerScreenState createState() => _LocationPickerScreenState();
// }

// class _LocationPickerScreenState extends State<LocationPickerScreen> {
//   Future<void> _checkLocationPermission() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Handle the case where the user denies permission
//         // You can show a dialog or provide instructions on how to enable location in device settings.
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Handle the case where the user denies permission permanently
//       // You can show a dialog or guide the user to device settings.
//     }
//   }

//   Future<void> _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );

//     double latitude = position.latitude;
//     double longitude = position.longitude;
//     // Use latitude and longitude as needed in your application
//   }

//   LatLng? selectedLocation;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Location'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (selectedLocation != null)
//               Text(

//                 'Selected Location: ${selectedLocation!.latitude}, ${selectedLocation!.longitude}',
//                 style: TextStyle(fontSize: 16),
//               ),
//             SizedBox(height: 16),
//             Container(
//               width: 300,
//               height: 300,
//               child: FlutterLocationPicker(
// initPosition: LatLong(203, 890),
//         initZoom: 11,
//         minZoomLevel: 5,
//         maxZoomLevel: 16,
//         trackMyPosition: true,
//         onPicked: (pickedData) {
//         })
//               ),
           
//           ],
//         ),
//       ),
//     );
//   }
// }
