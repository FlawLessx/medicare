import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/data/local/shared_preferences_wrapper.dart';
import 'package:medicare/data/repository/_index.dart';
import 'package:medicare/exceptions/app_exception.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authRepository = Modular.get<AuthRepository>();
  final preferencesWrapper = Modular.get<SharedPreferencesWrapper>();

  void signIn(String email, String password) async {
    try {
      emit(AuthLoading());

      await authRepository.login(email, password);

      emit(Authenticated());
    } on AppException catch (e) {
      emit(AuthFailed(message: e.message));
    } catch (e) {
      emit(AuthFailed());
    }
  }

  void register(String email, String password) async {
    try {
      emit(AuthLoading());

      await authRepository.register(email, password);

      emit(Authenticated());
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
        emit(Authenticated());
      } else {
        emit(UnAuthenticated());
      }
    } on AppException catch (e) {
      emit(AuthFailed(message: e.message));
    }
  }
}
