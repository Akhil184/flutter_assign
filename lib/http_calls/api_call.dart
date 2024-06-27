import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';
class ApiService {
 
  static Future<bool> loginUser(String email, String password) async {
    try {
      String apiUrl = 'https://apiv2stg.promilo.com/user/oauth/token'; // Example endpoint for login

      String hashedPassword = _generateSHA256(password);

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          // Replace with your actual token if needed
          'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
        },
        body: {
          'username': email,
          'password':hashedPassword,
          'grant_type':'password'
        },
      );
      if (response.statusCode == 200) {
        // Login successful
        return true;
      } else {
        // Login failed
        print(hashedPassword);
        return false;
      }
    } catch (e) {
      print('Error: $e');
      throw e; // Rethrow the error for handling in UI or elsewhere
    }

  }
  static String _generateSHA256(String input) {
    var bytes = utf8.encode(input); // Encode the input string to UTF-8
    var digest = sha256.convert(bytes); // Generate the SHA-256 hash
    return digest.toString(); // Return the hash as a hexadecimal string
  }
}
