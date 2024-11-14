import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:performance/gloables/data.dart';
import 'package:performance/home_controller/add_peroformance_controller.dart';
import 'package:performance/home_controller/get_perforamnce_controler.dart';
import 'package:performance/gloables/my_widget.dart';

// ignore: must_be_immutable
class PublicRelations extends StatelessWidget {
  DateFormat dateFormat = DateFormat('d/M/yyyy');
  int? index_id;
  int? period;
  PublicRelations({super.key});
  final GetPerformanceController performance =
      Get.put(GetPerformanceController());
  final AddPerformanceController add = Get.put(AddPerformanceController());
  @override
  Widget build(BuildContext context) {
    // Ensure the controller is initialized only once

    final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

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
          // Button to add new index
          TextButton(
              onPressed: () {
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
                              SizedBox(height: 10),
                              DropdownFormField(
                                items: Period.values.map((type) {
                                  return DropdownMenuItem<Period>(
                                    value: type,
                                    child: Text(type
                                        .name), // Use the Arabic name via the extension
                                  );
                                }).toList(),
                                onChanged: (Period? newValue) {
                                  if (newValue != null) {
                                    // Handle the value here
                                    period = newValue.index;
                                    print("Selected Period: ${newValue.index}");
                                  }
                                },
                                labelText:
                                    "المدة", // Assuming you are using a translation method
                                hintText:
                                    "المدة", // Assuming you are using a translation method
                                prefixIcon: Icons.calendar_today,
                                iconEnabledColor: Colors.blue,
                              ),
                              SizedBox(height: 10),
                              DropdownFormField(
                                items: performance.index_names.map((index) {
                                  return DropdownMenuItem<int>(
                                    value: index.id,
                                    child: Text(index.name!),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  index_id = value;
                                },
                                labelText: "اسم المؤشر",
                                hintText: "اسم المؤشر",
                                prefixIcon: Icons.ads_click,
                              ),
                              SizedBox(height: 10),
                              customTextFormField(
                                controller: add.date,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      add.date.text =
                                          DateFormat.yMd('ar').format(value);
                                      add.start = DateTime(
                                          value.year, value.month, value.day);
                                    }
                                  });
                                },
                                hintText: 'التاريخ',
                                iconData: Icons.calendar_month,
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
                                onPressed: () async {
                                  if (globalKey.currentState!.validate()) {
                                    await add.addPerformance(
                                        period: period.toString(),
                                        id: index_id!,
                                        type: 1,
                                        value: int.parse(add.value.text),
                                        date: add.start!);
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
              child: Text("اضافة")),

          TextButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: Form(
                        key: globalKey,
                        child: Column(
                          mainAxisSize:
                              MainAxisSize.min, // Ensure the dialog is compact
                          children: [
                            customTextFormField(
                              iconData: Icons.ads_click,
                              controller: add.name,
                              hintText: 'اسم المؤشر',
                            ),
                            SizedBox(height: 10),

                            customButton(
                              text: "حفظ",
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  // Add performance when data is validated
                                  add.add_index(id: 1, name: add.name.text);
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
              //             void add_index({int? id, required String name}) {
              //   // Here you can do your backend request and logic
              //   // For now, we add the new index to the list directly
              //   var newIndex = get_indx_name(name: name, dep_id: id);
              //  performance. index_names.add(newIndex);  // Add to the reactive list
              //   update(); // Update the controller and notify listeners
              // }
            },
            child: Text("اضافة مؤشر"),
          ),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemCount: performance
                    .index_names.length, // Reactive length of the list
                itemBuilder: (context, index) {
                  var i = performance.index_names[index]; // Reactive item
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 400,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                                255, 241, 241, 241), // Background color
                            borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26, // Subtle shadow color
                                offset: Offset(
                                    0, 4), // Shadow direction (downwards)
                                blurRadius: 6, // Blur radius for softness
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                                24.0), // Add extra padding for spacing
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align items to start
                              children: [
                                // First Row (اسم المؤشر)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Space between elements
                                  children: [
                                    Text(
                                      "اسم المؤشر",
                                      style: TextStyle(
                                        fontSize:
                                            16, // Slightly larger font size for readability
                                        fontWeight: FontWeight
                                            .bold, // Bold for prominence
                                        color:
                                            Colors.black87, // Dark text color
                                      ),
                                    ),
                                    Text(
                                      i.name!, // Assuming 'i' is a valid object
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors
                                            .black54, // Slightly lighter color for secondary text
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height:
                                        12), // Increased spacing between rows
                                // Second Row (التاريخ)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "التاريخ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      i.dep_id
                                          .toString(), // Assuming 'i.dep_id' is a valid number or string
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
