import 'package:coffe_shop/src/features/map/models/point_model.dart';
import 'package:coffe_shop/src/features/menu/bloc/coffe_list_bloc/coffe_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AdressScreen extends StatelessWidget {
  final List<MapPointModel> mapsPoints;
  const AdressScreen({super.key, required this.mapsPoints});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Высота полосы
          child: Container(
            color: Colors.black, // Цвет полосы
            height: 0.3, // Высота полосы
          ),
        ),
        title: const Text("Наши кофейни"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: mapsPoints
              .map(
                (e) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.name),
                    IconButton(
                      onPressed: () {
                        GetIt.I<CoffeListBloc>()
                            .add(SetAdressEvent(adress: e.name));
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_right_rounded),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
