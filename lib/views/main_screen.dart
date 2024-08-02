import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import 'add_edit_category_screen.dart';
import 'category_item.dart';

class MainScreen extends StatelessWidget {
  final CategoryController _controller = Get.find<CategoryController>();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Budgeting'),
      ),
      body: Obx(() {
        if (_controller.categories.isEmpty) {
          return const Center(child: Text('No categories added yet.'));
        }
        return ListView.builder(
          itemCount: _controller.categories.length,
          itemBuilder: (context, index) {
            return CategoryItem(category: _controller.categories[index]);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddEditCategoryScreen()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
