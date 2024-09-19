import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pet_care/chatbot.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/notification%20inbox.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petWalker.dart';
import 'package:pet_care/pages in pet owner homepage/petKeeper.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petSitter.dart';
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petTraveller.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/veterinary.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/petGroomer.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/pharmacy.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/foodSupplier.dart';
import 'dart:async';
import 'package:pet_care/pages in pet owner homepage/slidingbar.dart';
import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:pet_care/pages in pet owner homepage/choosePet.dart';

void main() => runApp(PetOwnerApp());

class PetOwnerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      theme: myTheme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTileIndex = -1;
  final PageController _pageController = PageController();
  int currentPageIndex = 0;
  bool isHomePage = true;

  double iconLeft = 16.0; // Initial left position
  double iconTop = 16.0; // Initial top position
  bool isChatOpen = false;
  bool isDragging = false;
  GlobalKey containerKey = GlobalKey();
  double containerX = 290.0; // Initial X position
  double containerY = 570.0; // Initial Y position

  String animationAsset = ''; // Declare and initialize the variable
  String serviceName = '';

  void toggleChat() {
    setState(() {
      isChatOpen = !isChatOpen;
    });
  }

  void onPageChanged(int pageIndex) {
    setState(() {
      currentPageIndex = pageIndex;
    });
  }

  Timer? _pageAutoScrollTimer;

  @override
  void initState() {
    super.initState();
    startAutoScroll(); // Start auto-scrolling when the widget is initialized
  }

  void startAutoScroll() {
    const scrollDuration = Duration(seconds: 9);
    _pageAutoScrollTimer = Timer.periodic(scrollDuration, (timer) {
      final nextPage = _pageController.page!.toInt() + 1;
      if (nextPage < carouselItems.length) {
        _pageController.animateToPage(nextPage,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _pageAutoScrollTimer
        ?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  final List<String> carouselItems = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  final List<String> services = [
    'Pet Walker',
    'Pet Sitter',
    'Pet Keeper',
    'Pet Traveller',
    'Veterinary',
    'Pet Groomer',
    'Pharmacy',
    'Food Supplier',
  ];

  void _navigateToServicePage(serviceName) {
    setState(() {
      isHomePage = false;
    });

    switch (serviceName) {
      case 'Pet Walker':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PetSelectionPage(serviceName)));
        break;
      case 'Pet Sitter':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PetSelectionPage(serviceName)));
        break;
      case 'Pet Keeper':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PetSelectionPage(serviceName)));
        break;
      case 'Pet Traveller':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PetSelectionPage(serviceName)));
        break;
      case 'Veterinary':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PetSelectionPage(serviceName)));
        break;
      case 'Pet Groomer':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PetSelectionPage(serviceName)));
        break;
      case 'Pharmacy':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PetSelectionPage(serviceName)));
        break;
      case 'Food Supplier':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PetSelectionPage(serviceName)));
        break;
      default:
        // Handle any other cases or errors here
        break;
    }
  }

  final Map<String, String> serviceDescriptions = {
    'Pet Walker':
        'Turn your pet\'s daily walk into a tail-wagging adventure! Pet walkers ensure your furry friend gets the exercise they crave while exploring the neighborhood.',
    'Pet Sitter':
        'Enjoy your time away worry-free! Pet sitters pamper your pet with love, playtime, and all the creature comforts, including gourmet meals and cuddle sessions.',
    'Pet Keeper': 'In a world full of adventures, when your beloved companion can'
        't always join,a pet keeper works their magic. Welcome to a lavish, loving haven for your pet while you'
        're away.',
    'Pet Traveller':
        'Say goodbye to pet travel stress! Pet travelers transport your beloved pet safely and comfortably to their destination, ensuring a smooth journey for both of you.',
    'Veterinary': 'Your pet'
        's health is our priority. Veterinarians provide top-notch medical care, from routine check-ups to life-saving treatments, ensuring your pet'
        's well-being.',
    'Pet Groomer':
        'Transform your pet into a furball of charm! Pet groomers work their magic to keep your pet looking and feeling their best, from luxurious baths to stylish trims.',
    'Pharmacy': 'We'
        've got the remedy for your pet'
        's needs! Pet pharmacies offer a wide range of medications and supplies, ensuring your pet'
        's health and happiness.',
    'Food Supplier': 'Delight your pet'
        's taste buds! Pet food suppliers provide a delectable selection of pet food and supplies, so your furry friend can dine like royalty.'
  };

  final Map<String, String> serviceAnimations = {
    'Pet Walker': 'assets/PetWalkerAnimation.json',
    'Pet Sitter': 'assets/PetSitterAnimation.json',
    'Pet Groomer': 'assets/PetGroomerAnimation.json',
    'Pet Keeper': 'assets/PetKeeperAnimation.json',
    'Food Supplier': 'assets/FoodSupplierAnimation.json',
    'Veterinary': 'assets/VeterinarianAnimation.json',
    'Pet Traveller': 'assets/PetTravellerAnimation.json',
    'Pharmacy': 'assets/PharmacyAnimation.json',
    // Add animations for other services
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: SafeArea(
        bottom:
            true, // Prevents the SafeArea padding from being applied to the bottom
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 48,
                            left: 16,
                            bottom: 16.0), // Adjust the padding as needed
                        child: Text(
                          'Hi John!',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 48,
                            right: 16,
                            bottom: 16.0), // Adjust the padding as needed
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => NotificationPage()));
                            // Handle the click event for the notification icon
                            // You can show a notification inbox or perform any other action here
                          },
                          child: Icon(
                            Icons.notifications, // Use your desired icon
                            size: 30,
                            color: Colors
                                .grey.shade800, // Customize the icon color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 150, // Adjust the height as needed
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: carouselItems.length,
                      itemBuilder: (context, index) {
  final random = Random(); // Create a random number generator
  return Entry.all(
    delay: Duration(milliseconds: random.nextInt(100)),
    child: CustomTileWidget(pageIndex: index),
  );
},
                      onPageChanged: onPageChanged,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(carouselItems.length, (index) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPageIndex == index
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 16, right: 16, bottom: 16),
                    child: Text(
                      'Choose a Service',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio:
                          0.8, // Adjust the aspect ratio to make tiles taller
                          
                    ),
                    
                    
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final serviceName = services[index];
                        final description = serviceDescriptions[serviceName];
                        bool isSelected = selectedTileIndex == index;
                        final rowIndex = index ~/ 3; // Assuming 3 columns
                        final delay = Duration(milliseconds: (50 * rowIndex));
                       return Entry.all(
                      delay: delay,
                      duration: Duration(milliseconds: 100),
                      child:
                        
                         SingleChildScrollView(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTapDown: (_) {
                                      setState(() {
                                        selectedTileIndex = index;
                                      });

                                      // Automatically reset the selectedTileIndex after 1 second
                                      Future.delayed(
                                          Duration(milliseconds: 200), () {
                                        setState(() {
                                          selectedTileIndex = -1;
                                        });
                                      });
                                      Future.delayed(
                                          Duration(milliseconds: 100), () {
                                        _navigateToServicePage(serviceName);
                                        // Navigate to the corresponding page
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Theme.of(context).primaryColor
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            offset: isSelected
                                                ? Offset(-1, -1)
                                                : Offset(1.5, 1.5),
                                            blurRadius: 1.0,
                                            spreadRadius: 0.5,
                                          ),
                                          BoxShadow(
                                            color: Colors.white,
                                            offset: isSelected
                                                ? Offset(-0.5, -0.5)
                                                : Offset(1.0, 1.0),
                                            blurRadius: 1.0,
                                            spreadRadius: 0.5,
                                          ),
                                        ],
                                      ),
                                      // Adjust the height of the container here
                                      height: 90.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Center(
                                              child: Container(
                                                width:
                                                    70.0, // Adjust the width as needed
                                                height:
                                                    80.0, // Adjust the height as needed
                                                padding: EdgeInsets.all(4.0),
                                                child: Image.asset(
                                                  'assets/${serviceName.toLowerCase()}_icon.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(-1.3, -3.0),
                                    child: IconButton(
                                      icon: Icon(Icons.info),
                                      iconSize: 20,
                                      color: Colors.grey.withOpacity(0.8),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            final animationAsset =
                                                serviceAnimations[
                                                        serviceName] ??
                                                    'default_animation_path';
                                            return AlertDialog(
                                              title: Text(
                                                serviceName,
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'avenir'),
                                                textAlign: TextAlign.center,
                                              ),
                                              content: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    if (serviceName ==
                                                        'Pet Groomer')
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(70),
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        child: Lottie.asset(
                                                          animationAsset,
                                                          width: 500,
                                                          height: 150,
                                                        ),
                                                      )
                                                    else
                                                      Lottie.asset(
                                                        animationAsset,
                                                        width: 150,
                                                        height: 150,
                                                      ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      description!,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Close',
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .secondaryHeaderColor),
                                                  ),
                                                ),
                                              ],
                                              backgroundColor: Colors.white,
                                              elevation: 5.0,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Text(
                                    serviceName,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15.0,
                                      fontWeight: isSelected
                                          ? FontWeight.w900
                                          : FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                      },
                      childCount: services.length,
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              left: containerX,
              top: containerY,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    containerX += details.delta.dx;
                    containerY += details.delta.dy;
                  });
                },
                child: OpenContainer(
                  key: containerKey,
                  closedElevation: 5.0,
                  closedShape: CircleBorder(),
                  transitionType: ContainerTransitionType.fadeThrough,
                  closedColor: Colors.white,
                  closedBuilder:
                      (BuildContext context, VoidCallback openContainer) {
                    return GestureDetector(
                      onTap: openContainer,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.chat_rounded,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                    );
                  },
                  openBuilder: (BuildContext context, VoidCallback _) {
                    return ChatBotScreen();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTileWidget extends StatefulWidget {
  final int pageIndex; // Add a pageIndex parameter
  CustomTileWidget({required this.pageIndex});

  @override
  _CustomTileWidgetState createState() => _CustomTileWidgetState();
}

class _CustomTileWidgetState extends State<CustomTileWidget> {
  int userRating = 0; // User's selected rating
  List<bool> highlightedStars = [false, false, false, false, false];
  bool ratingSubmitted = false;
  bool isButtonPressed = false;

  // Function to handle the submission of the rating
  void onRating() {
    // Set the highlightedStars based on the userRating
    for (int i = 0; i < highlightedStars.length; i++) {
      highlightedStars[i] = i < userRating;
    }
  }

  void submitRating() {
    // You can use userRating here to submit the selected rating
    // For example, you can send it to a server or store it locally.
    print('Submitted Rating: $userRating');

    // Update the ratingSubmitted flag and call setState to update the UI
    setState(() {
      ratingSubmitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = widget.pageIndex;
    
    if (pageIndex == 0) {
      return GestureDetector(
        onTap: () => setState(() {
          isButtonPressed = !isButtonPressed;
        }),
        child: Stack(children: [
          Container(
            margin: EdgeInsets.all(12.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 14, 54, 102),
                  Color.fromARGB(255, 71, 125, 207),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400, // Shadow color
              offset: Offset(0, 4), // Shadow position
              blurRadius: 5, // Shadow blur radius
              spreadRadius: 2, // Shadow spread radius
            ),
          ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        'https://www.metlifepetinsurance.com/content/dam/metlifecom/us/metlifepetinsurance/images/blog/Dog-Breeds/maltese-inline-image.webp',
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'It'
                          's been 5 months since \nMuffin'
                          's grooming session.',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Book another now!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 18.0, // Adjust this value to control the button's position
            right: 20.0, // Adjust this value to control the button's position
            child: AnimatedContainer(
              duration: Duration(milliseconds: 40),
              child: Container(
                height: 35,
                width: 115,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(30.0), // Set the border radius
                  border: Border.all(
                    color: Colors
                        .transparent, // Set the color of the additional border
                    width:
                        2.5, // Adjust the width of the additional border as needed
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isButtonPressed = !isButtonPressed;
                      Future.delayed(Duration(milliseconds: 150), () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PetSelectionPage('Pet Groomer')));
                        setState(() {
                          isButtonPressed = !isButtonPressed;
                        });
                      });
                    });
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                      isButtonPressed ? Colors.transparent : Colors.white,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      isButtonPressed
                          ? Colors.white
                          : Color.fromARGB(255, 76, 116, 175),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(
                          color: isButtonPressed
                              ? Colors.transparent
                              : Colors.white,
                          width: 1.5,
                        ),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(134.0, 45.0)),
                    //remove inksplash effect
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
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
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      );
    }
    if (pageIndex == 1) {
      return Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 17, 113, 16),
              Color.fromARGB(255, 90, 211, 94)
            ], // You can specify your desired colors
            begin:
                Alignment.topLeft, // Adjust the start and end points as needed
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400, // Shadow color
              offset: Offset(0, 4), // Shadow position
              blurRadius: 5, // Shadow blur radius
              spreadRadius: 2, // Shadow spread radius
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      'https://parade.com/.image/t_share/MTk0OTUwMjMyODE4MDY2OTY4/gabriel-feitosa.png'), // Example image URL
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How was the recent \nPet Sitter Service?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      maxLines: 2, // Set the maximum number of lines
                      overflow:
                          TextOverflow.ellipsis, // Define the overflow behavior
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Mark Jason', // Example service type
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Text('Rating: ',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                        Row(
                          children: List.generate(
                            5,
                            (index) {
                              final star = index + 1;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    userRating = star;
                                    onRating(); // Call submitRating when a star is tapped
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  size: 20,
                                  color: highlightedStars[index]
                                      ? Theme.of(context).secondaryHeaderColor
                                      : Colors.grey.shade300,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            if (userRating > 0 && !ratingSubmitted) ...{
              Padding(
                padding: EdgeInsets.only(bottom: 0.0, right: 6.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      // Handle rating submission by calling the submitRating function
                      submitRating();
                      setState(() {
                        ratingSubmitted = true;
                      });
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              )
            }
          ],
        ),
      );
    }
    if (pageIndex == 2) {
      return GestureDetector(
        onTap: () => setState(() {
          isButtonPressed = !isButtonPressed;
        }),
        child: Stack(children: [
          Container(
            margin: EdgeInsets.all(12.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 70, 14, 102),
                  Color.fromARGB(255, 175, 76, 167),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400, // Shadow color
              offset: Offset(0, 4), // Shadow position
              blurRadius: 5, // Shadow blur radius
              spreadRadius: 2, // Shadow spread radius
            ),
          ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        'https://lafeber.com/pet-birds/wp-content/uploads/2018/06/Eclectus.jpg',
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Buy medicines for Buddy'
                          's \nrecent veterinarian visit.',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Explore the pharmacy section!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 18.0, // Adjust this value to control the button's position
            right: 20.0, // Adjust this value to control the button's position
            child: AnimatedContainer(
              duration: Duration(milliseconds: 40),
              child: Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(30.0), // Set the border radius
                  border: Border.all(
                    color: Colors
                        .transparent, // Set the color of the additional border
                    width:
                        2.5, // Adjust the width of the additional border as needed
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isButtonPressed = !isButtonPressed;
                      Future.delayed(Duration(milliseconds: 150), () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => PharmacyPage()));
                        setState(() {
                          isButtonPressed = !isButtonPressed;
                        });
                      });
                    });
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                      isButtonPressed ? Colors.transparent : Colors.white,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      isButtonPressed
                          ? Colors.white
                          : Color.fromARGB(255, 175, 76, 167),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(
                          color: isButtonPressed
                              ? Colors.transparent
                              : Colors.white,
                          width: 1.5,
                        ),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(100.0, 45.0)),
                    //remove inksplash effect
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.transparent;
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  child: Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      );
    } else {
      return Container();
    }
  }
}

