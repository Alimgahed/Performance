import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:performance/gloables/my_widget.dart';
import 'package:performance/home_controller/login_controller.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image as background covering the whole screen
          Positioned.fill(
            child: Image(
              image: AssetImage('images/water-1-scaled.jpeg'),
              fit: BoxFit.cover, // Ensure the image covers the entire screen
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First container with 20% of the width
                  _buildFormContainer(context),
                  // Second container with 32% of the width
                  _buildInfoContainer(context),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build the form container with a shadow
  Widget _buildFormContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Form(
        key: globalKey,
        child: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(image: AssetImage("images/images.png")),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: customTextFormField(
                    controller: controller.name,
                    labelText: "اسم المستخدم",
                    iconData: Icons.person,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: _buildPasswordField(controller),
                ),
                const SizedBox(height: 15),
                customButton(
                  text: "تسجيل دخول",
                  onPressed: () {
                    if (globalKey.currentState!.validate()) {
                      controller.Login(
                          controller.name.text, controller.password.text);
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Password TextFormField with decoration and validation
  Widget _buildPasswordField(LoginController controller) {
    return TextFormField(
      controller: controller.password,
      obscureText: true,
      style: const TextStyle(fontSize: 18.0),
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        labelText: "كلمة المرور",
        prefixIcon: const Icon(
          Icons.key,
          color: Color(0xFF000C3E),
        ),
        fillColor: Colors.white,
        focusColor: Colors.white,
        hoverColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF000C3E)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF000C3E)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "يرجى إدخال قيمة";
        }
        return null;
      },
    );
  }

  // Build the information container with a shadow
  Widget _buildInfoContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.32,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(
                "سجل الدخول لتتبع تقدمك وأهدافك",
                style: GoogleFonts.amiri(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "اتخذ قراراتك بناءً على بيانات دقيقة. منصة متقدمة تقدم تحليلات عميقة لأدائك، مما يساعدك على تحديد المجالات التي تحتاج إلى تحسين واتخاذ الخطوات اللازمة لتحقيق النجاح. اكتشف قيمة بياناتك الآن.",
              style: GoogleFonts.amiri(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
