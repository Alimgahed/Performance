import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:performance/gloables/my_widget.dart';
import 'package:performance/home.dart';

class ChangePasswordController extends GetxController {
  late TextEditingController passwordconfirm;
  late TextEditingController password;

  @override
  void onInit() {
    super.onInit();
    password = TextEditingController();
    passwordconfirm = TextEditingController();
  }

  // Override onClose to dispose of the controllers
  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    password.dispose();
    passwordconfirm.dispose();

    super.onClose();
  }

  // ignore: non_constant_identifier_names
  Future<void> change_password({
    required String password,
  }) async {
    try {
      final res = await http
          .post(Uri.parse("http://172.16.24.115:3000/changepassword"), body: {
        "new_password": password,
      });

      if (res.statusCode == 200) {
        showSuccessToast("تم تغيير كلمة المرور  بنجاح");
        await Get.offAll(() => const home());
        // Get.offAll(() => Home());
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
