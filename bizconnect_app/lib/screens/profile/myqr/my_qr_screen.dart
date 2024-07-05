import 'package:flutter/material.dart';

class MyQRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My QR Code'),
      ),
      body: Center(
        child: Text('This is your QR code!'), // Replace with your QR code widget
      ),
    );
  }
}