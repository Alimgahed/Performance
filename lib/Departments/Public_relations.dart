import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:performance/home_controller/add_peroformance_controller.dart';
import 'package:performance/home_controller/get_perforamnce_controler.dart';
import 'package:performance/my_widget.dart';

class PublicRelations extends StatelessWidget {
  const PublicRelations({super.key});

  @override
  Widget build(BuildContext context) {
    final GetPerformanceController performance =
        Get.find();

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
                      content: Column(
                        children: [
                          customTextFormField(
                            controller: add.name,
                            hintText: 'اسم المؤشر',
                          ),
                          Text("بداية المؤشر"),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: customTextFormField(
                                    controller: add.dayFrom,
                                    // labelText: 'اليوم',
                                    hintText: 'أدخل اليوم',
                                    // controller: dayController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'يرجى إدخال اليوم'; // Please enter the day
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: customTextFormField(
                                    controller: add.monthFrom,
                                    // labelText: 'الشهر',
                                    hintText: 'أدخل الشهر',
                                    // controller: monthController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'يرجى إدخال الشهر'; // Please enter the month
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: customTextFormField(
                                    controller: add.yearFrom,
                                    // labelText: 'السنة',
                                    hintText: 'أدخل السنة',
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'يرجى إدخال السنة'; // Please enter the year
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ]),
                          Text(" نهاية المؤشر"),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: customTextFormField(
                                    controller: add.dayTo,
                                    // labelText: 'اليوم',
                                    hintText: 'أدخل اليوم',
                                    // controller: dayController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'يرجى إدخال اليوم'; // Please enter the day
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: customTextFormField(
                                    controller: add.monthTo,
                                    // labelText: 'الشهر',
                                    hintText: 'أدخل الشهر',
                                    // controller: monthController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'يرجى إدخال الشهر'; // Please enter the month
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: customTextFormField(
                                    
                                    controller: add.yearTo,
                                    // labelText: 'السنة',
                                    hintText: 'أدخل السنة',
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'يرجى إدخال السنة'; // Please enter the year
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ]),
                          customTextFormField(
                            controller: add.value,
                            hintText: 'الدرجة',
                          ),
                          customButton(text: "done", onPressed: () {

                            add.addPerformance(id:1, name:add.name.text, value:add.value.text, date:"${add.yearFrom.text}-${add.monthFrom.text}-${add.dayFrom.text}:${add.yearTo.text}-${add.monthTo.text}-${add.dayTo.text}");
                          })
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text("اضافة")),
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
