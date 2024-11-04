import 'dart:convert'; // Import this for json decoding
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:performance/home.dart';
import 'package:performance/models/public_releations.dart';

class GetPerformanceController extends GetxController {
  void onInit() {
    getPerformance(id: 1);
    update();
    super.onInit();
  }

  List<public_releations> relations = []; // Adjusted naming to PascalCase

  Future<void> getPerformance({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse("http://172.16.16.7:3000/department/$id"),
      );

      if (res.statusCode == 200) {
        // Get.offAll(() => Home());

        print(res.body);
        // Assuming the API returns a list of items
        final List<dynamic> jsonData = json.decode(res.body);
        relations =
            jsonData.map((item) => public_releations.fromJson(item)).toList();
        update();
        print(relations);

        for (var i in relations) {
          print(i.name);
          print(i.public_releationsName);
        }
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
