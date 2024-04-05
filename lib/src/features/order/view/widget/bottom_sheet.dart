import 'package:coffe_shop/src/features/menu/bloc/coffe_list_bloc/coffe_list_bloc.dart';
import 'package:coffe_shop/src/features/menu/models/drink_model.dart';
import 'package:coffe_shop/src/features/order/bloc/order_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
    _drinks = widget.drinks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Ваш заказ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                      Image.network(
                          height: 55, width: 55, _drinks[index].image),
                      const SizedBox(width: 8),
                      Text(_drinks[index].name),
                      const SizedBox(width: 8),
                      Text("x${_drinks[index].counter.toString()}"),
                      Expanded(child: Container()),
                      Text(
                        "${_drinks[index].price} ₽",
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
                      .add(SendOrderEvent(context: context));
                  if (widget.ctx.mounted) {
                    Navigator.pop(widget.ctx);
                  }
                  GetIt.I<OrderListBloc>().add(ClearOrderEvent());
                },
                child: const Text("Оформить заказ",
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
