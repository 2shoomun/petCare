import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0; // Index of the selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add horizontal spacing
            child: Center(
              child: ToggleButtons(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // Add spacing
                    child:
                        Text('Current Request', style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // Add spacing
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
                selectedColor: Colors.blue,
                fillColor: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 16.0), // Add spacing
          Expanded(
            child: _selectedTabIndex == 0
                ? Center(
                    child: Text('Current Requests Content'),
                  )
                : Center(
                    child: Text('History Content'),
                  ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}