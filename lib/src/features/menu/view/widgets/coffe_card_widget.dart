import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_shop/src/features/menu/models/drink_model.dart';
import 'package:coffe_shop/src/features/order/bloc/order_list_bloc.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoffeCard extends StatefulWidget {
  final DrinkModel drinkModel;
  const CoffeCard({
    super.key,
    required this.drinkModel,
  });

  @override
  State<CoffeCard> createState() => _CoffeCardState();
}

class _CoffeCardState extends State<CoffeCard> {
  int _count = 0;

  _incrementCouner() {
    if (_count < 10) {
      setState(() {
        _count++;
      });
      context.read<OrderListBloc>().add(AddToOrderEvent(
          localName: AppLocalizations.of(context)!.localeName,
          drink: DrinkModel(
              category: widget.drinkModel.category,
              id: widget.drinkModel.id,
              name: widget.drinkModel.name,
              image: widget.drinkModel.image,
              priceRUB: widget.drinkModel.priceRUB,
              priceUSD: widget.drinkModel.priceUSD,
              counter: _count,
              productID: widget.drinkModel.productID)));
    }
  }

  _decrementCouner() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
      context.read<OrderListBloc>().add(RemoveFromOrderEvent(
          localName: AppLocalizations.of(context)!.localeName,
          drink: DrinkModel(
              category: widget.drinkModel.category,
              id: widget.drinkModel.id,
              name: widget.drinkModel.name,
              image: widget.drinkModel.image,
              priceRUB: widget.drinkModel.priceRUB,
              priceUSD: widget.drinkModel.priceUSD,
              counter: _count,
              productID: widget.drinkModel.productID)));
    }
  }

  Widget _priceOrCount(String localName) {
    if (_count > 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: _decrementCouner,
              child: Container(
                width: 30,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.mainColor,
                ),
                child: const Center(
                    child: Text('-',
                        style: TextStyle(color: AppColors.whiteColor))),
              ),
            ),
            Container(
              height: 24,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.mainColor,
              ),
              child: Center(
                  child: Text(
                _count.toString(),
                style: const TextStyle(color: AppColors.whiteColor),
              )),
            ),
            GestureDetector(
              onTap: _incrementCouner,
              child: Container(
                width: 30,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.mainColor,
                ),
                child: const Center(
                    child: Text('+',
                        style: TextStyle(color: AppColors.whiteColor))),
              ),
            ),
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: _incrementCouner,
        child: Container(
          width: 130,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.mainColor,
          ),
          child: Center(
              child: Text(
            localName == "ru"
                ? '${widget.drinkModel.priceRUB.toString()} руб.'
                : '${widget.drinkModel.priceUSD.toString()} usd.',
            style: const TextStyle(color: AppColors.whiteColor),
          )),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localName = AppLocalizations.of(context)!.localeName;
    return BlocListener<OrderListBloc, OrderListState>(
      listener: (context, state) {
        if (state is DoOrderState) {
          if (state.summ == 0) {
            setState(() {
              _count = 0;
            });
          }
        }
      },
      child: Container(
        height: 192,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CachedNetworkImage(
              imageUrl: widget.drinkModel.image,
              height: 100,
              width: 100,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Text(widget.drinkModel.name,
                style: Theme.of(context).textTheme.bodyMedium),
            _priceOrCount(localName),
          ],
        ),
      ),
    );
  }
}
