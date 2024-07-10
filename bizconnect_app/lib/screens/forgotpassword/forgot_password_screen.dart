import 'package:flutter/material.dart';
import '../../components/appbar/custom_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _resetPassword(BuildContext context) {
    final email = _emailController.text;

    // Perform your password reset logic here
    // For now, we'll just print the value
    print('Email: $email');

    // Optionally, show a success message or navigate to another screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Password reset link sent')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Forgot password'),
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
            ElevatedButton(
              onPressed: () {
                _resetPassword(context);
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
