import 'package:flutter/material.dart';
import 'package:rest_api_app/api_response.dart';
import 'package:rest_api_app/model/registration_model.dart';
import 'package:rest_api_app/model/registration_response.dart';

class ApiViewModel extends ChangeNotifier {
  ApiResponse _apiresponse = ApiResponse();
  Future<RegistrationResponse> getRegister(Registration registration) {
    final results = _apiresponse.getRegister(registration);
    return results;
  }
}
