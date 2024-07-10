import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import '../../components/appbar/custom_app_bar.dart';
import '../../components/card/labeled_input_card.dart';
import '../../components/card/labeled_dropdown_card.dart';
import '../../components/button/custom_button.dart';
import '../../services/auth/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isPasswordConfirmVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _register(BuildContext context) async {
    String? user = await authService.register(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
      _passwordConfirmController.text,
    );

    if (user != null) {
      // Registration successful
      print('Register successful! User: $user');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Register successful. Please try login.'),
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      // Registration failed
      print('Register failed');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Register failed. Please try again.'),
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Create account'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            LabeledInputCard(
              labelText: 'Email',
              controller: _emailController,
              isRequired: true,
            ),
            // SizedBox(height: 8.0),
            LabeledInputCard(
              labelText: 'Password',
              controller: _passwordController,
              isRequired: true,
              isPassword: true,
            ),
            LabeledInputCard(
              labelText: 'Confirm Password',
              controller: _passwordConfirmController,
              isRequired: true,
              isPassword: true,
            ),
            LabeledInputCard(
              labelText: 'First Name',
              controller: _firstNameController,
              isRequired: true,
            ),
            LabeledInputCard(
              labelText: 'Last Name',
              controller: _lastNameController,
              isRequired: true,
            ),
            LabeledInputCard(
              labelText: 'Mobile Phone',
              controller: _phoneController,
              isRequired: true,
            ),
            LabeledInputCard(
              labelText: 'Company',
              controller: _companyController,
              isRequired: true,
            ),
            LabeledInputCard(
              labelText: 'Position',
              controller: _positionController,
              isRequired: true,
            ),
            LabeledDropdownCard(
              labelText: 'Interest',
              items: ['Option 1', 'Option 2', 'Option 3'],
              selectedItem: 'Option 1',
              isRequired: true,
              onChanged: (value) {
                // Handle change
              },
            ),
            LabeledDropdownCard(
              labelText: 'Favorite Category Events',
              items: ['Option 1', 'Option 2', 'Option 3'],
              selectedItem: 'Option 1',
              isRequired: true,
              onChanged: (value) {
                // Handle change
              },
            ),
            CustomButton(
              buttonText: 'DONE',
              onPressed: () {
                _register(context);
              },
            ),
          ],
        ),
      ),
      // body: Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       TextField(
      //         controller: _nameController,
      //         decoration: InputDecoration(
      //           labelText: 'Name',
      //         ),
      //       ),
      //       TextField(
      //         controller: _emailController,
      //         decoration: InputDecoration(
      //           labelText: 'Email',
      //         ),
      //         keyboardType: TextInputType.emailAddress,
      //       ),
      //       SizedBox(height: 16.0),
      //       TextField(
      //         controller: _passwordController,
      //         decoration: InputDecoration(
      //           labelText: 'Password',
      //           suffixIcon: IconButton(
      //             icon: Icon(
      //               _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
      //             ),
      //             onPressed: () {
      //               setState(() {
      //                 _isPasswordVisible = !_isPasswordVisible;
      //               });
      //             },
      //           ),
      //         ),
      //         obscureText: !_isPasswordVisible,
      //       ),
      //       SizedBox(height: 16.0),
      //       TextField(
      //         controller: _passwordConfirmController,
      //         decoration: InputDecoration(
      //           labelText: 'Confirm Password',
      //           suffixIcon: IconButton(
      //             icon: Icon(
      //               _isPasswordConfirmVisible ? Icons.visibility : Icons.visibility_off,
      //             ),
      //             onPressed: () {
      //               setState(() {
      //                 _isPasswordConfirmVisible = !_isPasswordConfirmVisible;
      //               });
      //             },
      //           ),
      //         ),
      //         obscureText: !_isPasswordConfirmVisible,
      //       ),
      //       SizedBox(height: 16.0),
      //       ElevatedButton(
      //         onPressed: () {
      //           _register(context);
      //         },
      //         child: Text('Register'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
