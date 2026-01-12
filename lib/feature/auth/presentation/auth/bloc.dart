

import 'package:clean_architure/feature/auth/domain/usecase/user_sing_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSingUp _userSingUp;


  AuthBloc({required UserSingUp userSingUp}) : _userSingUp = userSingUp, super(AuthInitial()){

  on<AuthSingUpEvent>((event, emit)async{
    emit(AuthLoading());
   final res = await _userSingUp(
      UserSingUpParams(name: event.name,
          password: event.password,
          email: event.email));

   res.fold((l)=>emit(AuthFailure(message: l.message)),
           (r)=>emit(AuthSuccess(authModel: r)));
  });


  }}

