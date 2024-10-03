import 'package:flutter/material.dart';
import 'product.dart'; // Ensure this import is correct
import 'homeScreen.dart'; // Ensure this import is correct
import 'profileScreen.dart'; // Ensure this import is correct
import 'cart.dart'; // Ensure this import is correct

class BuyScreen extends StatefulWidget {
  final Product product;
  final int quantity;

  BuyScreen({required this.product, required this.quantity});

  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  int _currentQuantity = 1;
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(
              cartItems: [
                {
                  'name': widget.product.name,
                  'price': widget.product.price,
                  'quantity': _currentQuantity,
                }
              ],
            ),
          ),
        );
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
  void initState() {
    super.initState();
    _currentQuantity = widget.quantity;
  }

  void _incrementQuantity() {
    setState(() {
      _currentQuantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_currentQuantity > 1) {
        _currentQuantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Light Theme
    final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.orange[700],
    );

    // Dark Theme
    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.orange,
    );

    return Builder(
      builder: (context) {
        var currentTheme = Theme.of(context).brightness == Brightness.light
            ? lightTheme
            : darkTheme;

        return Theme(
          data: currentTheme,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'TI',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                ),
              ),
              centerTitle: true,
              backgroundColor: currentTheme.primaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    widget.product.imageUrl,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Product: ${widget.product.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Price per unit: RS ${widget.product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.orange,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: _decrementQuantity,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Quantity: $_currentQuantity',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _incrementQuantity,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            cartItems: [
                              {
                                'name': widget.product.name,
                                'price': widget.product.price,
                                'quantity': _currentQuantity,
                              }
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text('Confirm Order'),
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
                  icon: Icon(Icons.account_circle),
                  label: 'Account',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.orange,
              onTap: _onItemTapped,
            ),
          ),
        );
      },
    );
  }
}
