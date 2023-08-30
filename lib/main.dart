import 'package:drug_interaction_detector/configs/app_pages.dart';
import 'package:drug_interaction_detector/configs/app_theme.dart';
import 'package:drug_interaction_detector/features/drug_interaction/persentation/pages/drug_interactions_page.dart';
import 'package:drug_interaction_detector/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Drug Interaction Checker',
      theme: AppTheme.appTheme1Light(),
      // debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: DrugInteractionsPage.routeName,
    );
  }
}
