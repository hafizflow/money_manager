import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/category.dart';
import 'add_edit_category_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.name),
      subtitle:
          Text('Budget: \$${category.budget}, Spent: \$${category.spent}'),
      onTap: () => Get.to(() => AddEditCategoryScreen(category: category)),
    );
  }
}
