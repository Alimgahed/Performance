import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void showSuccessToast(String message) {
  Get.snackbar(
    'تم', // Title of the snackbar (can be omitted or localized)
    message, // The message to show
    snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
    backgroundColor: Colors.green, // Background color
    colorText: Colors.white, // Text color
    duration: const Duration(
        seconds: 2), // Duration for how long it should be displayed
    margin: const EdgeInsets.all(10), // Margin around the snackbar
    borderRadius: 8, // Border radius
    icon: const Icon(Icons.check_circle, color: Colors.white), // Optional icon
  );
}

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
    style: const TextStyle(fontSize: 18.0),
    textAlign: TextAlign.right,
    textDirection: TextDirection.rtl,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: Icon(
        iconData,
        color: Color(0xFF000C3E),
      ),
      fillColor: Colors.white,
      focusColor: Colors.white,
      hoverColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFF000C3E),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFF000C3E),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      labelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
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

void showCustomErrorDialog({
  required String errorMessage,
  required String? title,
  IconData icon = Icons.error_outline, // You can change the icon if needed
  required Color? titleColor, // Default error title color
  required Color? buttonColor,
  required Color? iconColor, // Default icon color
}) {
  Get.defaultDialog(
    title: title!,
    titleStyle: TextStyle(
      color: titleColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    content: Column(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 50,
        ),
        const SizedBox(height: 10),
        Text(
          errorMessage.tr,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    radius: 15,
    backgroundColor: Colors.white,
    barrierDismissible: false,
    confirm: ElevatedButton(
      onPressed: () {
        Get.back();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: const Text(
        'موافق',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
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
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
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

// ignore: non_constant_identifier_names
Widget DropdownFormField<T>({
  required List<DropdownMenuItem<T>> items,
  required void Function(T?) onChanged,
  T? initialValue,
  required String labelText,
  required String hintText,
  IconData? prefixIcon,
  IconData? dropdownIcon,
  Color? iconEnabledColor,
  String? Function(T?)? validator,
  bool useValidator = true,
}) {
  return DropdownButtonFormField<T>(
    value: initialValue,
    items: items,
    onChanged: onChanged,
    validator: useValidator
        ? validator ??
            (value) {
              if (value == null) {
                return 'This field cannot be empty';
              } else {
                return null;
              }
            }
        : null,
    icon: dropdownIcon != null ? Icon(dropdownIcon) : null,
    iconEnabledColor: iconEnabledColor,
    iconDisabledColor: Colors.blue,
    decoration: InputDecoration(
      hoverColor: Colors.white,
      focusColor: Colors.white,

      // Optional prefixIcon if provided
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: Colors.blue,
            )
          : null,

      fillColor: Colors.white, // Fill color for the dropdown
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
      // Ensure labelText and hintText are added correctly
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 14, // Slightly larger font size for better visibility
      ),
      labelText: labelText, // Display the label text
      hintText: hintText, // Display the hint text
    ),
  );
}

Widget customButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF000C3E), // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
