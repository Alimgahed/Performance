import 'package:flutter/material.dart';
import 'package:performance/my_widget.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool sector = false;
  bool commercial = false;
  bool employment = false;
  bool financial = false;
  bool planning = false;
  bool hr = false;
  bool projects = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "مؤشر الأداء",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage("images/55.png"),
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
              custom_continer(
                  color: Colors.blue,
                  text: "رئيس مجلس الادارة والعضو المنتدب",
                  ontap: () {
                    setState(() {
                      sector = !sector;
                    });
                  }),
              Visibility(
                visible: sector,
                child: Column(
                  children: [
                    const Icon(Icons.arrow_downward),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            custom_continer(
                                color: Colors.yellow,
                                text: "قطاع الموارد البشرية والتدريب",
                                ontap: () {
                                  setState(() {
                                    hr = !hr;
                                  });
                                }),
                            if (hr)
                              Column(
                                children: [
                                  const Icon(Icons.arrow_downward),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      text: "الإدارة العامة للموارد البشرية",
                                      ontap: () {}),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      text: "الإدارة العامة للتدريب",
                                      ontap: () {}),
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
                                ontap: () {
                                  setState(() {
                                    commercial = !commercial;
                                  });
                                }),
                            if (commercial)
                              Column(
                                children: [
                                  const Icon(Icons.arrow_downward),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      text:
                                          "الإدارة العامة للاشتراكات والعدادات",
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
                                ontap: () {
                                  setState(() {
                                    financial = !financial;
                                  });
                                }),
                            if (financial)
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
                                ontap: () {
                                  setState(() {
                                    planning = !planning;
                                  });
                                }),
                            if (planning)
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
                                      text:
                                          "الإدارة العامة للتحليل الهيدروليكي",
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
                                ontap: () {
                                  setState(() {
                                    projects = !projects;
                                  });
                                }),
                            if (projects)
                              Column(
                                children: [
                                  const Icon(Icons.arrow_downward),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      text:
                                          "الإدارة العامة للمقايسات والتصميمات",
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
                            custom_continer(
                                color: Colors.yellow,
                                text: "قطاع التشغيل والصيانة",
                                ontap: () {
                                  setState(() {
                                    employment = !employment;
                                  });
                                }),
                            if (employment)
                              Column(
                                children: [
                                  const Icon(Icons.arrow_downward),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      text: "قطاع التشغيل والصيانة",
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
                                text: "قطاع الدعم الفني",
                                ontap: () {}),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
