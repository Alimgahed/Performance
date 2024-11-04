import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:performance/home.dart';
import 'package:performance/models/public_releations.dart';

class AddPerformanceController extends GetxController {
  late TextEditingController name;
  late TextEditingController date_end;
  late TextEditingController value;
  late TextEditingController date_start;
  DateTime? start;
  DateTime? end;
  @override
  void onInit() {
    super.onInit();
    // Initialize each TextEditingController
    value = TextEditingController();
    name = TextEditingController();
    date_end = TextEditingController();
    date_start = TextEditingController();
  }

  // Override onClose to dispose of the controllers
  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    value.dispose();
    name.dispose();
    date_start.dispose();
    date_end.dispose();
    super.onClose();
  }

  Future<void> addPerformance({
    required int id,
    required String name,
    required String value,
    required String date_to,
    required String date_from,
  }) async {
    try {
      final res = await http
          .post(Uri.parse("http://172.16.16.7:3000/department/$id"), body: {
        "from_date": date_to,
        "to_date": date_from,
        "standard_name": name,
        "standard_value": value,
        "user_id": 1.toString()
      });

      if (res.statusCode == 200) {
        Get.off(() => public_releations());
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
}
