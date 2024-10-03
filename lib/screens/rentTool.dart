import 'package:flutter/material.dart';
import 'homeScreen.dart'; // Import HomePage
import 'product.dart'; // Import Product class
import 'rent_shop.dart'; // Import Rent Shop Page

class RentToolScreen extends StatefulWidget {
  const RentToolScreen({super.key});

  @override
  _RentToolScreenState createState() => _RentToolScreenState();
}

class _RentToolScreenState extends State<RentToolScreen> {
  int _selectedIndex = 0; // Index of the selected item in bottom navigation

  // Sample product data
  final List<Product> products = [
    Product(name: 'Power Saw', imageUrl: 'assets/images/product1.jpg', price: 12249.99),
    Product(name: 'Corded Drill', imageUrl: 'assets/images/product2.jpg', price: 13229.99),
    Product(name: 'Jigsaw', imageUrl: 'assets/images/product3.jpg', price: 23139.99),
    Product(name: 'Router', imageUrl: 'assets/images/product4.jpg', price: 14519.99),
    Product(name: 'Sander', imageUrl: 'assets/images/product5.jpg', price: 15559.99),
    Product(name: 'Grinder', imageUrl: 'assets/images/product6.jpg', price: 17679.99),
    Product(name: 'Hilti', imageUrl: 'assets/images/product7.jpg', price: 19999.99),
  ];

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
      // Navigate to the Profile screen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text(
          'TI',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 50.0,
          ),
        ),
        centerTitle: true,
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
      body: Column(
        children: [
          SizedBox(height: 0), // Adds space between the AppBar and the image
          Container(
            height: 300, // Height of the image container
            width: double.infinity, // Full width of the screen
            child: Image.asset(
              'assets/images/toooll.png', // Path to your image asset
              fit: BoxFit.cover, // Scales the image to cover the container
            ),
          ),
          SizedBox(height: 10), // Space between the image and the text
          Text(
            'Your Renting Partner..',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Customize the color as needed
            ),
          ),
          SizedBox(height: 30), // Space between the text and the grid
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8.0, // Horizontal space between items
                mainAxisSpacing: 8.0, // Vertical space between items
                childAspectRatio: 0.75, // Adjusted ratio for smaller boxes
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    // Handle item tap if needed
                  },
                  child: Card(
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12, // Adjusted font size
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                          child: Text(
                            'RS ${product.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 10, // Adjusted font size
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0), // Add padding around the button
            child: SizedBox(
              width: double.infinity, // Full width of the button
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the Rent Shop page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewPage()), // Change this to your RentShop page
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700], // Button color
                  padding: EdgeInsets.symmetric(vertical: 15.0), // Button padding
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('See Your Current Location'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
