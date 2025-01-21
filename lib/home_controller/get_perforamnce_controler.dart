import 'dart:convert'; // Import this for json decoding
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:performance/Departments/Public_relations.dart';
import 'package:performance/gloables/my_widget.dart';
import 'package:performance/models/department.dart';

class GetPerformanceController extends GetxController {
  // ignore: non_constant_identifier_names
  List<get_indx_name> index_names = [];

  IndexData? data;

  @override
  void onInit() {
    get_index(id: 1);
    update();
    super.onInit();
  }

  // ignore: non_constant_identifier_names
  void add_index({int? id, required String name}) {
    index_names.add(get_indx_name(id: id, name: name));

    update();
  }

// Adjusted naming to PascalCase

  // ignore: non_constant_identifier_names
  Future<void> get_index({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse("http://172.16.24.115:3000/department/$id"),
      );

      if (res.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(res.body);
        index_names =
            jsonData.map((item) => get_indx_name.fromJson(item)).toList();
        update();
        Get.to(() => PublicRelations());
      } else if (res.statusCode == 400) {
        showCustomErrorDialog(
            iconColor: Colors.red,
            buttonColor: Colors.red,
            title: "خطأ",
            errorMessage: "ليس لديك الصلاحية للدخول لهذه الادارة",
            titleColor: Colors.red);
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  // ignore: non_constant_identifier_names
  Future<void> get_perofrmance({required int id}) async {
    final res = await http.get(
      Uri.parse("http://172.16.24.115:3000/index/$id"),
    );
    if (res.statusCode == 200) {
      try {
        final Map<String, dynamic> jsonResponse = json.decode(res.body);

        // Ensure the response matches the expected structure
        if (jsonResponse.isNotEmpty) {
          data = IndexData.fromJson(jsonResponse);

          update(); // Notify listeners
        }
        // ignore: empty_catches
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
