import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/controllers/category_controller.dart';
import '../models/category.dart';
import '../utils/constants/colors.dart';
import 'add_edit_category_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final CategoryController _controller = Get.find<CategoryController>();

  CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(category.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: MColors.error,
        ),
        child: const Icon(Icons.delete, color: MColors.onError),
      ),
      onDismissed: (direction) {
        _controller.deleteCategory(category.id);
      },
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: ListTile(
          title: Text(
            category.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Budget:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    ' \$${category.budgetedAmount}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.green),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Spent:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    ' \$${category.spentAmount}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.red),
                  )
                ],
              ),
            ],
          ),
          onTap: () => Get.to(() => AddEditCategoryScreen(category: category)),
        ),
      ),
    );
  }
}
