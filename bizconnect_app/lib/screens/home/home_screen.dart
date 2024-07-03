import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import '../../services/auth/auth_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  void _checkAuthentication() async {
    bool isAuthenticated = await authService.isAuthenticated();
    if (!isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  void _logout(BuildContext context) async {
    await authService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
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
          ],
        ),
      ),
    );
  }
}
