import 'package:get/get.dart';
import 'category_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController(), fenix: true);
  }
}
