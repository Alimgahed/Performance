import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:performance/gloables/my_widget.dart';
import 'package:performance/home.dart';
import 'package:performance/models/department.dart';

class Register_controller extends GetxController {
  List<Department> department = [];
  late TextEditingController name;
  late TextEditingController password;

  @override
  void onInit() {
    departments();
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

  Future<void> register(
      {required String name, required String password, required int id}) async {
    try {
      final res = await http.post(
          Uri.parse("http://172.16.24.115:3000/register"),
          body: {"name": name, "password": password, "dep_id": id.toString()});

      if (res.statusCode == 200) {
        showSuccessToast("تم تسجيل المستخدم بنجاح");
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

  Future<void> departments() async {
    try {
      final res = await http.get(
        Uri.parse("http://172.16.24.115:3000/register"),
      );
      if (res.statusCode == 200) {
        // Decode the JSON response
        final List<dynamic> jsonResponse = json.decode(res.body);

        // Check if the response is not empty and if it's a list
        if (jsonResponse.isNotEmpty && jsonResponse is List) {
          // Convert each item in the JSON list into a Department object
          department =
              jsonResponse.map((item) => Department.fromJson(item)).toList();
          update();
        } else {}

        // Get.offAll(() => Home());
      } else if (res.statusCode == 400) {
        print(res.body);
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}
