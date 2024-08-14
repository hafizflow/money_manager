import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';
import 'category_item.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final CategoryController _controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 23,
                      backgroundImage: ExactAssetImage('assets/hafiz.jpg'),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        Text(
                          'Hafizur Rahman',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.settings),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () {
                  if (_controller.categories.isEmpty) {
                    return const Center(
                      child: Text(
                        'No categories added yet.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: _controller.categories.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        category: _controller.categories[index],
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
