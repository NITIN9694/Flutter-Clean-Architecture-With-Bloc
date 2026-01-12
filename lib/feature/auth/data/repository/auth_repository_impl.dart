
import 'dart:developer';

import 'package:clean_architure/core/error/failure.dart';
import 'package:clean_architure/core/error/server_exception.dart';
import 'package:clean_architure/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:clean_architure/feature/auth/data/model/login_data_model.dart';

import 'package:fpdart/src/either.dart';

import '../../domain/repositiory/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{

AuthRemoteDataSource authRemoteDataSource;
AuthRepositoryImpl(this.authRemoteDataSource);




  @override
  Future<Either<Failure, AuthModel>> singUpWithEmailPassword({required String name, required String email, required String password})async {
    try{
     final  AuthModel response = await authRemoteDataSource.singUpWithEmailPassword(name:name,email: email, password: password);
     print("respons$response");
     //return right its success
     return right(response);
    }on ServerException catch (e) {
      log("Error ${e.message}");

      throw left(Failure(e.message));
    } catch (e) {
      log("Unknown Error $e");
      return left(Failure("Something went wrong"));
    }
  }

}