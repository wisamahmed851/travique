class AttractionModel {
  final int id;
  final int cityId;
  final String name;
  final String category;
  final String description;
  final String mainImage;
  final String contactInfo;
  final String openingHours;
  final String averageRating;

  AttractionModel({
    required this.id,
    required this.cityId,
    required this.name,
    required this.category,
    required this.description,
    required this.mainImage,
    required this.contactInfo,
    required this.openingHours,
    required this.averageRating,
  });

  factory AttractionModel.fromJson(Map<String, dynamic> json) {
    return AttractionModel(
      id: json['id'] ?? 0,
      cityId: json['city_id'] ?? 0,
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      mainImage: json['main_image'] ?? '',
      contactInfo: json['contact_info'] ?? '',
      openingHours: json['opening_hours'] ?? '',
      averageRating: json['average_rating']?.toString() ?? '0.0',
    );
  }
}
