import 'package:flutter/material.dart';
import 'product.dart'; // Import the Product class
import 'productDescription.dart'; // Import the ProductDescription class
import 'homeScreen.dart'; // Import HomePage
import 'profileScreen.dart'; // Import ProfileScreen
import 'cart.dart'; // Import CartScreen

final List<Product> products = [
  Product(name: 'Power Saw', imageUrl: 'assets/images/product1.jpg', price: 12249.99),
  Product(name: 'Corded Drill', imageUrl: 'assets/images/product2.jpg', price: 13229.99),
  Product(name: 'Jigsaw', imageUrl: 'assets/images/product3.jpg', price: 23139.99),
  Product(name: 'Router', imageUrl: 'assets/images/product4.jpg', price: 14519.99),
  Product(name: 'Sander', imageUrl: 'assets/images/product5.jpg', price: 15559.99),
  Product(name: 'Grinder', imageUrl: 'assets/images/product6.jpg', price: 17679.99),
  Product(name: 'Hilti', imageUrl: 'assets/images/product7.jpg', price: 19999.99),
];

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _selectedIndex = 0; // Index of the selected item in bottom navigation
  List<Map<String, dynamic>> cartItems = []; // Sample cart items (can be passed dynamically)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      // Navigate to CartScreen when the cart icon is selected
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen(cartItems: cartItems)),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()), // Navigate to ProfileScreen
      );
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

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
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
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDescription(product: products[index]),
                  ),
                );
              },
              child: buildProductItem(products[index]),
            );
          },
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
      ),
    );
  }

  Widget buildProductItem(Product product) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
