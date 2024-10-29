import 'package:flutter/material.dart';
import 'package:performance/my_widget.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool sector = false;
  bool commercial = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                custom_continer("رئيس مجلس الادارة", () {
                  setState(() {
                    sector = !sector;
                  });
                }),
                // Arrow
                Visibility(
                    visible: sector, child: const Icon(Icons.arrow_downward)),
                Visibility(
                  visible: sector,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          custom_continer("القطاع التجاري", () {
                            setState(() {
                              commercial = !commercial;
                            });
                          }),
                          const SizedBox(
                            height: 10,
                          ),
                          if (commercial == true)
                            Column(
                              children: [
                                custom_continer("القطاع التجاري", () {}),
                                const SizedBox(
                                  height: 10,
                                ),
                                custom_continer("القطاع التجاري", () {}),
                                const SizedBox(
                                  height: 10,
                                ),
                                custom_continer("القطاع التجاري", () {}),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          custom_continer("القطاع المالي", () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          custom_continer("القطاع المالي", () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          custom_continer("القطاع المالي", () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          custom_continer("القطاع المالي", () {}),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          custom_continer("قطاع التشغيل والصيانة", () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          custom_continer("قطاع التشغيل والصيانة", () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          custom_continer("قطاع التشغيل والصيانة", () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          custom_continer("قطاع التشغيل والصيانة", () {}),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          custom_continer("قطاع الدعم الفني", () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          custom_continer("قطاع الدعم الفني", () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          custom_continer("قطاع الدعم الفني", () {}),
                          const SizedBox(
                            height: 10,
                          ),
                          custom_continer("قطاع الدعم الفني", () {}),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
