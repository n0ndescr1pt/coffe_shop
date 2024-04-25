import 'package:coffe_shop/src/features/map/models/point_model.dart';
import 'package:coffe_shop/src/features/map/utils/get_placemarks.dart';
import 'package:coffe_shop/src/features/map/view/adress_screen.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  final List<MapPointModel> mapPoints;
  const MapScreen({super.key, required this.mapPoints});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          style: IconButton.styleFrom(
            elevation: 5,
            shadowColor: Colors.black,
            maximumSize: const Size.square(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
          ),
          icon: const Center(
            child: Icon(Icons.arrow_back, size: 24, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AdressScreen(mapsPoints: widget.mapPoints),
                    ));
              },
              style: IconButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.black,
                maximumSize: const Size.square(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.white,
              ),
              icon: const Center(
                child: Icon(
                  Icons.map, // Иконка в центре кнопки
                  size: 24, // Размер иконки
                  color: Colors.black, // Цвет иконки
                ),
              ),
            ),
          )
        ],
      ),
      body: YandexMap(
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
        mapObjects: getPlacemarkObjects(widget.mapPoints, context),
      ),
    );
  }
}
