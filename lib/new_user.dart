import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:performance/gloables/my_widget.dart';
import 'package:performance/home_controller/register_controller.dart';

// ignore: must_be_immutable
class new_user extends StatelessWidget {
  new_user({super.key});

  int? id;
  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: GetBuilder(
          init: Register_controller(),
          builder: (controller) {
            return Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: customTextFormField(
                          controller: controller.name,
                          iconData: Icons.person,
                          labelText: "اسم المستخدم")),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: DropdownFormField(
                      items: controller.department.map((index) {
                        return DropdownMenuItem<int>(
                          value: index.id,
                          child: Text(index.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        id = value;
                      },
                      labelText: "الادارة",
                      hintText: "الادارة",
                      prefixIcon: Icons.ads_click,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: TextFormField(
                          controller: controller.password,
                          obscureText: true,
                          style: const TextStyle(fontSize: 18.0),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            labelText: "كلمة المرور",
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
                      text: "تسجيل ",
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          controller.register(
                              name: controller.name.text,
                              password: controller.password.text,
                              id: id!);
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
