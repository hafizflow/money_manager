import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/utils/validator/validator.dart';
import '../controllers/category_controller.dart';
import '../models/category.dart';

class AddEditCategoryScreen extends StatelessWidget {
  final CategoryController _controller = Get.find<CategoryController>();
  final Category? category;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController spentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddEditCategoryScreen({super.key, this.category}) {
    if (category != null) {
      nameController.text = category!.name;
      budgetController.text = category!.budgetedAmount.toString();
      spentController.text = category!.spentAmount.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category == null ? 'Add Category' : 'Edit Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Category Name'),
                validator: (value) =>
                    MValidator.validateEmptyText("Category", value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: budgetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Total Budget'),
                validator: (value) =>
                    MValidator.validateInvalidAmount("Budget", value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: spentController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Total Spent'),
                validator: (value) =>
                    MValidator.validateInvalidAmount("Spent", value),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        final name = nameController.text.trim();
                        final budget =
                            double.tryParse(budgetController.text.trim()) ??
                                0.0;
                        final spent =
                            double.tryParse(spentController.text.trim()) ?? 0.0;
                        if (category == null) {
                          _controller.addCategory(Category(
                            id: '',
                            name: name,
                            budgetedAmount: budget,
                            spentAmount: spent,
                          ));
                        } else {
                          _controller.updateCategory(Category(
                            id: category!.id,
                            name: name,
                            budgetedAmount: budget,
                            spentAmount: spent,
                          ));
                        }
                        Get.back();
                      },
                      child: Text(category == null ? 'Save' : 'Update'),
                    ),
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
