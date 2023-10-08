import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:luvit/src/core/constants/api_constants.dart';
import 'package:luvit/src/core/extensions/string_log.dart';

class ProfileDataService {
  final http.Client _httpClient;

  ProfileDataService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<bool> performRequestChangeData() async {
    try {
      final response = await _httpClient.post(
        Uri.parse(firebaseDBChangeDataApi),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode({}),
      );
      'Requesting to $firebaseDBChangeDataApi :\nres:${response.statusCode}:${json.encode(response.body)}'
          .log();
      if (response.statusCode == 201) {
        'Data modified successfully.'.log();
        return true;
      } else {
        'Error Requesting to firebaseDBChangeDataApi :\nres:${response.statusCode}:${json.encode(response.body)}'
            .log();
        return false;
      }
    } on SocketException {
      //
      throw const HttpException("No Internet connection");
      //
    } catch (exception, stackTrace) {
      //
      "stackTrace: $stackTrace".log();

      throw const HttpException('Error Communicating with Server');
      //
    }
  }
}
