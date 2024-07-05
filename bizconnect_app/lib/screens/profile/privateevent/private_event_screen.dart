import 'package:flutter/material.dart';

class PrivateEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Private Event'),
      ),
      body: Center(
        child: Text('This is your Private Event!'),
      ),
    );
  }
}