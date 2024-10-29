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
  bool hr = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header row that stays fixed at the top
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
              custom_continer("رئيس مجلس الادارة", () {
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
                            custom_continer("قطاع الموارد البشرية والتدريب",
                                () {
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
                                      "الإدارة العامة للموارد البشرية", () {}),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      "الإدارة العامة للتدريب", () {}),
                                ],
                              ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            custom_continer("قطاع الشئون التجارية", () {
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
                                      "الإدارة العامة للاشتراكات والعدادات",
                                      () {}),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      "الإدارة العامة لحسابات المشتركين والاصدار",
                                      () {}),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      "الإدارة العامة لكبار المشتركين", () {}),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      "الإدارة العامة لخدمة العملاء", () {}),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      "الإدارة العامة للإيرادات والتحصيل",
                                      () {}),
                                ],
                              ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            custom_continer("القطاع المالي", () {
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
                                      "الإدارة العامة للشئون المالية", () {}),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      "الإدارة العامة للمخازن ", () {}),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      "الإدارة العامة للعقود والمشتريات ",
                                      () {}),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      "الإدارة العامة للمراجعة", () {}),
                                  const SizedBox(height: 10),
                                  custom_continer(
                                      "الإدارة العامة للشؤن الإدارية", () {}),
                                ],
                              ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            custom_continer("قطاع التشغيل والصيانة", () {
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
                                      "قطاع التشغيل والصيانة", () {}),
                                ],
                              ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            custom_continer("قطاع الدعم الفني", () {}),
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
