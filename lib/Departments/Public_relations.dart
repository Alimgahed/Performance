import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:performance/home_controller/add_peroformance_controller.dart';
import 'package:performance/home_controller/get_perforamnce_controler.dart';
import 'package:performance/my_widget.dart';

// ignore: must_be_immutable
class PublicRelations extends StatelessWidget {
  PublicRelations({super.key});
  DateFormat dateFormat = DateFormat('d/M/yyyy');

  @override
  Widget build(BuildContext context) {
    final GetPerformanceController performance =
        Get.put(GetPerformanceController());
    final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

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
          TextButton(
              onPressed: () {
                final AddPerformanceController add =
                    Get.put(AddPerformanceController());
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SingleChildScrollView(
                        child: Form(
                          key: _globalKey,
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Ensure the dialog is compact
                            children: [
                              customTextFormField(
                                iconData: Icons.ads_click,
                                controller: add.name,
                                hintText: 'اسم المؤشر',
                              ),
                              SizedBox(height: 10),
                              customTextFormField(
                                controller: add.date_start,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      add.date_start.text =
                                          DateFormat.yMd('ar').format(value);
                                      add.start = DateTime(
                                          value.year, value.month, value.day);
                                    }
                                  });
                                },
                                hintText: 'بداية التاريخ',
                                iconData: Icons.calendar_month,
                              ),
                              SizedBox(height: 10),
                              customTextFormField(
                                iconData: Icons.calendar_month,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      add.date_end.text =
                                          DateFormat.yMd('ar').format(value);
                                      add.end = DateTime(
                                          value.year, value.month, value.day);
                                    }
                                  });
                                },
                                controller: add.date_end,
                                hintText: 'نهاية التاريخ',
                              ),
                              SizedBox(height: 10),
                              customTextFormField(
                                iconData: Icons.arrow_upward,
                                allowOnlyDigits: true,
                                controller: add.value,
                                hintText: 'الدرجة',
                              ),
                              customButton(
                                text: "حفظ",
                                onPressed: () {
                                  if (_globalKey.currentState!.validate()) {
                                    add.addPerformance(
                                      id: 1,
                                      name: add.name.text,
                                      value: add.value.text,
                                      date_to: DateFormat('yyyy-MM-dd')
                                          .format(add.start!),
                                      date_from: DateFormat('yyyy-MM-dd')
                                          .format(add.end!),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text("اضافة")),

          GetBuilder<GetPerformanceController>(
            builder: (controller) {
              return Expanded(
                child: ListView.builder(
                  itemCount: performance
                      .relations.length, // Number of items in the list
                  itemBuilder: (context, index) {
                    var i =
                        performance.relations[index]; // Get the current item
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0), // Optional padding
                      child: Row(
                        children: [
                          Text("${i.public_releationsName}"),
                          SizedBox(width: 20),
                          Text("${i.public_releationsValue}"),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          )

          // You can add more widgets here to display performance data
        ],
      ),
    );
  }
}
