import 'package:coffe_shop/src/features/map/models/dtos/point_dto.dart';
import 'package:equatable/equatable.dart';


/// Модель точки на карте
class MapPointModel extends Equatable {
 const MapPointModel({
   required this.name,
   required this.latitude,
   required this.longitude,
 });


 final String name;
 final double latitude;
 final double longitude;

factory MapPointModel.fromDTO(MapPointDto dto) {
    return MapPointModel(
      name: dto.adress,
      latitude: dto.latitude,
      longitude: dto.longitude,
    );
  }
 @override
 List<Object?> get props => [name, latitude, longitude];
}