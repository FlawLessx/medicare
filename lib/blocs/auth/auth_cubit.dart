import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/data/local/shared_preferences_wrapper.dart';
import 'package:medicare/data/repository/_index.dart';
import 'package:medicare/exceptions/app_exception.dart';
import 'package:medicare/models/_index.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authRepository = Modular.get<AuthRepository>();
  final userRepository = Modular.get<UserRepository>();
  final preferencesWrapper = Modular.get<SharedPreferencesWrapper>();

  void signIn(String email, String password) async {
    try {
      emit(AuthLoading());

      await authRepository.login(email, password);
      final user = await userRepository.profile();

      emit(Authenticated(user));
    } on AppException catch (e) {
      log(e.message);
      emit(AuthFailed(message: e.message));
    } catch (e) {
      log(e.toString());
      emit(AuthFailed());
    }
  }

  void register(String email, String password) async {
    try {
      emit(AuthLoading());

      await authRepository.register(email, password);
      final user = await userRepository.profile();

      emit(Authenticated(user));
    } on AppException catch (e) {
      emit(AuthFailed(message: e.message));
    } catch (e) {
      emit(AuthFailed());
    }
  }

  void signOut() async {
    try {
      await authRepository.logout();
      emit(UnAuthenticated());
    } on AppException catch (e) {
      emit(AuthFailed(message: e.message));
    } catch (e) {
      emit(AuthFailed());
    }
  }

  void checkLogin() async {
    try {
      emit(AuthLoading());

      final isLoggedIn = await authRepository.isLoggedIn();

      if (isLoggedIn) {
        final user = await userRepository.profile();
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } on AppException catch (e) {
      emit(AuthFailed(message: e.message));
    }
  }
}
