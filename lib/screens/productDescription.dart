import 'package:flutter/material.dart';
import 'product.dart'; // Import the Product class
import 'buyScreen.dart'; // Import the BuyScreen class
import 'profileScreen.dart'; // Import the ProfileScreen class
import 'homeScreen.dart'; // Import the HomePage class
import 'cart.dart';

class ProductDescription extends StatefulWidget {
  final Product product;

  ProductDescription({required this.product});

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
      // Navigate to the Cart screen
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    // Define light theme
    ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.orange[700],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.orange[700],
      ),
    );

    // Define dark theme
    ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.orange[700],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.orange[700],
      ),
    );

    var currentTheme = isDarkMode ? darkTheme : lightTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text(
          'TI', // Set app bar title to 'TI'
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 50.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Use the back arrow icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              widget.product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image.asset(
              widget.product.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'RS ${widget.product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• Islandwide Delivery within 48 to 72 hours',
                    style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Pay cash on delivery within Colombo & Suburbs',
                    style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Authorized reseller warranty',
                    style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Expert advice on call',
                    style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to BuyScreen when Buy Now button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuyScreen(
                      product: widget.product,
                      quantity: 1,
                    ),
                  ),
                );
              },
              child: Text('Buy Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
