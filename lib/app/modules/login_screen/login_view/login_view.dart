import 'package:flutter/material.dart';
import 'package:forex_trade/app/modules/login_screen/login_controller/login_controller.dart';
import 'package:forex_trade/app/routes/app_pages.dart';
import 'package:forex_trade/app/utils/Colors.dart';
import 'package:forex_trade/app/utils/button_widget.dart';
import 'package:forex_trade/app/utils/forx_trade_Name.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          AppName(),
          SizedBox(height: 25),

          Form(
            key: controller.formKeyLogin,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.grey.withOpacity(0.2),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is Required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  Obx(
                    () => TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.passwordController,
                      obscureText: controller.isVisible.value,

                      decoration: InputDecoration(
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: "Enter Password",
                        prefixIcon: Icon(Icons.key),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.isVisible.value =
                                !controller.isVisible.value;
                            print(
                              "visible value ${controller.isVisible.value}",
                            );
                          },
                          child: Icon(
                            controller.isVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  MyButton(
                    width: Get.width,
                    height: 50,
                    buttonName: "Login",
                    fontSize: 26,
                    textColor: MyColors.white,
                    backgroundColor: MyColors.blue.withOpacity(1),
                    borderRadius: 15,
                    onTap: () {
                      controller.submit();
                    },
                  ),
                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.DASHBOARD_SCREEN);
                        },
                        child: Text(
                          "Forget Password",
                          style: TextStyle(color: MyColors.blue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.SIGNUP_SCREEN);
                        },
                        child: Text(
                          "Don't have an account? SignUp",
                          style: TextStyle(color: MyColors.blue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
