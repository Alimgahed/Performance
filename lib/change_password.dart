import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:performance/gloables/my_widget.dart';
import 'package:performance/home_controller/change_password_controller.dart';
import 'package:performance/home_controller/register_controller.dart';

// ignore: must_be_immutable
class change_password extends StatelessWidget {
  change_password({super.key});

  int? id;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: GetBuilder(
          init: ChangePasswordController(),
          builder: (controller) {
            return Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: TextFormField(
                          controller: controller.password,
                          obscureText: true,
                          style: const TextStyle(fontSize: 18.0),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: "كلمة المرور الجديدة",
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Colors.blue,
                            ),

                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.blue,
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
                            filled:
                                true, // Add this if you want the fill color to be visible
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "يرجى إدخال قيمة";
                            }
                            return null;
                          })),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: TextFormField(
                          controller: controller.passwordconfirm,
                          obscureText: true,
                          style: const TextStyle(fontSize: 18.0),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: "تأكيد كلمة المرور",
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Colors.blue,
                            ),

                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.blue,
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
                            filled:
                                true, // Add this if you want the fill color to be visible
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "يرجى إدخال قيمة";
                            }
                            return null;
                          })),
                  const SizedBox(
                    height: 15,
                  ),
                  customButton(
                      text: "تأكيد",
                      onPressed: () {
                        if (controller.password.text ==
                                controller.passwordconfirm.text &&
                            globalKey.currentState!.validate()) {
                          controller.change_password(
                            password: controller.password.text,
                          );
                        } else {
                          showCustomErrorDialog(
                              iconColor: Colors.red,
                              buttonColor: Colors.red,
                              title: "خطأ",
                              errorMessage: "كلمة السر غير متطابقة",
                              titleColor: Colors.red);
                        }
                      })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
