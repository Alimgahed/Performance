import 'dart:convert'; // Import this for json decoding
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:performance/models/public_releations.dart';

class GetPerformanceController extends GetxController {
  var index_names = <get_indx_name>[].obs;

  @override
  void onInit() {
    print(index_names);
    get_index(id: 1);
    update();
    super.onInit();
  }

  void add_index({int? id, required String name}) {
    print(index_names);
    index_names.add(get_indx_name(id: id, name: name));
    for (var i in index_names) {
      print(i.name);
    }
    update();
  }

// Adjusted naming to PascalCase

  // ignore: non_constant_identifier_names
  Future<void> get_index({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse("http://172.16.16.7:3000/department/$id"),
      );

      if (res.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(res.body);
        index_names.value =
            jsonData.map((item) => get_indx_name.fromJson(item)).toList();
        update();
        print(index_names);
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
