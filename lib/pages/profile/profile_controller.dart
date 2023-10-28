import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final BuildContext context;
  RxInt selectedPage = 0.obs;

  ProfileController(this.context, int page) {
    selectedPage.value = page;
  }
}
