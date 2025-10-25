import 'package:get/get.dart';
import 'package:travique/features/place/presentation/controllers/place_controller.dart';

class PlaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceController>(() => PlaceController());
  }
}
