import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travique/features/home/data/models/city_model.dart';
import 'package:travique/features/home/data/models/expirence_model.dart';
import 'package:travique/features/home/domain/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;

  HomeController(this.homeRepository);

  var isLoading = false.obs;
  var cities = <CityModel>[].obs;
  var experiences = <ExperienceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    isLoading.value = true;
    try {
      final result = await homeRepository.getHomeData();
      debugPrint("home page api response ${result.toString()}");
      final success = result['success'];
      final message = result['message'];
      final data = result['data'];

      if (success == true) {
        final dataC = data['popular_cities'] as List;
        final exp = data['experience'] as List;
        cities.value = dataC.map((e) => CityModel.fromjson(e)).toList();
        experiences.value = exp
            .map((e) => ExperienceModel.fromJson(e))
            .toList();
      } else {
        Get.snackbar('Error', message);
      }
    } catch (e) {
      debugPrint("some thing went wrong: ${e.toString()}");
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
