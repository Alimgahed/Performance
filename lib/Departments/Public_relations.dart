import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:performance/home_controller/get_perforamnce_controler.dart';

class PublicRelations extends StatelessWidget {
  const PublicRelations({super.key});

  @override
  Widget build(BuildContext context) {
    final GetPerformanceController performance =
        Get.find(); // Use Get.find() here

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "الإدارة العامة للعلاقات العامة وخدمة المواطنين",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          for (var i in performance.relations)
            Row(
              children: [
                Text("${i.public_releationsName}"),
                SizedBox(
                  width: 20,
                ),
                Text("${i.public_releationsValue}")
              ],
            ),
          // You can add more widgets here to display performance data
        ],
      ),
    );
  }
}
