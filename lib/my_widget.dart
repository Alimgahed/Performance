import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget custom_continer({
  String? text,
  required Function ontap,
  Color? color = const Color.fromARGB(255, 215, 212, 212),
  Color borderColor = Colors.black,
  double borderRadius = 12.0,
  double borderWidth = 2.0,
  Color textColor = Colors.black,
}) {
  return GestureDetector(
    onTap: () => ontap(),
    child: Container(
      height: 90,
      width: 150,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text ?? '',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    ),
  );
}
