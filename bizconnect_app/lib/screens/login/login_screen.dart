import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../../services/auth/auth_service.dart';


class LoginScreen extends StatelessWidget {
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) async {
    String? token = await authService.login(
      _emailController.text,
      _passwordController.text,
    );

    if (token != null) {
      // Navigate to next screen or handle successful login
      print('Login successful! Token: $token');
      // Navigate to the home screen on success
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Show error message or handle login failure
      print('Login failed');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Please try again.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _login(context); // Call login function
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Don\'t have an account? Register'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgot-password');
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }

  // void _login(BuildContext context) {
  //   final email = _emailController.text;
  //   final password = _passwordController.text;

  //   // Replace with your actual login logic
  //   // For now, we'll just simulate a successful login
  //   if (email == 'user@example.com' && password == 'password') {
  //     // Navigate to the home screen on success
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //     );
  //   } else {
  //     // Handle login failure, show error message, etc.
  //     print('Login failed. Incorrect email or password.');
  //   }
  // }
}
