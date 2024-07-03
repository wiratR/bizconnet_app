import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config/app_config.dart';
import '../../models/auth/auth_model.dart';

class AuthService {
  Future<String?> login(String email, String password) async {
    
    // Using AppConfig.baseUrl
    final url = Uri.parse('${AppConfig.baseUrl}/auth/login'); 
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(LoginInput(email: email, password: password).toJson());

    print('Login with url = ${url}');
    print('Login with body = ${body}');

    try {
        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
            print('login successful');
            // Parse the JSON response
            Map<String, dynamic> jsonResponse = jsonDecode(response.body);
            // Access the token string
            String token = jsonResponse['data']['token'];
            // Prints the token as a string
            print('Token: $token'); 
            await _saveToken(token);
            return token;
            // return response.body; // Example: return token or user data
        } else {
          print('login failed with status code: ${response.statusCode}');
          print('error = ${response.body}');
          return null;
        }

    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<String?> register(String name, String email, String password, String passwordConfirm) async {
    final url = Uri.parse('${AppConfig.baseUrl}/auth/register'); 
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(RegisterInput(name: name, email: email, password: password, passwordConfirm: passwordConfirm).toJson());

    print('Register with url = ${url}');
    print('Register with body = ${body}');

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print('Register successful');
        return response.body; // Example: return token or user data
      } else {
        print('Register failed with status code: ${response.statusCode}');
        print('error = ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null;
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

}
