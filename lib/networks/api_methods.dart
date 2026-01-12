
import 'package:clean_architure/networks/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiMethods{
  ///Post Api Calls
  static Future<http.Response?> postApiCall(
      String apiEndpoint,
      String requestJson,
      ) async {
    try {
      final uri = Uri.parse(ApiConstant().apiBaseUrl + apiEndpoint);


      return await post(
        uri,

        body: requestJson,
      );
    } catch (e) {
      print("ExceptionHandling at post api call: $apiEndpoint$e");

      return null;
    }
  }

  ///Get Api Calls
  static Future<http.Response?> getApiCall(
      String apiEndpoint,
      ) async {
    try {
      final uri = Uri.parse(ApiConstant().apiBaseUrl + apiEndpoint);


      return await get(
        uri,

      );
    } catch (e) {
      print("ExceptionHandling at post api call: $apiEndpoint$e");

      return null;
    }
  }
}