import 'package:get/get.dart';
import '../models/category.dart';
import '../services/firestore_service.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void onInit() {
    super.onInit();
    categories.bindStream(_firestoreService.getCategories());
  }

  void addCategory(Category category) {
    _firestoreService.addCategory(category);
  }

  void updateCategory(Category category) {
    _firestoreService.updateCategory(category);
  }

  void deleteCategory(String id) {
    _firestoreService.deleteCategory(id);
  }
}
