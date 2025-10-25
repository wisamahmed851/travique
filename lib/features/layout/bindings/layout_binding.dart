import 'package:get/get.dart';
import 'package:travique/features/layout/presentation/controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(() => LayoutController());
  }
}
