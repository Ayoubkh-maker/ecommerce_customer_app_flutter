

import 'package:app_ecommerce/binding.dart';
import 'package:app_ecommerce/core/localization/changeLocal.dart';
import 'package:app_ecommerce/core/localization/translation.dart';
import 'package:app_ecommerce/core/services/services.dart';
import 'package:app_ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)   {

   
    ControllerLocal controller = Get.put(ControllerLocal());

    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      initialBinding: MyBinding(),
      // home: const OnBoarding(),
      //routes: routes,
    getPages: routes,
    
    );
  }
}
