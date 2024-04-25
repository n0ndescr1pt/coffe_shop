import 'package:coffe_shop/src/features/map/models/point_model.dart';
import 'package:coffe_shop/src/features/map/view/widget/modal_map_point.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

List<PlacemarkMapObject> getPlacemarkObjects(
    List<MapPointModel> mapPoints, BuildContext context) {
  return mapPoints
      .map(
        (point) => PlacemarkMapObject(
          onTap:  (_, __) => showModalBottomSheet(
           context: context,
           builder: (context) => ModalBodyView(
             point: point,
           ),
         ),
          mapId: MapObjectId('MapObject $point'),
          point: Point(latitude: point.latitude, longitude: point.longitude),
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(
                'lib/assets/place.png',
              ),
              scale: 2,
            ),
          ),
        ),
      )
      .toList();
      
}
