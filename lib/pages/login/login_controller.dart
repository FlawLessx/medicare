import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:medicare/app/app.dart';
import 'package:medicare/blocs/_index.dart';
import 'package:regexed_validator/regexed_validator.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  RxString emailValidator = ''.obs;
  late TextEditingController passwordController;
  RxString passwordValidator = ''.obs;
  late TextEditingController confirmPasswordController;
  RxString confirmPasswordValidator = ''.obs;
  late TextEditingController frontNameController;
  late TextEditingController backNameController;
  late TextEditingController identityController;
  late TextEditingController phoneNumberController;
  RxBool isLogin = true.obs;
  RxBool obscureText = true.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    frontNameController = TextEditingController();
    backNameController = TextEditingController();
    identityController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    frontNameController.dispose();
    backNameController.dispose();
    identityController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

  void changeView(bool value) {
    isLogin.value = value;
    emailValidator.value = '';
    passwordValidator.value = '';
    confirmPasswordValidator.value = '';
  }

  void login() {
    if (emailController.text.isEmpty) {
      emailValidator.value = tr('general.email_required');
    } else if (!validator.email(emailController.text)) {
      emailValidator.value = tr('general.email_not_valid');
    } else {
      emailValidator.value = '';
    }

    if (passwordController.text.isEmpty) {
      passwordValidator.value = tr('general.password_required');
    } else {
      passwordValidator.value = '';
    }

    if (emailValidator.value.isEmpty && passwordValidator.isEmpty) {
      BlocProvider.of<AuthCubit>(appContext!).signIn(
        emailController.text,
        passwordController.text,
      );
    }
  }

  void register() {
    if (emailController.text.isEmpty) {
      emailValidator.value = tr('general.email_required');
    } else if (!validator.email(emailController.text)) {
      emailValidator.value = tr('general.email_not_valid');
    } else {
      emailValidator.value = '';
    }

    if (passwordController.text.isEmpty) {
      passwordValidator.value = tr('general.password_required');
    } else {
      passwordValidator.value = '';
    }

    if (passwordController.text != confirmPasswordController.text) {
      confirmPasswordValidator.value = tr('general.password_required');
    } else {
      confirmPasswordValidator.value = '';
    }

    if (emailValidator.value.isEmpty &&
        passwordValidator.isEmpty &&
        confirmPasswordValidator.isEmpty) {
      BlocProvider.of<AuthCubit>(appContext!).register(
        emailController.text,
        passwordController.text,
      );
    }
  }
}
