import 'package:get/get.dart';
import 'package:travique/features/city/presentation/controllers/city_controller.dart';

class CityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CityController>(() => CityController());
  }
}
