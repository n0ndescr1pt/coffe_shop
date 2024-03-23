import 'package:coffe_shop/src/features/menu/models/drink_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyBottomSheet extends StatelessWidget {
  final List<DrinkModel> drinks;
  const MyBottomSheet({super.key, required this.drinks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Ваш заказ"),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.restore_from_trash_outlined)),
          ],
        ),
        Divider(height: 1),
        Expanded(
          child: ListView.builder(
              itemCount: drinks.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Image.network(height: 100, width: 100, drinks[index].image),
                    Text(drinks[index].name),
                    Text(drinks[index].counter.toString()),
                    Expanded(child: Container()),
                    Text(drinks[index].price)
                  ],
                );
              }),
        ),
      ],
    );
  }
}
