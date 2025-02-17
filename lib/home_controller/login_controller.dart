import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:performance/gloables/data.dart';
import 'package:performance/gloables/my_widget.dart';
import 'package:performance/home.dart';

class LoginController extends GetxController {
  late TextEditingController name;
  late TextEditingController password;
  @override
  void onInit() {
    super.onInit();
    password = TextEditingController();
    name = TextEditingController();
  }

  // Override onClose to dispose of the controllers
  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    password.dispose();
    name.dispose();

    super.onClose();
  }

  // ignore: non_constant_identifier_names
  Future<void> Login(String name, String password) async {
    try {
      final res = await http.post(
        Uri.parse("http://172.16.24.115:3000/login"),
        body: {
          "name": name,
          "password": password,
        },
      );
      if (res.statusCode == 200) {
        // ignore: unrelated_type_equality_checks
        if (res.body == 2.toString()) {
          id.value = true;
        } else {
          id.value = false;
        }
        showSuccessToast("تم تسجيل الدخول بنجاح");
        print(res.body);
        Get.offAll(() => const home());
      } else if (res.statusCode == 400) {
        showCustomErrorDialog(
            iconColor: Colors.red,
            buttonColor: Colors.red,
            title: "خطأ",
            errorMessage: res.body,
            titleColor: Colors.red);
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}
