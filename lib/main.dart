import 'package:appkwiz/controllers/question_uploader/data_uploader_screen.dart';
import 'package:appkwiz/routes/app_route.dart';
import 'package:appkwiz/screens/introduction/introduction.dart';
import 'package:appkwiz/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DataUploderScreen(),
      // home: ApplictionIntroductionScreen(),
      getPages: Approute.routes(),
    );
  }
}
