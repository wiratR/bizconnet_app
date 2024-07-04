import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite'),
      ),
      body: Center(
        child: Text('My Favorite Screen Content'),
      ),
    );
  }
}
