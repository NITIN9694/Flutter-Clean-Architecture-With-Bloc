
import 'dart:developer';

import 'package:clean_architure/core/error/failure.dart';
import 'package:clean_architure/feature/home/data/datasource/home_datasources.dart';

import 'package:clean_architure/feature/home/data/model/home_data_model.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/server_exception.dart';
import '../../domain/repository/home_repository.dart';

class HomeDataRepo implements HomeRepo{
  HomeDataSource homeDataSource ;
  HomeDataRepo(this.homeDataSource);
  @override
  Future<Either<Failure, List<HomeDataModel>>> getHomeData()async {
    try{
      final  List<HomeDataModel> response = await homeDataSource.getHomeData();
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

