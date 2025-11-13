import 'package:get/get.dart';
import 'package:travique/features/home/data/datasources/home_remote_data_source.dart';
import 'package:travique/features/home/data/repositories/home_repository_impl.dart';
import 'package:travique/features/home/presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRemoteDataSource());
    Get.lazyPut(() => HomeRepositoryImpl(Get.find<HomeRemoteDataSource>()));
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<HomeRepositoryImpl>()),
    );
  }
}
