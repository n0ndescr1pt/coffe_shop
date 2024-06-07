import 'package:coffe_shop/src/features/map/models/point_model.dart';
import 'package:coffe_shop/src/features/menu/bloc/coffe_list_bloc/coffe_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ModalBodyView extends StatelessWidget {
  const ModalBodyView({super.key, required this.point});

  final MapPointModel point;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(point.name, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Text(
            '${point.latitude}, ${point.longitude}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                GetIt.I<CoffeListBloc>()
                    .add(SetAdressEvent(adress: point.name));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(AppLocalizations.of(context)!.successUpdate),
                ));
              },
              child: Text(AppLocalizations.of(context)!.selectAddress))
        ]),
      ),
    );
  }
}
