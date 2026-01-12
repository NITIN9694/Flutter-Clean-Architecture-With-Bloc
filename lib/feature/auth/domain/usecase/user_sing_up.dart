
import 'package:clean_architure/core/error/failure.dart';
import 'package:clean_architure/core/usecase/usecase.dart';
import 'package:clean_architure/feature/auth/domain/repositiory/auth_repository.dart';
import 'package:clean_architure/feature/auth/data/model/login_data_model.dart';
import 'package:fpdart/src/either.dart';

class UserSingUp implements UseCase <AuthModel,UserSingUpParams>{
 final  AuthRepository authRepository;
 UserSingUp(this.authRepository);


  @override
  Future<Either<Failure, AuthModel>> call(UserSingUpParams params) async  {
   return await authRepository.singUpWithEmailPassword(name: params.name, email: params.email, password: params.password);
  }


}

class UserSingUpParams{
  final String email;
  final String password;
  final String name;

  UserSingUpParams({
    required this.name,
    required this.password,
    required this.email,

});
}