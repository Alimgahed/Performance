import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextFormField({
  TextEditingController? controller,
  String? labelText,
  String? hintText,
  Function()? onTap,
  Function(String)? changed,
  Function()? onEditingComplete,
  bool? readonly,
  IconData? iconData,
  String? Function(String?)? validator,
  bool allowOnlyDigits = false,
  bool useValidator = true,
  bool? secure,
}) {
  return TextFormField(
    obscureText: secure ?? false,
    controller: controller,
    onTap: onTap,
    readOnly: readonly ?? false,
    keyboardType: allowOnlyDigits ? TextInputType.number : TextInputType.text,
    inputFormatters: allowOnlyDigits
        ? <TextInputFormatter>[
            FilteringTextInputFormatter.allow(
              RegExp(r'^\d*\.?\d*$'), // Allow digits and optional decimal point
            ),
          ]
        : null,
    style: TextStyle(fontSize: 18.0),
    textAlign: TextAlign.right,
    textDirection: TextDirection.rtl,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: Icon(
        iconData,
        color: Colors.blue,
      ),
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 12,
      ),
      filled: true, // Add this if you want the fill color to be visible
    ),
    validator: useValidator
        ? validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return "يرجى إدخال قيمة";
              }
              return null;
            }
        : null,
    onChanged: changed,
    onEditingComplete: onEditingComplete,
  );
}

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

Widget customButton({
  required String text,
  required VoidCallback onPressed,
  Color color = Colors.blue,
  Color textColor = Colors.white,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: color, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    ),
  );
}
