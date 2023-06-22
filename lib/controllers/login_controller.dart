import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/get_provider.dart';

class LoginController extends GetxController with StateMixin<dynamic> {
  String email = '', pass = '';
  var loading = false.obs;
  final GetProvider _provider = GetProvider();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  login() async {
    loading(true);
    var response = await _provider.sendPost({
      'email': email,
      'pass': pass,
      'userId': 1,
    });
    if (!response.status.hasError) {
      Get.snackbar('Success', 'Post added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    loading(false);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
