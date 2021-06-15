import 'package:flutter/material.dart';
import 'package:rest_api_app/api_response.dart';
import 'package:rest_api_app/model/Login_model.dart';
import 'package:rest_api_app/model/business_type.dart';
import 'package:rest_api_app/model/pro_model.dart';
import 'package:rest_api_app/model/registration_model.dart';
import 'package:rest_api_app/model/registration_response.dart';

class ApiViewModel extends ChangeNotifier {
  ApiResponse _apiresponse = ApiResponse();
  Future<RegistrationResponse> getRegister(Registration registration) {
    final results = _apiresponse.getRegister(registration);
    return results;
  }

  Future<LoginDetails> getLoginDetails(String username, String password) async {
    final results = await _apiresponse.fetchLoginDetails(username, password);
    return results;
  }

  Future<List<BusinessTypes>> getAllCategoeries() {
    final results = _apiresponse.fetchAllCategories();
    return results;
  }

  Future<ProModel> updateProDetails(ProModel proModel) async {
    final results = await _apiresponse.keepUpdateProfile(proModel);
    return results;
  }
}
