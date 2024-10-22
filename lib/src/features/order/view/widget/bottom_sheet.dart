import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_shop/src/features/menu/bloc/coffe_list_bloc/coffe_list_bloc.dart';
import 'package:coffe_shop/src/features/menu/models/drink_model.dart';
import 'package:coffe_shop/src/features/order/bloc/order_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyBottomSheet extends StatefulWidget {
  final List<DrinkModel> drinks;
  final BuildContext ctx;
  const MyBottomSheet({super.key, required this.drinks, required this.ctx});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  List<DrinkModel> _drinks = [];
  @override
  void initState() {
    super.initState();
    _drinks = widget.drinks;
  }

  @override
  Widget build(BuildContext context) {
    final localName = AppLocalizations.of(context)!.localeName;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.yourOrder,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () {
                    GetIt.I<OrderListBloc>().add(ClearOrderEvent());
                    setState(() {
                      _drinks = [];
                    });
                  },
                  icon: const Icon(Icons.restore_from_trash_outlined)),
            ],
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
                itemCount: _drinks.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      CachedNetworkImage(
                          imageUrl: _drinks[index].image,
                          height: 100,
                          width: 100,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error)),
                      const SizedBox(width: 8),
                      Text(_drinks[index].name),
                      const SizedBox(width: 8),
                      Text("x${_drinks[index].counter.toString()}"),
                      Expanded(child: Container()),
                      Text(
                        localName == "ru"
                            ? '${_drinks[index].priceRUB} ₽'
                            : '${_drinks[index].priceUSD} \$',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 46),
                  backgroundColor: Colors.blue[200],
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                onPressed: () async {
                  GetIt.I<CoffeListBloc>()
                      .add(SendOrderEvent(context: widget.ctx));
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  GetIt.I<OrderListBloc>().add(ClearOrderEvent());
                },
                child: Text(AppLocalizations.of(context)!.makeOrder,
                    style: const TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
