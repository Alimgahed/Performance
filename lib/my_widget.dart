import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget custom_continer(String? text, Function ontap) {
  return GestureDetector(
    onTap: () {
      ontap();
    },
    child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(child: Text(text!))),
  );
}
