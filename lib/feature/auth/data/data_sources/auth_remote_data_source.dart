
 import 'dart:convert';
import 'dart:math';
import 'package:clean_architure/core/error/server_exception.dart';
import 'package:clean_architure/networks/api_constants.dart';
import 'package:clean_architure/networks/remote_api.dart';
import 'package:http/http.dart';

import '../model/login_data_model.dart';



abstract interface class AuthRemoteDataSource{

  Future<AuthModel>singUpWithEmailPassword({
    required String name,
    required String email,
    required String password
 });


 }



 class AuthRemoteDataSourceImp implements AuthRemoteDataSource{
   final RemoteApi remoteApi;
   AuthRemoteDataSourceImp(this.remoteApi);

  @override
  Future<AuthModel> singUpWithEmailPassword({required String name, required String email, required String password})async {
    try{
      final body = {
        "title":email,
        "body":password
      };
      final response = await remoteApi.postRequest (ApiConstant().posts, json.encode(body));


      print("respomse ${response}");

      return AuthModel.fromJson(response);

    }on ServerException catch(e){
      throw ServerException(e.message.toString());
    }
  }

 }