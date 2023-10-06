import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:luvit/src/core/extensions/string_log.dart';

class FirebaseData {
  Future<void> changeDataInFirebase() async {
    final apiUrl = Uri.parse('https://frontassignment.hyperhire.in/change');

    try {
      final response = await http.post(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        'Data modified successfully.'.log();
      } else {
        'Failed to modify data. Status code: ${response.statusCode}'.log();
        'Response body: ${response.body}'.log();
      }
    } catch (error) {
      // Handle network errors.
      'Network error: $error'.log();
    }
  }
}
