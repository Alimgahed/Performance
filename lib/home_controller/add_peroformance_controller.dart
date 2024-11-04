import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddPerformanceController extends GetxController {
  // Declare the TextEditingControllers
  late TextEditingController name;
  late TextEditingController dayTo;
  late TextEditingController monthTo;
  late TextEditingController yearTo;
  late TextEditingController value;
  late TextEditingController dayFrom;
  late TextEditingController monthFrom;
  late TextEditingController yearFrom;

  // Override onInit to initialize the controllers
  @override
  void onInit() {
    super.onInit();
    // Initialize each TextEditingController
    name = TextEditingController();
    dayTo = TextEditingController();
    monthTo = TextEditingController();
    yearTo = TextEditingController();
    value = TextEditingController();
    dayFrom = TextEditingController();
    monthFrom = TextEditingController();
    yearFrom = TextEditingController();
  }

  // Override onClose to dispose of the controllers
  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    name.dispose();
    dayTo.dispose();
    monthTo.dispose();
    yearTo.dispose();
    value.dispose();
    dayFrom.dispose();
    monthFrom.dispose();
    yearFrom.dispose();
    super.onClose();
  }

  Future<void> addPerformance({
    required int id,
    required String name,
    required String value,
    required String date,
  }) async {
    try {
      final res = await http
          .post(Uri.parse("http://41.33.3.91:3000/department/$id"), body: {
        "from_date_to_date": date,
        "standard_name": name,
        "standard_value": value,
        "user_id": "١"
      });

      if (res.statusCode == 200) {
        // Decode the JSON response
        print(res.body);
        // Assuming the API returns a list of items
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
