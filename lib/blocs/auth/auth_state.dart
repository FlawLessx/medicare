// ignore_for_file: override_on_non_overriding_member

part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {}

class UnAuthenticated extends AuthState {}

class AuthFailed extends AuthState {
  final String? message;

  AuthFailed({this.message});
}
