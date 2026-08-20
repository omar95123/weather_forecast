class CityModel {
  final int id;
  final String name;
  final String? admin1;
  final String country;
  final double latitude;
  final double longitude;

  CityModel({
    required this.id,
    required this.name,
    this.admin1,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  String get displayName => [name, admin1, country].where((e) => e != null && e.isNotEmpty).join(', ');

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      admin1: json['admin1'] as String?,
      country: json['country'] as String? ?? '',
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}
