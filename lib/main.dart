import 'package:appkwiz/bindings/initial_bindings.dart';
import 'package:appkwiz/configs/themes/app_dark_theme.dart';
import 'package:appkwiz/configs/themes/app_light_theme.dart';
import 'package:appkwiz/controllers/theme_controller.dart';
import 'package:appkwiz/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies(); // binds the controllers to the app.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: Get.find<ThemeController>().darkTheme, // Late modifier not working
      theme: LightTheme().buildLightTheme(),
      darkTheme: DarkTheme().buildDarkTheme(),
      debugShowCheckedModeBanner: false,
      getPages: Approute.routes(),
    );
  }
}
