import 'package:http/http.dart' as http;
import '../../config/app_config.dart';

class AuthService {
  Future<String?> login(String email, String password) async {
    final url = Uri.parse('${AppConfig.baseUrl}/Auth/login'); // Using AppConfig.baseUrl
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Successful login
      return response.body; // Example: return token or user data
    } else {
      // Handle error
      print('Login failed: ${response.statusCode}');
      return null;
    }
  }
}
