import 'package:get/get.dart';
import 'package:travique/features/city/domain/repositories/city_repository.dart';

class CityController extends GetxController {
  final CityRepository repository;

  CityController(this.repository);

  var isLoading = false.obs;
  var cityDetail =  
}
