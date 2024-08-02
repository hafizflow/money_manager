import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import '../models/category.dart';

class AddEditCategoryScreen extends StatelessWidget {
  final CategoryController _controller = Get.find<CategoryController>();
  final Category? category;

  AddEditCategoryScreen({super.key, this.category});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _budgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (category != null) {
      _nameController.text = category!.name;
      _budgetController.text = category!.budget.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category == null ? 'Add Category' : 'Edit Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Category Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _budgetController,
                decoration: const InputDecoration(labelText: 'Budget Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a budget amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newCategory = Category(
                          id: category?.id ?? DateTime.now().toString(),
                          name: _nameController.text,
                          budget: double.parse(_budgetController.text),
                          spent: category?.spent ?? 0,
                        );

                        if (category == null) {
                          _controller.addCategory(newCategory);
                        } else {
                          _controller.updateCategory(newCategory);
                        }
                        Get.back();
                      }
                    },
                    child: const Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
