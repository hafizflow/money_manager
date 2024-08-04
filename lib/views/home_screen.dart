import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/views/main_screen.dart';
import 'add_edit_category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreen(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => AddEditCategoryScreen()),
        label: const Text(
          'Add Category',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
