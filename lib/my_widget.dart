import 'package:flutter/material.dart';

Widget custom_continer(String? text, Function ontap) {
  return GestureDetector(
    onTap: () {
      ontap();
    },
    child: Container(
      height: 90,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text!,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    ),
  );
}
