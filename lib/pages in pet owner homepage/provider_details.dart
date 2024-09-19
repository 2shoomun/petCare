import 'package:flutter/material.dart';
import 'package:pet_care/loginPagePetOwner.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petTraveller.dart';
import 'petWalker.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'RequestSent.dart';
import 'petTraveller.dart';
import 'petGroomer.dart';
import  'pharmacy.dart';

class YourServiceProviderDetailsWidget extends StatefulWidget {
  final ServiceProvider? serviceProvider;
  final ServiceProviderTraveller? serviceProviderTraveller;
  final ServiceProviderGroomer? serviceProviderGroomer;
  final ServiceProviderPharmacy? serviceProviderPharmacy;

  // Constructor for ServiceProvider
  YourServiceProviderDetailsWidget.serviceProvider(
      {required this.serviceProvider})
      : serviceProviderTraveller = null,serviceProviderGroomer = null, serviceProviderPharmacy = null;

  // Constructor for ServiceProviderTraveller
  YourServiceProviderDetailsWidget.serviceProviderTraveller(
      {required this.serviceProviderTraveller})
      : serviceProvider = null,serviceProviderGroomer = null, serviceProviderPharmacy = null;

      YourServiceProviderDetailsWidget.serviceProviderGroomer(
      {required this.serviceProviderGroomer})
      : serviceProviderTraveller = null, serviceProvider = null, serviceProviderPharmacy = null;

      YourServiceProviderDetailsWidget.serviceProviderPharmacy(
      {required this.serviceProviderPharmacy})
      : serviceProviderTraveller = null,serviceProviderGroomer = null,serviceProvider = null;

  @override
  _YourServiceProviderDetailsWidgetState createState() =>
      _YourServiceProviderDetailsWidgetState();
}

