import 'package:get/get.dart';
import 'package:travique/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:travique/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:travique/features/auth/domain/repositories/auth_repository.dart';
import 'package:travique/features/auth/domain/usecases/login_usecase.dart';
import 'package:travique/features/auth/domain/usecases/register_usecase.dart';
import 'package:travique/features/auth/presentation/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRemoteDataSource());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
    Get.lazyPut(() => LoginUsecase(Get.find()));
    Get.lazyPut(() => RegisterUsecase(Get.find()));
    Get.lazyPut(() => AuthController(Get.find<LoginUsecase>(), Get.find<RegisterUsecase>()));
  }
}
