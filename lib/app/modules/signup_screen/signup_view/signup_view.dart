import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:forex_trade/app/modules/signup_screen/signup_controller/signup_controller.dart';
import 'package:forex_trade/app/utils/Colors.dart';
import 'package:forex_trade/app/utils/button_widget.dart';
import 'package:forex_trade/app/utils/forx_trade_Name.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> {
  final _formKeySignUp = GlobalKey<FormState>();

  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 50),
        children: [
          Center(child: AppName()),
          SizedBox(height: 25),
          Form(
            key: _formKeySignUp,
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
                    controller: controller.fNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter  First Name",
                      label: Text("Enter  First name"),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "First name is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.lNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter your Last Name",
                      label: Text("Enter last name"),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Last name is required";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Age",
                      label: Text("Age"),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Age";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.genderController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Gender",
                      label: Text("Gender"),
                      prefixIcon: Icon(Icons.person_add),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Gender";
                      }
                      return null;
                    },
                  ),

                  // SizedBox(height: 10),

                  // TextFormField(
                  //   controller: controller.phoneController,
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     hintText: "Phone",
                  //     label: Text("Phone Number"),
                  //     prefixIcon: Icon(Icons.phone),
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Phone is Required";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  SizedBox(height: 10),

                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter Email",
                      label: Text("Enter Email"),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is Required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.passwordController,
                      obscureText: controller.isVisible.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: "Enter Password",
                        label: Text("Enter Passwor"),
                        prefixIcon: Icon(Icons.lock_outline),
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
                    buttonName: "Register",
                    fontSize: 26,
                    textColor: MyColors.white,
                    backgroundColor: MyColors.blue.withOpacity(0.5),
                    borderRadius: 15,
                    onTap: () {
                      if (_formKeySignUp.currentState!.validate()) {
                        controller.signUp();
                        // controller.sendOtp();
                      }
                    },
                  ),
                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.offAndToNamed(AppRoutes.LOGIN_SCREEN);
                          _dialogBuilder(
                            context,
                            controller: controller.otpVerification,
                            onTap: () {
                              print('OTP is : ${controller.sendOtp()}');

                              EasyLoading.showToast(
                                "OTP Submitted Clicked ${controller.otpVerification.text}",
                              );
                            },
                          );
                        },
                        child: Text(
                          "Login",
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

Future<void> _dialogBuilder(
  BuildContext context, {
  VoidCallback? onTap,
  TextEditingController? controller,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("User Verification...."),
        content: TextField(
          controller: controller,
          maxLength: 4,
          keyboardType: TextInputType.number,
          // Limits input to 4 characters
          decoration: InputDecoration(
            labelText: 'Enter 4 characters',
            counterText: "",
          ),
        ),

        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          TextButton(onPressed: onTap, child: Text("Submit OTP")),
        ],
      );
    },
  );
}
