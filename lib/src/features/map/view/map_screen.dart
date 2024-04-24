import 'package:coffe_shop/src/features/map/bloc/map_bloc.dart';
import 'package:coffe_shop/src/features/map/utils/get_placemarks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;

  @override
  void initState() {
    GetIt.I<MapBloc>().add(LoadMapPointEvent());
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<MapBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Yandex Mapkit Demo')),
        body: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            print(getPlacemarkObjects(state.mapPoints, context));
             print("getPlacemarkObjects(state.mapPoints, context)");
            return YandexMap(
              onMapCreated: (controller) async {
                _mapController = controller;
                await _mapController.moveCamera(
                  CameraUpdate.newCameraPosition(
                    const CameraPosition(
                      target: Point(
                        latitude: 55,
                        longitude: 74,
                      ),
                      zoom: 10,
                    ),
                  ),
                );
              },
              mapObjects: getPlacemarkObjects(state.mapPoints, context),
            );
          },
        ),
      ),
    );
  }
}
