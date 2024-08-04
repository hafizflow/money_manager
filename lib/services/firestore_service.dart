import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class CategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Category> categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    final snapshot = await _firestore.collection('categories').get();
    final categoryList = snapshot.docs
        .map((doc) => Category.fromMap(doc.data(), doc.id))
        .toList();
    categories.assignAll(categoryList);
  }

  Future<void> addCategory(Category category) async {
    final docRef =
        await _firestore.collection('categories').add(category.toMap());
    category.id = docRef.id;
    categories.add(category);
  }

  Future<void> updateCategory(Category category) async {
    await _firestore
        .collection('categories')
        .doc(category.id)
        .update(category.toMap());
    int index = categories.indexWhere((c) => c.id == category.id);
    categories[index] = category;
  }

  Future<void> deleteCategory(String id) async {
    await _firestore.collection('categories').doc(id).delete();
    categories.removeWhere((category) => category.id == id);
  }
}
