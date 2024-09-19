import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  final String id;
  String name;
  String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });
}

class Pet {
  final String id;
  String name;
  String breed;

  Pet({
    required this.id,
    required this.name,
    required this.breed,
  });
}

class MyApp extends StatelessWidget {
  final User user = User(id: '1', name: 'John Doe', email: 'johndoe@example.com');
  final List<Pet> pets = [
    Pet(id: '1', name: 'Buddy', breed: 'Labrador'),
    Pet(id: '2', name: 'Fluffy', breed: 'Persian Cat'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(user: user, pets: pets),
    );
  }
}

class ProfilePage extends StatefulWidget {
  final User user;
  final List<Pet> pets;

  ProfilePage({required this.user, required this.pets});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void editUserDetails() {
    // Implement editing user details here.
    // You can use a dialog or a separate screen for editing.
  }

  void addPet() {
    // Implement adding a new pet here.
    setState(() {
      widget.pets.add(Pet(id: '3', name: 'New Pet', breed: 'Unknown'));
    });
  }

  void removePet(int index) {
    // Implement removing a pet here.
    setState(() {
      widget.pets.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Name: ${widget.user.name}'),
            onTap: editUserDetails,
          ),
          ListTile(
            title: Text('Email: ${widget.user.email}'),
            onTap: editUserDetails,
          ),
          ListTile(
            title: Text('My Pets'),
          ),
          for (int i = 0; i < widget.pets.length; i++)
            ListTile(
              title: Text('${widget.pets[i].name} (${widget.pets[i].breed})'),
              onTap: () {
                // Implement editing pet details here.
              },
              onLongPress: () => removePet(i),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addPet,
        child: Icon(Icons.add),
      ),
    );
  }
}
