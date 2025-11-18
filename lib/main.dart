import 'package:aaqaqir_tirganin/app/config/String/translation.dart';
import 'package:aaqaqir_tirganin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      locale: Get.deviceLocale,
      initialRoute: AppPages.INITIAL,
      translations: StringApp(),
      getPages: AppPages.routes,
    ),
  );
}
