import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pendingRequests.dart'; // Import the pending requests page
import 'bookingHistory.dart'; // Import the booking history page
import 'package:pet_care/main.dart';
import 'dart:ui';

void main() {
  runApp(History());
}

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
        theme: myTheme,
        home: Scaffold(
          body: SafeArea(
            bottom: true,
            child: Center(
              child: SegmentedControlDemo(),
            ),
          ),
        ));
  }
}

class SegmentedControlDemo extends StatefulWidget {
  @override
  _SegmentedControlDemoState createState() => _SegmentedControlDemoState();
}

class _SegmentedControlDemoState extends State<SegmentedControlDemo> {
  int segmentedControlGroupValue = 0;

  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("History"),
    1: Text("Pending Requests"),
  };

  final List<Widget> pages = [BookingHistoryPage(), PendingRequestsPage()];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(
                top: 56.0, bottom: 16.0),
            child: CupertinoSlidingSegmentedControl(
              groupValue: segmentedControlGroupValue,
              children: myTabs.map((key, value) {
                return MapEntry(
                  key,
                  DefaultTextStyle(
                    style: key == segmentedControlGroupValue
                        ? TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )
                        : TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    child: value,
                  ),
                );
              }),
              onValueChanged: (int? i) {
                setState(() {
                  segmentedControlGroupValue = i ?? 0;
                });
              },
              thumbColor: Colors.white,
              backgroundColor: Colors.grey.shade200,
            )),
        Expanded(child: pages[segmentedControlGroupValue]),
      ],
    );
  }
}
