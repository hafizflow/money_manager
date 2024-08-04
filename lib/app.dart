import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/utils/theme/theme.dart';
import 'package:money_manager/views/home_screen.dart';
import 'controllers/bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Personal Budgeting',
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: MoneyManagerAppTheme.lightTheme,
    );
  }
}
