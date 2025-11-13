import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:travique/features/city/data/models/category_model.dart';
import 'package:travique/features/city/data/models/city_detail_model.dart';
import 'package:travique/features/city/domain/repositories/city_repository.dart';
import 'package:travique/features/home/data/models/attraction_model.dart';

class CityController extends GetxController {
  final CityRepository repository;

  CityController(this.repository);

  var isLoading = false.obs;
  var cityDetail = Rxn<CityDetailModel>(); // single city detail
  var topAttractions = <AttractionModel>[].obs; // separate list
  var category = <CategoryModel>[].obs;

  Future<void> fetchCityDetail(int id) async {
    debugPrint("Controller is fine");
    isLoading.value = true;
    try {
      final result = await repository.cityDetail(id);

      debugPrint("response of the api ${result.toString()}");

      final success = result['success'] ?? false;
      final data = result['data'];
      debugPrint("print the final data ${data.toString()}");
      if (success && data is List && data.isNotEmpty) {
        final cityData = data.first; // since data[0] is the main city object
        // parse city details
        cityDetail.value = CityDetailModel.fromJson(cityData);

        // parse top attractions and experiences separately
        final city = cityData['city'] ?? {};
        final topAttractionsData = city['topAttractions'] ?? [];
        final categoryList = cityData['categories'] ?? [];
        debugPrint("print categoryList ${cityData['categories'].toString()}");
        debugPrint("print categoryList ${categoryList.toString()}");

        topAttractions.value = List<AttractionModel>.from(
          topAttractionsData.map((a) => AttractionModel.fromJson(a)),
        );

        category.value = List<CategoryModel>.from(
          categoryList.map((e) => CategoryModel.fromJson(e)),
        );
      }
    } catch (e) {
      debugPrint("Error in the controller: ${e.toString()}");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}
