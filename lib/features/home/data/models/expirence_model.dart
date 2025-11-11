class ExperienceModel {
  final int id;
  final String name;
  final String image;

  ExperienceModel({required this.id, required this.name, required this.image});

  factory ExperienceModel.fromjson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> tojson() {
    return {'id': id, 'name': name, 'image': image};
  }
}
