import 'package:flutter/material.dart';

Widget customTextFormField({
  String? labelText,
  required String hintText,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (value) {
        // Default validation: check if the input is empty
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال قيمة'; // Please enter a value
        }
        // Additional validation can be added here
        if (validator != null) {
          return validator(value); // Use custom validator if provided
        }
        return null; // Return null if validation passes
      },
      textAlign: TextAlign.right, // Align hint text to the right
      textDirection: TextDirection.rtl, // Set text direction to right-to-left
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
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
      ),
    ),
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
