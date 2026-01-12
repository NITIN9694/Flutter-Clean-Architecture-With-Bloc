
import 'package:clean_architure/core/error/failure.dart';
import 'package:clean_architure/feature/auth/data/model/login_data_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future <Either<Failure,AuthModel>> singUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  });


}