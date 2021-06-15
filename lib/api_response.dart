import 'package:flutter/material.dart';
import 'package:rest_api_app/model/Login_model.dart';
import 'package:rest_api_app/model/business_type.dart';
import 'package:rest_api_app/model/pro_model.dart';
import 'package:rest_api_app/model/registration_model.dart';
import 'package:rest_api_app/model/registration_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiResponse {
  String baseUrl = '';
  String loginEndPoint = '';
  String token = '';
  String query = '';
  String getCatQuery = '';
  String profileEndPoint = '';
  String loginToken = '';

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

  Future<LoginDetails> fetchLoginDetails(
      String username, String password) async {
    var map = new Map<String, dynamic>(); //map initilization
    map['grant_type'] = 'password';
    map['username'] = username;
    map['password'] = password;
    Map<String, String> headers = <String, String>{
      'Authorization':
          'Basic ${base64Encode(utf8.encode('customer-app:secret-app'))}'
    };
    final response = await http.post(Uri.parse(baseUrl + loginEndPoint),
        headers: headers, body: map);
    if (response.statusCode == 200) {
      final body = response.body;
      Map<String, dynamic> res = jsonDecode(body);
      print('Response ${response.body}');
      return LoginDetails.fromJson(res);
    } else if (response.statusCode == 401) {
    } else {
      print('Something Went Wrong');
    }
  }

  Future<List<BusinessTypes>> fetchAllCategories() async {
    print(baseUrl + getCatQuery);
    final response = await http.get(
      Uri.parse(baseUrl + getCatQuery),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable getItem = body;
      return getItem
          .map((category) => BusinessTypes.fromJson(category))
          .toList();
    }
  }

  Future<ProModel> keepUpdateProfile(ProModel proModel) async {
    final response = await http.put(Uri.parse(baseUrl + profileEndPoint),
        headers: {
          "Authorization": "Bearer $loginToken",
          "Content-Type": "application/json",
        },
        body: json.encode(proModel));
    print('Model Goimg isssss $proModel');
    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.body);
      print('Updated Profile isssssssssssssss ${response.body}');
      return ProModel.fromJson(res);
    }
  }
}
