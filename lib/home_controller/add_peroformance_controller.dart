// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:performance/gloables/my_widget.dart';
import 'package:performance/home_controller/get_perforamnce_controler.dart';

class AddPerformanceController extends GetxController {
  late TextEditingController name;
  late TextEditingController value;
  late TextEditingController date;
  late TextEditingController esmited;
  late TextEditingController index_type;

  DateTime? start;

  @override
  void onInit() {
    super.onInit();
    esmited = TextEditingController();
    value = TextEditingController();
    name = TextEditingController();
    date = TextEditingController();
    index_type = TextEditingController();
  }

  // Override onClose to dispose of the controllers
  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    value.dispose();
    esmited.dispose();
    name.dispose();
    date.dispose();
    index_type.dispose();
    super.onClose();
  }

  Future<void> addPerformance({
    required int id,
    required int type,
    required String value,
    required DateTime date,
    required String period,
    required String esmited,
  }) async {
    try {
      final res = await http
          .post(Uri.parse("http://172.16.24.115:3000/index/$id"), body: {
        "date": date.toIso8601String(),
        "index_period": period.toString(),
        "index_type": "فني",
        "estimated_value": esmited,
        "index_value": value
      });

      if (res.statusCode == 200) {
        Get.back();
        showSuccessToast("تم اضافة قيم المؤشر بنجاح");
      } else if (res.statusCode == 400) {
      } else {}
      // ignore: empty_catches
    } catch (e) {}
  }

  // ignore: non_constant_identifier_names
  Future<void> add_index(
      {int? id,
      required String names,
      int? index_id,
      String? index_type}) async {
    try {
      final res = await http
          .post(Uri.parse("http://172.16.24.115:3000/department/$id"), body: {
        "index_name": names,
        "index_id": index_id.toString(),
        "index_type": index_type
      });

      if (res.statusCode == 200) {
        GetPerformanceController controller =
            Get.find<GetPerformanceController>();
        controller.get_index(id: id!);
        Get.back();

        update();
        showSuccessToast("تم اضافة المؤشر بنجاح");
        name.clear();
      } else if (res.statusCode == 400) {
        showCustomErrorDialog(
            iconColor: Colors.red,
            buttonColor: Colors.red,
            title: "خطأ",
            errorMessage: res.body,
            titleColor: Colors.red);
      } else {}
      // ignore: empty_catches
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> edit_index({
    int? id,
    required String names,
    int? index_id,
    String? index_type,
  }) async {
    try {
      final res = await http
          .patch(Uri.parse("http://172.16.24.115:3000/department/$id"), body: {
        "index_name": names,
        "index_id": index_id.toString(),
        "index_type": index_type
      });

      if (res.statusCode == 200) {
        GetPerformanceController controller =
            Get.find<GetPerformanceController>();
        controller.get_index(id: id!);
        Get.back();

        update();
        showSuccessToast("تم تعديل المؤشر بنجاح");
        name.clear();
      } else if (res.statusCode == 400) {
        showCustomErrorDialog(
            iconColor: Colors.red,
            buttonColor: Colors.red,
            title: "خطأ",
            errorMessage: res.body,
            titleColor: Colors.red);
      } else {}
      // ignore: empty_catches
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> delete_index({
    int? id,
    int? index_id,
  }) async {
    try {
      final res = await http
          .delete(Uri.parse("http://172.16.24.115:3000/department/$id"), body: {
        "index_id": index_id.toString(),
      });

      if (res.statusCode == 200) {
        GetPerformanceController controller =
            Get.find<GetPerformanceController>();
        controller.get_index(id: id!);
        Get.back();

        update();
        showSuccessToast("تم حذف المؤشر بنجاح");
        name.clear();
      } else if (res.statusCode == 400) {
        showCustomErrorDialog(
            iconColor: Colors.red,
            buttonColor: Colors.red,
            title: "خطأ",
            errorMessage: res.body,
            titleColor: Colors.red);
      } else {}
      // ignore: empty_catches
    } catch (e) {
      print(e.toString());
    }
  }
}
