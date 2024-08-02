import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/views/main_screen.dart';
import 'controllers/bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Personal Budgeting',
      initialBinding: AppBindings(),
      home: MainScreen(),
    );
  }
}
