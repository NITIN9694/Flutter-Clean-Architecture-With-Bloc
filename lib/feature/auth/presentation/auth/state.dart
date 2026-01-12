


import 'package:clean_architure/feature/auth/data/model/login_data_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
sealed class AuthState{}


final class AuthInitial extends AuthState{}
final class AuthLoading extends AuthState{}

final class AuthSuccess extends AuthState{
  final AuthModel authModel;
  AuthSuccess({required this.authModel});
}

final class AuthFailure extends AuthState{
  final String message;
  AuthFailure({required this.message});
}