
import 'dart:convert';
import 'dart:developer';

import 'package:clean_architure/networks/api_methods.dart';
import 'package:flutter/foundation.dart';



class RemoteApi{



  ///Post requests  *******************************
  Future<Map<String, dynamic>> postRequest(
      String apiEndpoint,
      String requestJson,
      ) async {
    try {
      final response = await ApiMethods.postApiCall(apiEndpoint, requestJson);

      if (response == null) {
        throw Exception("Null response");
      }

      if (kDebugMode) {
        log("Status Code: ${response.statusCode}");
        log("Raw Body: ${response.body}");
      }

      final decoded = jsonDecode(response.body);

      return decoded as Map<String, dynamic>;

    } catch (e, stacktrace) {
      if (kDebugMode) {
        print("Exception at postRequest: $e");
        print(stacktrace);
      }
      rethrow;
    }
  }

  ///Post requests  *******************************
  Future<dynamic> getRequest(String apiEndpoint) async {
    try {
      final response = await ApiMethods.getApiCall(apiEndpoint);

      if (response == null) {
        throw Exception("Null response");
      }

      if (kDebugMode) {
        log("Status Code: ${response.statusCode}");
        log("Raw Body: ${response.body}");
      }

      return jsonDecode(response.body);

    } catch (e, stacktrace) {
      if (kDebugMode) {
        print("Exception at getRequest: $e");
        print(stacktrace);
      }
      rethrow;
    }
  }


  //
  // Future<List<HomeDataModel>> getHomeData()async{
  //   final response = await http.get(Uri.parse(baseUrl+posts),
  //     headers: {'Content-Type': 'application/json'},
  //
  //
  //   );
  //   log("body ${response.body}");
  //   if(response.statusCode==200){
  //     final List<dynamic> jsonList = json.decode(response.body);
  //
  //     final List<HomeDataModel> posts =
  //     jsonList.map((e) => HomeDataModel.fromJson(e)).toList();
  //     return posts;
  //
  //   }else{
  //     throw Exception("Login Failed");
  //   }  }
}