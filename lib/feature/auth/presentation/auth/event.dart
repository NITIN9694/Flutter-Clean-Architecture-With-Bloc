
import 'package:flutter/cupertino.dart';

@immutable
sealed class AuthEvent {}


final class AuthSingUpEvent extends AuthEvent{

  final String name;
  final String password;
  final String email;
  AuthSingUpEvent({required this.email, required this.password,required this.name});
}

