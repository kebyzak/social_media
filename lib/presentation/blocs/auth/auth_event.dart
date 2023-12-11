part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final int age;
  final String name;
  final String password;

  RegisterEvent({
    required this.email,
    required this.age,
    required this.name,
    required this.password,
  });
}

class LogOutEvent extends AuthEvent {}
