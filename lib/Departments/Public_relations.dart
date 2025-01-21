import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:performance/gloables/data.dart';
import 'package:performance/home_controller/add_peroformance_controller.dart';
import 'package:performance/home_controller/get_perforamnce_controler.dart';
import 'package:performance/gloables/my_widget.dart';
import 'package:performance/performance.dart';
import 'package:performance/search_controller.dart';

// ignore: must_be_immutable
class PublicRelations extends StatelessWidget {
  DateFormat dateFormat = DateFormat('d/M/yyyy');

  // ignore: non_constant_identifier_names
  int? index_id;
  int? period;
  PublicRelations({super.key});
  // Accessing the controller where it's needed
  final GetPerformanceController performance =
      Get.find<GetPerformanceController>();

  final AddPerformanceController add = Get.put(AddPerformanceController());
  final Search_Controller searchController = Get.put(Search_Controller());

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is initialized only once
    final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          // Display the search field if searching is true, otherwise show the regular title
          return searchController.isSearching.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width:
                        200, // Control the width of the TextField inside leading
                    child: TextField(
                      onChanged: searchController.updateSearchQuery,
                      controller: searchController.search,
                      decoration: InputDecoration(
                        hintText: 'ابحث باسم المؤشر',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black),
                      // Correctly handle nullable
                    ),
                  ),
                )
              : const Text(
                  "الإدارة العامة للعلاقات العامة وخدمة المواطنين",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                );
        }),
        leading: IconButton(
          icon: Icon(
              searchController.isSearching.value ? Icons.close : Icons.search),
          onPressed: () {
            searchController.toggleSearch(); // Toggle search state
          },
        ),
        actions: [
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
                              const SizedBox(height: 10),
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
                                  }
                                },
                                labelText:
                                    "المدة", // Assuming you are using a translation method
                                hintText:
                                    "المدة", // Assuming you are using a translation method
                                prefixIcon: Icons.calendar_today,
                                iconEnabledColor: Colors.blue,
                              ),
                              const SizedBox(height: 10),
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
                              const SizedBox(height: 10),
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
                              const SizedBox(height: 10),
                              customTextFormField(
                                iconData: Icons.arrow_upward,
                                allowOnlyDigits: true,
                                controller: add.esmited,
                                hintText: 'الدرجة المتوقعة',
                              ),
                              const SizedBox(height: 10),
                              customTextFormField(
                                iconData: Icons.arrow_upward,
                                allowOnlyDigits: true,
                                controller: add.value,
                                hintText: 'الدرجة الفعلية',
                              ),
                              customButton(
                                text: "حفظ",
                                onPressed: () async {
                                  if (globalKey.currentState!.validate()) {
                                    await add.addPerformance(
                                        period: period.toString(),
                                        id: index_id!,
                                        type: 1,
                                        esmited: add.esmited.text,
                                        value: add.value.text,
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
              child: const Text("اضافة",
                  style: TextStyle(
                    color: Colors.blue,
                  ))),
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
                            const SizedBox(height: 10),
                            customTextFormField(
                              iconData: Icons.ads_click,
                              controller: add.index_type,
                              hintText: 'نوع المؤشر',
                            ),

                            customButton(
                              text: "حفظ",
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  // Add performance when data is validated
                                  add.add_index(
                                      id: 1,
                                      names: add.name.text,
                                      index_type: add.index_type.toString());
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
            child: const Text("اضافة مؤشر",
                style: TextStyle(
                  color: Colors.blue,
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          GetBuilder<GetPerformanceController>(builder: (controller) {
            return Expanded(child: Obx(
              () {
                // Filter the items based on search query
                var filteredItems = controller.index_names.where((i) {
                  return i.name?.toLowerCase().contains(
                          searchController.searchQuery.value.toLowerCase()) ??
                      false;
                }).toList();

                return ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    var i = filteredItems[index]; // Use filtered items here
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () async {
                          controller.data = null;
                          await controller.get_perofrmance(id: i.id!);
                          if (controller.data != null) {
                            Get.to(() => ProfessionalDesignScreen(),
                                arguments: {"preformance": performance.data});
                          } else {
                            showCustomErrorDialog(
                              iconColor: const Color.fromARGB(255, 181, 184, 9),
                              titleColor:
                                  const Color.fromARGB(255, 181, 184, 9),
                              buttonColor:
                                  const Color.fromARGB(255, 181, 184, 9),
                              errorMessage: "لا يوجد بيانات لهذا المؤشر",
                              title: 'تحذير',
                            );
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 400,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 241, 241, 241),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // First Row (اسم المؤشر)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "اسم المؤشر",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          i.name ?? "",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "نوع المؤشر",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          i.type ?? "",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            add.delete_index(
                                                id: i.dep_id, index_id: i.id);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            add.index_type =
                                                TextEditingController(
                                                    text: i.type);
                                            add.name = TextEditingController(
                                                text: i.name);

                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Form(
                                                      key: globalKey,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          customTextFormField(
                                                            iconData:
                                                                Icons.ads_click,
                                                            controller:
                                                                add.name,
                                                            hintText:
                                                                'اسم المؤشر',
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          customTextFormField(
                                                            iconData:
                                                                Icons.ads_click,
                                                            controller:
                                                                add.index_type,
                                                            hintText:
                                                                'نوع المؤشر',
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          customButton(
                                                            text: "حفظ",
                                                            onPressed: () {
                                                              if (globalKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                add.edit_index(
                                                                  id: i.dep_id,
                                                                  index_id:
                                                                      i.id,
                                                                  index_type: add
                                                                      .index_type
                                                                      .text,
                                                                  names: add
                                                                      .name
                                                                      .text,
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
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ));
          })
        ],
      ),
    );
  }
}
