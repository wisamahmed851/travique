class CityDetailModel {
  final int id;
  final String name;
  final String description;
  final String image;

  CityDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory CityDetailModel.fromjson(Map<String, dynamic> json) {
    return CityDetailModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> tojson() {
    return {'id': id, 'name': name, 'description': description, 'image': image};
  }
}
