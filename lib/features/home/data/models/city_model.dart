class CityModel {
  final int id;
  final String name;
  final String description;
  final String image;

  CityModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory CityModel.fromjson(Map<String, dynamic> json) {
    return CityModel(
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
