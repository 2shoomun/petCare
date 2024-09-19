import 'package:flutter/material.dart';
import 'package:pet_care/main.dart';

void main() => runApp(ChatBotApp());

class ChatBotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: ChatBotScreen(),
    );
  }
}

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  TextEditingController messageController = TextEditingController();
  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0, 
          backgroundColor: Colors.transparent,
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
                    // Use Navigator to navigate back to loginPage.dart and RegistrationPage
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Center(
                child: Text(
                  'Customer Service',
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                _buildOptions(),
                ...messages,
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

 Widget _buildOptions() {
  return Column(
    children: [
      _buildOption("1. How do I cancel my service request?", "To cancel your service request, please follow these steps...\n1. Open the history tab on the app's home screen.\n2. Tap on pending requests.\n3. Tap on the request you wish to cancel.\n4. Tap on the cancel request button that appears."),
      _buildOption("2. How do I know if my request has been accepted/rejected?", "You will receive a message in your notification inbox which can be accessed by clicking on the bell icon on the app's home screen. You will also be notified by email when the service provider accepts/rejects your request."),
      Divider(height: 1, color: Colors.black), // Add a divider line
      Container(
        margin: EdgeInsets.all(16.0),
        child: Text(
          "Please select an option or describe your issue down below.",
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
        ),
      ),
    ],
  );
}


  Widget _buildOption(String text, String response) {
    return GestureDetector(
      onTap: () {
        _handleUserMessage(text, response);
      },
      child: ChatMessage(
        text: text,
        isUser: false,
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 24.0,left: 16.0,right: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor), // Change the color here
    ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.subdirectory_arrow_right_rounded,color: Theme.of(context).primaryColor,),
            onPressed: () {
              _handleUserMessage(messageController.text, "");
              messageController.clear();
            },
          ),
        ],
      ),
    );
  }

void _handleUserMessage(String message, String response) {
  if (message.isNotEmpty) {
    setState(() {
      messages.add(ChatMessage(
        text: message,
        isUser: true,
      ));
    });

    if (response.isEmpty) {
      // If the response is empty, send the standard message
      _handleResponse("Thank you for reaching out to us. We are in the process of connecting you to a customer service agent. Please hold for a moment, and someone will be with you shortly.");
    } else {
      // If there's a specific response, use that response
      _handleResponse(response);
    }
  }
}


  void _handleResponse(String response) {
    // Simulate bot thinking time
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        messages.add(ChatMessage(
          text: response,
          isUser: false,
        ));
      });
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      margin: EdgeInsets.only(left: 16.0,right: 16.0,bottom: 8.0,top: 8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isUser ? Theme.of(context).primaryColor : Colors.black.withOpacity(0.5),
        ),
        child: Text(text,style: TextStyle(color: Colors.white, height: 1.5,fontWeight: FontWeight.w400 // You can adjust this value to change line spacing
        ),),
      ),
    );
  }
}
