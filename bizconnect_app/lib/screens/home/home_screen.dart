import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                subtitle: Text('View and edit your profile'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  // Navigate to profile screen
                },
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                subtitle: Text('Manage app settings'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  // Navigate to settings screen
                },
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  // Implement logout functionality
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
