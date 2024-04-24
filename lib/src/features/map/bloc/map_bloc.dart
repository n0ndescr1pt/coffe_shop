import 'package:coffe_shop/src/features/map/data/map_repository.dart';
import 'package:coffe_shop/src/features/map/models/point_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final IMapRepository _mapRepository;

  MapBloc({required IMapRepository mapRepository})
      : _mapRepository = mapRepository,
        super(const MapInitial(mapPoints: [])) {
    on<LoadMapPointEvent>(_loadMapPoints);
  }

  _loadMapPoints(LoadMapPointEvent event, Emitter<MapState> emit) async {
    final List<MapPointModel> mapPoints = await _mapRepository.getPointList();
    
    emit(MapInitial(mapPoints: mapPoints));
  }
}
