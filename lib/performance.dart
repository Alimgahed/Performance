import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:performance/gloables/data.dart';
import 'package:performance/gloables/my_widget.dart';
import 'package:performance/home_controller/add_peroformance_controller.dart';
import 'package:performance/models/department.dart';

class ProfessionalDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

    // Fetch performance data passed via Get.arguments
    IndexData? prof = Get.arguments["preformance"];
    Color? color;

    return Scaffold(
      appBar: AppBar(
        title: Text(prof!.indexName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Left section: List of items with details
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: ListView.builder(
                    itemCount: prof.values.length,
                    itemBuilder: (context, index) {
                      var i = prof.values[index];

                      final period = Period.values[i.indexPeriod];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 16.0),
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          shadowColor: Colors.black.withOpacity(0.2),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // First Row: القيمة (Value)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.attach_money,
                                            color: Colors.blueAccent,
                                            size: 20), // Icon for value
                                        SizedBox(width: 8),
                                        Text(
                                          "القيمة",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${i.indexValue}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 14),

                                // Second Row: القيمة المستهدفة (Target Value)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.trending_up,
                                            color: Colors.green,
                                            size: 20), // Icon for target value
                                        SizedBox(width: 8),
                                        Text(
                                          "القيمة المستهدفة",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${i.estimated}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 14),

                                // Third Row: التاريخ (Date)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.calendar_today,
                                            color: Colors.orange,
                                            size: 20), // Icon for date
                                        SizedBox(width: 8),
                                        Text(
                                          "التاريخ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${i.date.toLocal()}".split(' ')[0],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 14),

                                // Fourth Row: المدة (Duration)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.timer,
                                            color: Colors.purple,
                                            size: 20), // Icon for duration
                                        SizedBox(width: 8),
                                        Text(
                                          "المدة",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      period.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .blueAccent, // Color to highlight the period
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        int? index_id;
                                        int? period;
                                        final AddPerformanceController add =
                                            Get.put(AddPerformanceController());
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: SingleChildScrollView(
                                                child: Form(
                                                  key: globalKey,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize
                                                        .min, // Ensure the dialog is compact
                                                    children: [
                                                      // customTextFormField(
                                                      //   iconData: Icons.ads_click,
                                                      //   controller: add.name,
                                                      //   hintText: 'اسم المؤشر',
                                                      // ),
                                                      const SizedBox(
                                                          height: 10),
                                                      DropdownFormField(
                                                        items: Period.values
                                                            .map((type) {
                                                          return DropdownMenuItem<
                                                              Period>(
                                                            value: type,
                                                            child: Text(type
                                                                .name), // Use the Arabic name via the extension
                                                          );
                                                        }).toList(),
                                                        onChanged:
                                                            (Period? newValue) {
                                                          if (newValue !=
                                                              null) {
                                                            // Handle the value here
                                                            period =
                                                                newValue.index;
                                                          }
                                                        },
                                                        labelText:
                                                            "المدة", // Assuming you are using a translation method
                                                        hintText:
                                                            "المدة", // Assuming you are using a translation method
                                                        prefixIcon: Icons
                                                            .calendar_today,
                                                        iconEnabledColor:
                                                            Colors.blue,
                                                      ),
                                                      const SizedBox(
                                                          height: 10),

                                                      const SizedBox(
                                                          height: 10),
                                                      customTextFormField(
                                                        controller: add.date,
                                                        onTap: () {
                                                          showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime.now(),
                                                          ).then((value) {
                                                            if (value != null) {
                                                              add.date.text =
                                                                  DateFormat.yMd(
                                                                          'ar')
                                                                      .format(
                                                                          value);
                                                              add.start =
                                                                  DateTime(
                                                                      value
                                                                          .year,
                                                                      value
                                                                          .month,
                                                                      value
                                                                          .day);
                                                            }
                                                          });
                                                        },
                                                        hintText: 'التاريخ',
                                                        iconData: Icons
                                                            .calendar_month,
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      customTextFormField(
                                                        iconData:
                                                            Icons.arrow_upward,
                                                        allowOnlyDigits: true,
                                                        controller: add.esmited,
                                                        hintText:
                                                            'الدرجة المتوقعة',
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      customTextFormField(
                                                        iconData:
                                                            Icons.arrow_upward,
                                                        allowOnlyDigits: true,
                                                        controller: add.value,
                                                        hintText:
                                                            'الدرجة الفعلية',
                                                      ),
                                                      customButton(
                                                        text: "حفظ",
                                                        onPressed: () async {
                                                          if (globalKey
                                                              .currentState!
                                                              .validate()) {
                                                            await add.addPerformance(
                                                                period: period
                                                                    .toString(),
                                                                id: index_id!,
                                                                type: 1,
                                                                esmited: add
                                                                    .esmited
                                                                    .text,
                                                                value: add
                                                                    .value.text,
                                                                date:
                                                                    add.start!);
                                                          }
                                                        },
                                                      ),
                                                      // This is where we will handle the add_index call
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text("القيمة المستهدفة",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue, // Set the color dynamically
                            ),
                          ),
                          SizedBox(width: 8),
                          Text("(القيمة الفعلية اكبر من القيمة المستهدفة)",
                              style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red, // Set the color dynamically
                            ),
                          ),
                          SizedBox(width: 8),
                          Text("(القيمة الفعلية اقل من القيمة المستهدفة)",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: BarChart(
                            BarChartData(
                              borderData: FlBorderData(show: false),
                              titlesData: FlTitlesData(
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 50,
                                    reservedSize: 40,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      int index = value.toInt();
                                      var i = prof.values[index];
                                      return Text(
                                        "${i.date.toLocal()}".split(' ')[0],
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              barGroups: prof.values
                                  .asMap()
                                  .entries
                                  .map(
                                    (entry) => BarChartGroupData(
                                      x: entry.key,
                                      barRods: [
                                        BarChartRodData(
                                          toY:
                                              entry.value.indexValue.toDouble(),
                                          width: 16,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: entry.value.estimated <
                                                  entry.value.indexValue
                                              ? Colors
                                                  .blue // Green bar if estimated is less
                                              : Colors
                                                  .red, // Red bar if estimated is more
                                        ),
                                        BarChartRodData(
                                            toY: entry.value.estimated
                                                .toDouble(),
                                            width: 16,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.green),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ValueItem {
  final int indexValue;
  final DateTime date;
  final int indexPeriod;

  ValueItem({
    required this.indexValue,
    required this.date,
    required this.indexPeriod,
  });
}
