import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobileappdevelopment/screens/profileScreen.dart';

import 'homeScreen.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  late GoogleMapController mapController;
  LatLng? _currentLocation; // Variable to store current location
  int _selectedIndex = 1; // Set the default index to Cart

  void _onItemTapped(int index) {
    // Navigate to different screens based on the selected index
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Go to Home Page
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()), // Go to Profile Screen
      );
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Fetch the current location when the page loads
  }

  Future<void> _getCurrentLocation() async {
    // Check for location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle permission denied case
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get current location
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });

    // Move the camera to the user's location
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentLocation!,
          zoom: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TI', // Title of the app bar
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30, // Adjust font size as needed
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[700], // AppBar color
      ),
      body: _currentLocation == null
          ? Center(child: CircularProgressIndicator()) // Show a loading indicator while fetching location
          : GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _currentLocation!,
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId('current_location'),
            position: _currentLocation!, // Set the marker to the current location
          ),
        },
      ),
      bottomNavigationBar:
          BottomNavigationBar(
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NewPage(), // Set NewPage as the home widget
  ));
}
