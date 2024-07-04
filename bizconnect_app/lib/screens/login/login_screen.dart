import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../../services/auth/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo at the top
              Image.asset('assets/logo.png', height: 100),
              SizedBox(height: 24.0),
              // App name
              Text(
                'BizConnect',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24.0),
              // Email/Username TextField
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email/Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              // Password TextField
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
              ),
              SizedBox(height: 16.0),
              // Forgot Password link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: Text('Forgot Password?'),
                ),
              ),
              SizedBox(height: 16.0),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  _login(context); // Call login function
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF56BED6), // Change the button color to #56BED6
                  foregroundColor: Colors.white, // Change the text color to white
                  minimumSize: Size(double.infinity, 50), // Make the button full width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0), // Set border radius to 100 pixels
                  ),
                ),
                child: Text('Log In'),
              ),
              SizedBox(height: 24.0),
              // Sign Up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text('SIGN UP HERE'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
