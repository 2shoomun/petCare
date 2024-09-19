import 'package:flutter/material.dart';
import 'package:pet_care/main.dart';
import 'serviceProviderProfilePage.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    theme: myTheme,
    home: HomeScreen(),
    scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;

  List<Map<String, String>> pendingRequests = [
    {
      'petOwner': 'John Doe',
      'petName': 'Pets: Buddy (Bird), Muffin (Dog)',
      'email': 'Email Id: john.doe@example.com',
      'mobile': 'Mobile: +1 123-456-7890',
      'requestTime': '2023-04-23 08:00',
    },
    {
      'petOwner': 'Jane Smith',
      'petName': 'Pets: Fluffy (Cat)',
      'email': 'Email Id: jane.smith@example.com',
      'mobile': 'Mobile: +1 987-654-3210',
      'requestTime': '2023-04-20 23:00',
    },
    {
      'petOwner': 'Sarah Johnson',
      'petName': 'Pets: Max (Parrot)',
      'email': 'Email Id: sarah.johnson@example.com',
      'mobile': 'Mobile: +1 567-890-1234',
      'requestTime': '2023-04-19 09:00',
    },
    {
      'petOwner': 'Michael Wilson',
      'petName': 'Pets: Luna (Rabbit)',
      'email': 'Email Id: michael.wilson@example.com',
      'mobile': 'Mobile: +1 234-567-8901',
      'requestTime': '2023-04-18 09:41',
    },
    {
      'petOwner': 'Emily Brown',
      'petName': 'Pets: Leo (Fish)',
      'email': 'Email Id: emily.brown@example.com',
      'mobile': 'Mobile: +1 345-678-9012',
      'requestTime': 'Time of Request: 2023-05-18 08:00',
    },
    // {
    //   'petOwner': 'Jian Yang',
    //   'petName': 'Pets: Brownie (Dog)',
    //   'email': 'Email Id: jianyang@example.com',
    //   'mobile': 'Mobile: +1 345-678-9012',
    //   'Time of Request': '2023-05-17 15:00',
    // },
    // Add three more entries with 'serviceTime'
  ];

  List<bool> acceptStatus = List.generate(5, (_) => false);
  List<bool> rejectStatus = List.generate(5, (_) => false);

  List<String> servicesProvidedInHistory = [
    'Jack Barker\nService: Pet Walking\nTime: 2023-04-12 08:00\nAccepted',
    'Gavin Belson\nService: Pet Grooming\nTime: 2023-04-05 18:00\nAccepted',
    'Gilfoyle Bertram\nService: Pet Boarding\nTime: 2023-03-10 20:00\nRejected',
    'Dinesh Chugtai\nService: Pet Sitting\nTime: 2023-02-25 09:00\nAccepted',
    'Richard Hencdricks\nService: Canceled Service 1\nTime: 2023-01-15 10:00(Canceled)',
    'Peter Parker\nService: Canceled Service 2\nTime: 2023-01-12 21:00(Canceled)',
    // Add more canceled service entries
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Remove the back icon
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Align the content to the start and end
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 48.0, bottom: 16.0), // Add left padding
              child: Text(
                'Hi John!',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 40.0,
                  bottom: 16.0,
                  right: 16.0), // Add left padding
              child: IconButton(
                icon: Icon(
                  Icons.person_rounded,
                  size: 30,
                  color: Colors.grey.shade800,
                ),
                onPressed: () {
                  Navigator.push(
                    // Use Navigator to navigate to the ProfilePage
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                  // Handle the click event for the notification icon
                  // You can show a notification inbox or perform any other action here
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Center(
              child: ToggleButtons(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Pending Requests',
                        style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('History', style: TextStyle(fontSize: 16)),
                  ),
                ],
                isSelected: [_selectedTabIndex == 0, _selectedTabIndex == 1],
                onPressed: (int index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
                color: Colors.grey,
                selectedColor: Theme.of(context).primaryColor,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: _selectedTabIndex == 0
                ? ListView.builder(
                    itemCount: pendingRequests.length,
                    itemBuilder: (context, index) {
                      final request = pendingRequests[index];
                      final petOwnerName = request['petOwner'];
                      final petName = request['petName'];
                      final email = request['email'];
                      final mobile = request['mobile'];
                      final requestTime = request['requestTime'];
                      final details = _getDetails(request);

                      // Determine the background color based on accept/reject status
                      final backgroundColor = acceptStatus[index]
                          ? Colors.green
                          : (rejectStatus[index] ? Colors.red : Colors.white);

                      return Card(
                          margin: EdgeInsets.all(12.0),
                          color: backgroundColor,
                          elevation: 3,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0), // Add padding here
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Set the border radius for the ExpansionTile
                              child: ExpansionTile(
                                backgroundColor: Colors.white,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      petOwnerName ?? '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      petName ?? '',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: acceptStatus[index] ||
                                                rejectStatus[index]
                                            ? Colors.black
                                            : Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Visibility(
                                      visible: !acceptStatus[index] &&
                                          !rejectStatus[index],
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.check,
                                          size: 30,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          // Accept the request
                                          setState(() {
                                            acceptStatus[index] = true;
                                            rejectStatus[index] = false;
                                          });

                                          // Show a Snackbar message for acceptance
                                          final scaffoldMessenger =
                                              ScaffoldMessenger.of(context);
                                          scaffoldMessenger
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                '$petOwnerName\'s request has been accepted.'),
                                            duration: Duration(
                                                seconds:
                                                    2), // Set the duration to 2 seconds
                                          ));
                                        },
                                      ),
                                    ),
                                    Visibility(
                                      visible: !acceptStatus[index] &&
                                          !rejectStatus[index],
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 30,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          // Reject the request
                                          setState(() {
                                            acceptStatus[index] = false;
                                            rejectStatus[index] = true;
                                          });

                                          // Show a Snackbar message for rejection
                                          final scaffoldMessenger =
                                              ScaffoldMessenger.of(context);
                                          scaffoldMessenger
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                '$petOwnerName\'s request has been rejected.'),
                                            duration: Duration(
                                                seconds:
                                                    2), // Set the duration to 2 seconds
                                          ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                children: [
                                  ListTile(
                                    title: Text(email ?? ''),
                                  ),
                                  ListTile(
                                    title: Text(mobile ?? ''),
                                  ),
                                  ListTile(
                                    title: Text(requestTime ?? ''),
                                  ),
                                  ListTile(
                                    title: Text(details ?? ''),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                  )
                : ListView.builder(
                    itemCount: servicesProvidedInHistory.length,
                    itemBuilder: (context, index) {
                      final service = servicesProvidedInHistory[index];

                      // Determine the text color for canceled services
                      final textColor = service.contains('(Canceled')
                          ? Colors.grey
                          : Colors.black;

                      // Split the service details
                      final serviceDetails = service.split('\n');

                      return Card(
                          margin: EdgeInsets.all(12.0),
                          color: Colors.white,
                          elevation: 3,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Set the border radius here
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0), // Add padding here

                            child: ListTile(
                              title: Text(
                                serviceDetails[0], // Service description
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    serviceDetails[1], // service type
                                    style: TextStyle(
                                      color:
                                          textColor, // Set the color for the date text
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    serviceDetails[2], // Date
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  if (serviceDetails.length > 3)
                                    Text(
                                      serviceDetails[3], // Additional Detail 2
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  // Add more Text widgets for additional details as needed
                                ],
                              ),
                            ),
                          ));
                    },
                  ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Handle the customer support icon tap
      //   },
      //   backgroundColor: Color(0xFFff6500),
      //   child: Icon(
      //     Icons.chat,
      //     color: Colors.white,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  String? _getDetails(Map<String, String> request) {
    // Add custom logic to extract additional details from the request
    return request['details'];
  }
}
