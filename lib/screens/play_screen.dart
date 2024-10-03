import 'package:flutter/material.dart';


class PlayScreen extends StatelessWidget {
  const PlayScreen ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text("Play screen"),
      ),

    );
  }
}