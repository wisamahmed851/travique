import 'package:get/get.dart';
import 'package:travique/features/city/data/datasources/city_remote_data.dart';
import 'package:travique/features/city/data/repositories/city_repository_impl.dart';
import 'package:travique/features/city/presentation/controllers/city_controller.dart';

class CityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CityRemoteData());
    Get.lazyPut(() => CityRepositoryImpl(Get.find<CityRemoteData>()));
    Get.lazyPut<CityController>(
      () => CityController(Get.find<CityRepositoryImpl>()),
    );
  }
}
