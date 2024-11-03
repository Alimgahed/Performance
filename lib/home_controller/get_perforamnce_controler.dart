import 'dart:convert'; // Import this for json decoding
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:performance/models/public_releations.dart';

class GetPerformanceController extends GetxController {
  List<public_releations> relations = []; // Adjusted naming to PascalCase

  Future<void> getPerformance({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse("http://172.16.16.7:3000/department/$id"),
      );

      if (res.statusCode == 200) {
        // Decode the JSON response
        print(res.body);
        final List<dynamic> jsonData = json.decode(res.body);
        relations =
            jsonData.map((item) => public_releations.fromJson(item)).toList();
        print(relations);
        for (var i in relations) {
          print(i.name);
          print(i.public_releationsName);
        }
      } else if (res.statusCode == 400) {
        print('Bad request: ${res.body}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }
}
