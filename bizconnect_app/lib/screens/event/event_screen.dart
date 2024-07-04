import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Event'),
      ),
      body: Center(
        child: Text('My Event Screen Content'),
      ),
    );
  }
}
