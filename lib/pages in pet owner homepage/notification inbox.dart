import 'package:flutter/material.dart';
import 'package:pet_care/main.dart';
import 'package:pet_care/pages%20in%20pet%20owner%20homepage/choosePet.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(NotificationPage());
}

class NotificationPage extends StatelessWidget {
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
        body: NotificationList(),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace these with actual data or a data source.
    List<NotificationItem> notifications = [
      NotificationItem('Eva Martinez', 'Pet Walker', true),
      NotificationItem('Sebastian Stan', 'Pet Groomer', false),
    ];

    return ListView.builder(
      itemCount: notifications.length + 1, // +1 for the heading
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.only(top: 16.0, left: 24.0, right: 16.0, bottom: 16.0),
            child: Text(
              'Inbox',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          NotificationItem notification = notifications[index - 1];
          return NotificationTile(notification: notification);
        }
      },
    );
  }
}
class NotificationItem {
  final String serviceProvider;
  final String serviceName;
  final bool accepted;

  NotificationItem(this.serviceProvider, this.serviceName, this.accepted);
}



class NotificationTile extends StatelessWidget {
  final NotificationItem notification;

  NotificationTile({required this.notification});

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.jm().format(DateTime.timestamp());

    return Container(
      margin: EdgeInsets.only(right: 16.0, left: 16.0,top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(top:8.0,right: 16.0, bottom: 8.0, left: 16.0),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: '${notification.serviceProvider}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                TextSpan(
                  text: ' has ',
                  style: TextStyle(fontSize: 16.0),
                ),
                TextSpan(
                  text: notification.accepted ? 'accepted' : 'rejected',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                TextSpan(
                  text: ' your ',
                  style: TextStyle(fontSize: 16.0),
                ),
                TextSpan(
                  text: '${notification.serviceName}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                TextSpan(
                  text: ' service request.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
        subtitle: notification.accepted
            ? Text(
                '${notification.serviceProvider} will be in touch with you shortly to provide further details.')
            : GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PetSelectionPage(notification.serviceName)),
                  );
                  // Add the action you want when the tile is tapped for a different service provider.
                },
                child: Text(
                  'Tap here to request a different service provider',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
        // Add the date and time at the bottom right
        trailing: Text(
          formattedTime,
          style: TextStyle(
            fontSize: 12.0, // You can adjust the font size
            color: Colors.grey, // You can adjust the color
          ),
        ),
      ),
    );
  }
}