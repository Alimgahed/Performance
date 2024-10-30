import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  Future<void> register_code(
      //  String age,
      //  String name,
      //  String phone,
      //  int stdying_yaer,
      //  String password,
      //  String email,
      ) async {
    try {
      final res = await http.post(
        Uri.parse("http://172.16.16.7:3000/register"),
        headers: {"lang": "AR"},
        body: {
          "name": "ali",
          "age": "12",
          "dep_id": "1",
          "email": "ali@yahoo.com",
          "password": "123",
          "studying_year": "1",
        },
      );

      if (res.statusCode == 200) {
        print(res.body);
      } else if (res.statusCode == 400) {}
    } catch (e) {
      print(e.toString());
    }
  }
}
