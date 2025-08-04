import 'package:flutter/material.dart';
import 'package:forex_trade/app/modules/splash_screen/splash_controller/splash_controller.dart';
import 'package:forex_trade/app/routes/app_pages.dart';
import 'package:forex_trade/app/utils/Colors.dart';
import 'package:forex_trade/app/utils/button_widget.dart';
import 'package:forex_trade/app/utils/forx_trade_Name.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class SplashView extends GetView<SplashController> {
  final List<Widget> _list = <Widget>[
    Center(child: MyAppName()),
    Center(child: LoginScreenProcess()),
  ];

  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // final double fontSize_splas = 34;

    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: _list,
        // onPageChanged: (num) {
        //   curr = num;
        // },
      ),
    );
  }
}

class LoginScreenProcess extends StatelessWidget {
  const LoginScreenProcess({super.key});

  @override
  Widget build(BuildContext context) {
    final double appnameSize = 24;
    final double headingSize = 16;
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "asset/image/logo.png",
                height: MediaQuery.of(context).size.height / 3,
              ),
              Text(
                "HELLO 👋",
                style: TextStyle(
                  fontSize: appnameSize,
                  fontWeight: FontWeight.w900,
                  color: MyColors.logoColor,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                maxLines: 2,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: headingSize,
                    fontWeight: FontWeight.w500,
                    color: MyColors.black,
                  ),
                  children: [
                    TextSpan(text: "Welcome to "),
                    TextSpan(
                      text: "FOREX",
                      style: TextStyle(
                        fontSize: appnameSize,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black,
                        letterSpacing: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: " TRADE",
                      style: TextStyle(
                        fontSize: appnameSize,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                    TextSpan(text: "where you manage your daily trading"),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),

              MyButton(
                height: 50,
                width: Get.width,
                buttonName: "Login",
                textColor: MyColors.white,
                fontSize: 28,
                borderRadius: 12,
                backgroundColor: MyColors.blue,
                onTap: () {
                  Get.offAndToNamed(AppRoutes.LOGIN_SCREEN);
                },
              ),
              SizedBox(height: 20),
              MyButton(
                height: 50,
                width: Get.width,
                buttonName: "Sign Up",
                textColor: MyColors.blue,
                fontSize: 28,
                borderRadius: 12,
                backgroundColor: MyColors.white,
                borderColor: MyColors.blue,
                onTap: () {
                  Get.offAndToNamed(AppRoutes.SIGNUP_SCREEN);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),

              Text(
                "Sign Up using",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  // letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _circleIconButton(
                    image: "asset/socialmedia/linkedin.png",
                    onTap: () {},
                  ),

                  SizedBox(width: 10),
                  _circleIconButton(
                    image: "asset/socialmedia/google.png",
                    onTap: () {},
                  ),

                  SizedBox(width: 10),

                  _circleIconButton(
                    image: "asset/socialmedia/facebook.png",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _circleIconButton({String? image, Callback? onTap}) {
  return Container(
    height: 60,
    width: 60,
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
    child: InkWell(onTap: onTap, child: Image.asset(image!, scale: 9)),
  );
}
