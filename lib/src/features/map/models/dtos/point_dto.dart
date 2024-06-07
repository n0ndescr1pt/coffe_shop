

class MapPointDto {
  final String adress;
  final double latitude;
  final double longitude;

  MapPointDto({
    required this.adress,
    required this.latitude,
    required this.longitude,
  });

  factory MapPointDto.fromMap(Map<String, dynamic> map) {
    return MapPointDto(
      adress: map['address'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
    factory MapPointDto.fromJson(Map<String, dynamic> json) {
    return MapPointDto(
      adress: json['address'],
      latitude: json['lat'],
      longitude: json['lng'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adress': adress,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}