import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:forex_trade/app/routes/app_pages.dart';
import 'package:forex_trade/app/theme/MyTheme.dart';
import 'package:forex_trade/app/theme/MyThemeController.dart';
import 'package:forex_trade/dependency_injection.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();
  Get.put(Mythemecontroller(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      initialRoute: AppPages.INITIAL_SCREEN,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    );
  }
}
