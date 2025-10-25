import 'package:get/get.dart';
import 'package:travique/features/favorite_places/presentation/controllers/favorite_places_controller.dart';

class FavoritePlacesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritePlacesController>(() => FavoritePlacesController());
  }
}
