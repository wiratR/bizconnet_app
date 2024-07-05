import 'package:flutter/material.dart';

class MyTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Ticket'),
      ),
      body: Center(
        child: Text('This is your My Ticket!'),
      ),
    );
  }
}