import 'package:forex_trade/app/modules/signup_screen/signup_controller/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
    // Get.lazyPut<SignupController>(() => SignupController() , fenix: true);
  }
}
