import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_care/pages%20in%20service%20provider%20homepage/paymentSuccessAnimationForNewService.dart';
import 'paymentSuccessAnimationforNewPet.dart';
import 'addAnotherPet.dart';
import 'package:pet_care/pages in service provider homepage/addAnotherService.dart';

void main() {
  runApp(PetCareApp());
}

class PetCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetCare Payment',
      home: PaymentPagePet(),
    );
  }
}

class PaymentPagePet extends StatefulWidget {
  @override
  _PaymentPagePetState createState() => _PaymentPagePetState();
}

class _PaymentPagePetState extends State<PaymentPagePet> {
  int pets = PetCount.numberOfRegisteredPets;
  double totalAmount = 0.0;
  String paymentMethod = 'Credit/Debit Card';
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();

  void updateTotalAmount() {
    // Calculate the total price based on the number of pets registered.
    // You can define your pricing logic here.
    // For example, if the price per pet is $20:
    totalAmount = pets * 20.0;
  }

  @override
  void initState() {
    super.initState();
    updateTotalAmount(); // Calculate the initial totalAmount
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set the scaffold background color to white
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor:
              Colors.white, // Set the app bar background color to white
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
                  'PetCARE Payment',
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Number of Pets Registered:',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87), // Use your custom color here),
            ),
            SizedBox(height: 12),
            Text(
              pets.toString(),
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87), // Use your custom color here),
            ),
            SizedBox(height: 20),
            Text(
              'Total Price: $pets x \$20 = \$$totalAmount',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87), // Use your custom color here),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Payment Method:'),
                SizedBox(
                    width: 8), // Add some spacing between text and dropdown
                Container(
                  width: 150, // Adjust the width as needed
                  child: DropdownButton<String>(
                    value: paymentMethod,
                    onChanged: (String? newValue) {
                      setState(() {
                        paymentMethod = newValue!;
                      });
                    },
                    items: <String>['Credit/Debit Card', 'UPI']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (paymentMethod == 'Credit/Debit Card')
              Column(
                children: [
                  TextFormField(
                    controller: cardNumberController,
                    decoration: InputDecoration(labelText: 'Card Number'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          16), // Limit to 16 characters
                      CardNumberInputFormatter(), // Format as XXXX-XXXX-XXXX-XXXX
                    ],
                  ),
                  TextFormField(
                    controller: expiryDateController,
                    decoration:
                        InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          4), // Limit to 4 characters
                      ExpiryDateInputFormatter(), // Format as MM/YY
                    ],
                  ),
                  TextFormField(
                    controller: cvvController,
                    decoration: InputDecoration(labelText: 'CVV'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          3), // Limit to 3 characters
                    ],
                  ),
                ],
              )
            else
              TextFormField(
                controller: upiIdController,
                decoration: InputDecoration(labelText: 'UPI ID'),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LottieAnimationPaymentPet()),
                );
                // Add payment processing logic here.
                // You can use a payment gateway or service for this.
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context)
                      .primaryColor, // Set the background color to secondary header color
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.white, // Set the text color to white
                ),

                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Set the border radius
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                    Size(100.0, 45.0)), // Set the minimum button size
              ),
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text =
        newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits
    final formattedText = _formatCardNumber(text);
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatCardNumber(String input) {
    final buffer = StringBuffer();
    for (var i = 0; i < input.length; i++) {
      if (i % 4 == 0 && i > 0) {
        buffer.write('-');
      }
      buffer.write(input[i]);
    }
    return buffer.toString();
  }
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text =
        newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits
    final formattedText = _formatExpiryDate(text);
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatExpiryDate(String input) {
    if (input.length > 2) {
      return input.substring(0, 2) + '/' + input.substring(2);
    } else {
      return input;
    }
  }
}

class PaymentPageService extends StatefulWidget {
  @override
  _PaymentPageServiceState createState() => _PaymentPageServiceState();
}

class _PaymentPageServiceState extends State<PaymentPageService> {
  int services = ServiceCount.numberOfRegisteredServices;
  double totalAmount = 0.0;
  String paymentMethod = 'Credit/Debit Card';
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();

  void updateTotalAmount() {
    // Calculate the total price based on the number of services  registered.
    // You can define your pricing logic here.
    // For example, if the price per service is $20:
    totalAmount = services * 20.0;
  }

  @override
  @override
  void initState() {
    super.initState();
    updateTotalAmount(); // Calculate the initial totalAmount
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set the scaffold background color to white
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor:
              Colors.white, // Set the app bar background color to white
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
                  'PetCARE Payment',
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Number of Services Registered:',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87), // Use your custom color here),
            ),
            SizedBox(height: 12),
            Text(
              services.toString(),
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87), // Use your custom color here),
            ),
            SizedBox(height: 20),
            Text(
              'Total Price: $services x \$20 = \$$totalAmount',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87), // Use your custom color here),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Payment Method:'),
                SizedBox(
                    width: 8), // Add some spacing between text and dropdown
                Container(
                  width: 150, // Adjust the width as needed
                  child: DropdownButton<String>(
                    value: paymentMethod,
                    onChanged: (String? newValue) {
                      setState(() {
                        paymentMethod = newValue!;
                      });
                    },
                    items: <String>['Credit/Debit Card', 'UPI']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (paymentMethod == 'Credit/Debit Card')
              Column(
                children: [
                  TextFormField(
                    controller: cardNumberController,
                    decoration: InputDecoration(labelText: 'Card Number'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          16), // Limit to 16 characters
                      CardNumberInputFormatter(), // Format as XXXX-XXXX-XXXX-XXXX
                    ],
                  ),
                  TextFormField(
                    controller: expiryDateController,
                    decoration:
                        InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          4), // Limit to 4 characters
                      ExpiryDateInputFormatter(), // Format as MM/YY
                    ],
                  ),
                  TextFormField(
                    controller: cvvController,
                    decoration: InputDecoration(labelText: 'CVV'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          3), // Limit to 3 characters
                    ],
                  ),
                ],
              )
            else
              TextFormField(
                controller: upiIdController,
                decoration: InputDecoration(labelText: 'UPI ID'),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LottieAnimationPaymentService()),
                );
                // Add payment processing logic here.
                // You can use a payment gateway or service for this.
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context)
                      .primaryColor, // Set the background color to secondary header color
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.white, // Set the text color to white
                ),

                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Set the border radius
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                    Size(100.0, 45.0)), // Set the minimum button size
              ),
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