class _YourServiceProviderDetailsWidgetState
    extends State<YourServiceProviderDetailsWidget> {
  bool isButtonPressed = false;
  ScrollController _scrollController = ScrollController();
  double scrollValue = 100.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double scroll; // Set a default value
    if (_scrollController.position.maxScrollExtent > 0) {
      // ScrollView is scrollable, apply padding as needed
      // For example, change the padding when scrollable
      scroll = 60.0;
      setState(() {
        scrollValue = scroll;
      });
    } else {
      // ScrollView is not scrollable, apply a different set of padding
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.serviceProvider != null) {
      return WillPopScope(
        
          onWillPop: () async {
            return false;
          },
          child: Stack(children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
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
                          iconSize: 35,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Center(
                        child: Text(''),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                controller: _scrollController, // Attach the ScrollController
                // Wrap with SingleChildScrollView
                child: Stack(
                  children: [
                    Container(
                      height: 350,
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(children: [
                          SizedBox(height: 70.0),
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.serviceProvider!.imageUrl),
                            radius: 55.0,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            widget.serviceProvider!.name,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Rating: ${widget.serviceProvider!.rating.toString()}',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 95.0),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 60),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      '3562 Parkview Drive,\nChicago,\nIllinois, 60606',
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.4,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.mail_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'serviceprovider@gmail.com',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      '9180055189',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Text(
                                      'Years of Experience: ${widget.serviceProvider!.YOE}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                //add other details here

                                SizedBox(height: scrollValue)
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                    Positioned(
                      bottom: 24,
                      right: 16,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                30.0), // Set the border radius
                            border: Border.all(
                              color: Theme.of(context)
                                  .primaryColor, // Set the color of the additional border
                              width:
                                  3, // Adjust the width of the additional border as needed
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isButtonPressed = !isButtonPressed;
                                Future.delayed(Duration(milliseconds: 100), () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => LottieAnimationPage(),
                                    ),
                                  );
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
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                    color: isButtonPressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(160.0, 50.0)),
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
                              "Request Booking",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]));
    } else if (widget.serviceProviderTraveller != null) {
      return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Stack(children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
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
                          iconSize: 35,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Center(
                        child: Text(''),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                controller: _scrollController, // Attach the ScrollController
                // Wrap with SingleChildScrollView
                child: Stack(
                  children: [
                    Container(
                      height: 350,
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(children: [
                          SizedBox(height: 70.0),
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.serviceProviderTraveller!.imageUrl),
                            radius: 50.0,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            widget.serviceProviderTraveller!.name,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Rating: ${widget.serviceProviderTraveller!.rating.toString()}',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 100.0),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 60),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      '3562 Parkview Drive,\nChicago,\nIllinois, 60606',
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.4,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.mail_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'serviceprovider@gmail.com',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      '9180055189',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Text(
                                      'Vehicle Type: ${widget.serviceProviderTraveller!.vehicleType}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Text(
                                      'Years of Experience: ${widget.serviceProviderTraveller!.YOE}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                //add other details here

                                SizedBox(height: scrollValue)
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                    Positioned(
                      bottom: 24,
                      right: 16,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                30.0), // Set the border radius
                            border: Border.all(
                              color: Theme.of(context)
                                  .primaryColor, // Set the color of the additional border
                              width:
                                  3, // Adjust the width of the additional border as needed
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isButtonPressed = !isButtonPressed;
                                Future.delayed(Duration(milliseconds: 100), () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => LottieAnimationPage(),
                                    ),
                                  );
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
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                    color: isButtonPressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(160.0, 50.0)),
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
                              "Request Booking",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]));
    }else if (widget.serviceProviderGroomer != null) {
      return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Stack(children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
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
                          iconSize: 35,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Center(
                        child: Text(''),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                controller: _scrollController, // Attach the ScrollController
                // Wrap with SingleChildScrollView
                child: Stack(
                  children: [
                    Container(
                      height: 350,
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(children: [
                          SizedBox(height: 70.0),
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.serviceProviderGroomer!.imageUrl),
                            radius: 50.0,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            widget.serviceProviderGroomer!.name,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Rating: ${widget.serviceProviderGroomer!.rating.toString()}',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 100.0),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 60),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      '${widget.serviceProviderGroomer!.address}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.4,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.mail_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'serviceprovider@gmail.com',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      '9180055189',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
      Text(
        'Services: ',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[700],
          height: 1.4,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: 5),
    Expanded(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: widget.serviceProviderGroomer!.serviceType,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                height: 1.4, // Adjust the line spacing by changing this value
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),

                                

                                SizedBox(height: 25.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
      Text(
        'Years of Experience: ',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
        ),
      ),
      
    Expanded(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: widget.serviceProviderGroomer!.YOE.toString(),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),
SizedBox(height:25.0),
Row(
                                  children: [
                                    Text(
                                      'Working Hours: ${widget.serviceProviderGroomer!.workingHours}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Text(
                                      'Home Service Availability: ${widget.serviceProviderGroomer!.homeServiceAvailability}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                //add other details here

                                SizedBox(height: scrollValue)
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                    Positioned(
                      bottom: 24,
                      right: 16,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                30.0), // Set the border radius
                            border: Border.all(
                              color: Theme.of(context)
                                  .primaryColor, // Set the color of the additional border
                              width:
                                  3, // Adjust the width of the additional border as needed
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isButtonPressed = !isButtonPressed;
                                Future.delayed(Duration(milliseconds: 100), () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => LottieAnimationPage(),
                                    ),
                                  );
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
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                    color: isButtonPressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(160.0, 50.0)),
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
                              "Request Booking",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]));
    }else if (widget.serviceProviderPharmacy != null) {
      return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Stack(children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
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
                          iconSize: 35,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Center(
                        child: Text(''),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                controller: _scrollController, // Attach the ScrollController
                // Wrap with SingleChildScrollView
                child: Stack(
                  children: [
                    Container(
                      height: 350,
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(children: [
                          SizedBox(height: 70.0),
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.serviceProviderPharmacy!.imageUrl),
                            radius: 50.0,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            widget.serviceProviderPharmacy!.name,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Rating: ${widget.serviceProviderPharmacy!.rating.toString()}',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 100.0),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 60),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      '${widget.serviceProviderPharmacy!.address}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.4,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.mail_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'serviceprovider@gmail.com',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      '9180055189',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                

                                SizedBox(height: 25.0),
                                Row(
                                  children: [
                                    Text(
                                      'Home Delivery: ${widget.serviceProviderPharmacy!.homeDeliveryAvailability}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                //add other details here

                                SizedBox(height: scrollValue)
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                    Positioned(
                      bottom: 24,
                      right: 16,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                30.0), // Set the border radius
                            border: Border.all(
                              color: Theme.of(context)
                                  .primaryColor, // Set the color of the additional border
                              width:
                                  3, // Adjust the width of the additional border as needed
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isButtonPressed = !isButtonPressed;
                                Future.delayed(Duration(milliseconds: 100), () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => LottieAnimationPage(),
                                    ),
                                  );
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
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                    color: isButtonPressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(160.0, 50.0)),
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
                              "Request Booking",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]));
    }
    else{
      return SizedBox.shrink(); 
      }
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 100,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
