import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final cEmail = TextEditingController();
  final cPass = TextEditingController();

  void onClose() {
    cEmail.dispose();
    cPass.dispose();
    super.onClose();
  }
}
