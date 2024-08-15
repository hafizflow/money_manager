import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class CategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Category> categories = <Category>[].obs;

  /// First time this controller class called this onInit method will run
  @override
  void onInit() {
    super.onInit();
    _firestore.collection('categories').snapshots().listen((snapshot) {
      final categoryList = snapshot.docs
          .map((doc) => Category.fromJson(doc.data(), doc.id))
          .toList();
      categories.assignAll(categoryList);
    });
  }

  Future<void> addCategory(Category category) async {
    final docRef =
        await _firestore.collection('categories').add(category.toJson());
    category.id = docRef.id;
  }

  Future<void> updateCategory(Category category) async {
    await _firestore
        .collection('categories')
        .doc(category.id)
        .update(category.toJson());
  }

  Future<void> deleteCategory(String id) async {
    await _firestore.collection('categories').doc(id).delete();
  }
}
