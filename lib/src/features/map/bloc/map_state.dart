part of 'map_bloc.dart';

sealed class MapState extends Equatable {
 final List<MapPointModel> mapPoints;

  const MapState({required this.mapPoints});
  @override
  List<Object> get props => [];
}

final class MapInitial extends MapState {
  const MapInitial({required super.mapPoints});
}
