class CityDetailModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final int countryId;
  final String countryName;

  CityDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.countryId,
    required this.countryName,
  });

  factory CityDetailModel.fromJson(Map<String, dynamic> json) {
    final city = json['city'] ?? {};
    final country = city['country'] ?? {};

    return CityDetailModel(
      id: city['id'] ?? 0,
      name: city['name'] ?? '',
      description: city['description'] ?? '',
      image: city['image'] ?? '',
      countryId: country['id'] ?? 0,
      countryName: country['name'] ?? '',
    );
  }
}
