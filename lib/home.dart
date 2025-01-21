import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:performance/change_password.dart';
import 'package:performance/gloables/data.dart';
import 'package:performance/gloables/my_widget.dart';
import 'package:http/http.dart' as http;
import 'package:performance/home_controller/get_perforamnce_controler.dart';
import 'package:performance/login.dart';

import 'package:performance/new_user.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("الهيكل الأداري")),
        actions: [
          Obx(() {
            return Visibility(
              visible: id.value, // Assuming 'id' is an Rx variable
              child: TextButton(
                onPressed: () {
                  Get.to(() => new_user());
                },
                child: const Text(
                  "تسجيل مستخدم",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          }),

          TextButton(
            onPressed: () async {
              Get.offAll(() => Login());
              await http.get(
                Uri.parse("http://172.16.24.115:3000/logout"),
              );
            },
            child: const Text("تسجيل خروج",
                style: TextStyle(
                  color: Colors.blue,
                )),
          ),
          TextButton(
            onPressed: () async {
              Get.to(() => change_password());
            },
            child: const Text("تغيير كلمة المرور",
                style: TextStyle(
                  color: Colors.blue,
                )),
          ),
          // You can also add more buttons here in the future if needed.
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              custom_continer(
                  color: Colors.blue,
                  text: "رئيس مجلس الادارة والعضو المنتدب",
                  ontap: () {}),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  const Icon(Icons.arrow_downward),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      custom_continer(
                          text: "الإدارة العامة للشئون القانونية والاملاك",
                          ontap: () {
                            // controller.register_code();
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      custom_continer(
                          text: "الإدارة العامة لمكتب رئيس مجلس الإدارة",
                          ontap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      custom_continer(
                          text: "الإدارة العامة للمراجعة الداخلية والتفتيش ",
                          ontap: () {}),
                      const SizedBox(
                        width: 5,
                      ),
                      custom_continer(
                          text: "الإدارة العامة للسلامة والصحة المهنية",
                          ontap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      custom_continer(
                          text: "الإدارة العامة للامن", ontap: () {}),
                      const SizedBox(
                        width: 5,
                      ),
                      custom_continer(
                          text: "الإدارة العامة للمكتب الفني", ontap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      custom_continer(
                          text: "الإدارة العامة لتكنولوجيا المعلومات",
                          ontap: () {}),
                      const SizedBox(
                        width: 5,
                      ),
                      custom_continer(
                          text: "الإدارة العامة للتحليل الاقتصادي",
                          ontap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  custom_continer(
                      text: "الإدارة العامة للعلاقات العامة وخدمة المواطنين",
                      ontap: () {
                        Get.put(GetPerformanceController());
                      }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          custom_continer(
                              color: Colors.yellow,
                              text: "قطاع الموارد البشرية والتدريب",
                              ontap: () {}),
                          Column(
                            children: [
                              const Icon(Icons.arrow_downward),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للموارد البشرية",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للتدريب", ontap: () {}),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          custom_continer(
                              color: Colors.yellow,
                              text: "قطاع الشئون التجارية",
                              ontap: () {}),
                          Column(
                            children: [
                              const Icon(Icons.arrow_downward),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للاشتراكات والعدادات",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text:
                                      "الإدارة العامة لحسابات المشتركين والاصدار",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة لكبار المشتركين",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة لخدمة العملاء",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للإيرادات والتحصيل",
                                  ontap: () {}),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          custom_continer(
                              color: Colors.yellow,
                              text: "القطاع المالي",
                              ontap: () {}),
                          Column(
                            children: [
                              const Icon(Icons.arrow_downward),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للشئون المالية",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للمخازن ",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للعقود والمشتريات ",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للمراجعة",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للشؤن الإدارية",
                                  ontap: () {}),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          custom_continer(
                              color: Colors.yellow,
                              text: "قطاع التخطيط",
                              ontap: () {}),
                          Column(
                            children: [
                              const Icon(Icons.arrow_downward),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text:
                                      "الإدارة العامة لنظم المعلومات الجغرافية GIS",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للتحليل الهيدروليكي",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للمخطط العام",
                                  ontap: () {}),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          custom_continer(
                              color: Colors.yellow,
                              text: "قطاع المشروعات",
                              ontap: () {}),
                          Column(
                            children: [
                              const Icon(Icons.arrow_downward),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للمقايسات والتصميمات",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text:
                                      " الإدارة العامةالإشراف ومتابعة تنفيذ المشروعات",
                                  ontap: () {}),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text:
                                      " الإدارة العامة للتنفيذ الذاتي والتنفيذ للغير",
                                  ontap: () {}),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 90,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(12),
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 4),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "قطاع التشغيل والصيانة",
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      Text(
                                        "مياه-صرف",
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const Icon(Icons.arrow_downward),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  custom_continer(
                                      text: "الإدارة العامة لفرع سمالوط",
                                      ontap: () {}),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  custom_continer(
                                      text: "الإدارة العامة لفرع المنيا",
                                      ontap: () {}),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  custom_continer(
                                      text: "الإدارة العامة لفرع مطاي",
                                      ontap: () {}),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  custom_continer(
                                      text: "الإدارة العامة لفرع ابوقرقاص",
                                      ontap: () {}),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  custom_continer(
                                      text: "الإدارة العامة لفرع بني مزار",
                                      ontap: () {}),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  custom_continer(
                                      text: "الإدارة العامة لفرع ملوي",
                                      ontap: () {}),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  custom_continer(
                                      text: "الإدارة العامة لفرع مغاغة",
                                      ontap: () {}),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  custom_continer(
                                      text: "الإدارة العامة لفرع ديرمواس",
                                      ontap: () {}),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              custom_continer(
                                  text: "الإدارة العامة لفرع العدوة",
                                  ontap: () {}),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          custom_continer(
                              color: Colors.yellow,
                              text:
                                  "قطاع المعامل المركزية والبيئة ومراقبة الجودة",
                              ontap: () {}),
                          Column(
                            children: [
                              const Icon(Icons.arrow_downward),
                              const SizedBox(
                                height: 10,
                              ),
                              custom_continer(
                                  text:
                                      "الإدارة العامة لمعامل محطات مياه الشرب",
                                  ontap: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              custom_continer(
                                  text:
                                      "الإدارة العامة للمعمل المركزي لمياه الشرب",
                                  ontap: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              custom_continer(
                                  text:
                                      "الإدارة العامة لمعامل محطات الصرف الصحي",
                                  ontap: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              custom_continer(
                                  text:
                                      "الإدارة العامة للمعمل المركزي للصرف الصحي والصناعي",
                                  ontap: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              custom_continer(
                                  text: "الإدارة العامة للجودة وشئون البيئة",
                                  ontap: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              custom_continer(
                                  text: "الإدارة العامة للصرف الصناعي",
                                  ontap: () {}),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          custom_continer(
                              color: Colors.yellow,
                              text: "قطاع الدعم الفني",
                              ontap: () {}),
                          Column(
                            children: [
                              const Icon(Icons.arrow_downward),
                              const SizedBox(height: 10),
                              custom_continer(
                                  text: "الإدارة العامة للدعم الفني للمياه",
                                  ontap: () {}),
                              const SizedBox(height: 5),
                              custom_continer(
                                  text:
                                      "الإدارة العامة للدعم الفني للصرف الصحي",
                                  ontap: () {}),
                              const SizedBox(height: 5),
                              custom_continer(
                                  text:
                                      "الإدارة العامة للمياه الغير محاسب عليها وتقليل الفاقد",
                                  ontap: () {}),
                              const SizedBox(height: 5),
                              custom_continer(
                                  text:
                                      "الإدارة العامة لترشيدالطاقة الكهربائية",
                                  ontap: () {}),
                              const SizedBox(height: 5),
                              custom_continer(
                                  text:
                                      "الإدارة العامة للحملة الميكانيكيه والورش",
                                  ontap: () {}),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
