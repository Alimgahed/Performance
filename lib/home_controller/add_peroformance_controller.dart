// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:performance/home_controller/get_perforamnce_controler.dart';

class AddPerformanceController extends GetxController {
  late TextEditingController name;
  late TextEditingController value;
  late TextEditingController date;
  DateTime? start;

  @override
  void onInit() {
    super.onInit();
    value = TextEditingController();
    name = TextEditingController();
    date = TextEditingController();
  }

  // Override onClose to dispose of the controllers
  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    value.dispose();
    name.dispose();
    date.dispose();

    super.onClose();
  }

  Future<void> addPerformance({
    required int id,
    required int type,
    required int value,
    required DateTime date,
    required String period,
  }) async {
    try {
      final res = await http
          .post(Uri.parse("http://172.16.16.7:3000/index/$id"), body: {
        "date": date.toIso8601String(),
        "index_period": period.toString(),
        "index_type": "فني",
        "index_value": value.toString(),
      });

      if (res.statusCode == 200) {
        // Get.offUntil(PublicRelations() as Route, (route) => false);

        print("done");
      } else if (res.statusCode == 400) {
        print('Bad request: ${res.body}');
      } else {
        print('Failed to load department: ${res.statusCode}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  Future<void> add_index({
    int? id,
    required String name,
  }) async {
    try {
      final res = await http.post(
          Uri.parse("http://172.16.16.7:3000/department/$id"),
          body: {"index_name": name, "index_type": "فني"});

      if (res.statusCode == 200) {
        GetPerformanceController controller =
            Get.find<GetPerformanceController>();
        controller.get_index(id: id!);

        update();
      } else if (res.statusCode == 400) {
        print('Bad request: ${res.body}');
      } else {
        print('Failed to load department: ${res.statusCode}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }
}
