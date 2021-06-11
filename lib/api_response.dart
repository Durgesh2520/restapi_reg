import 'package:flutter/material.dart';
import 'package:rest_api_app/model/registration_model.dart';
import 'package:rest_api_app/model/registration_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiResponse {
  String baseUrl = '';
  String query = '';
  String token = '';

  Future<RegistrationResponse> getRegister(Registration registration) async {
    print('$baseUrl + $query');
    final response = await http.post(Uri.parse('$baseUrl + $query'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: json.encode(registration));
    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.body);
      print('Response  ${response.body}');
      return RegistrationResponse.fromJson(res);
    } else {
      print('Error');
    }
  }
}
