import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CoffeCard extends StatefulWidget {
  final String name;
  final String image;
  final int price;
  const CoffeCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  State<CoffeCard> createState() => _CoffeCardState();
}

class _CoffeCardState extends State<CoffeCard> {
  int _count = 0;

  _incrementCouner() {
    setState(() {
      if (_count < 10) _count++;
    });
  }

  _decrementCouner() {
    setState(() {
      if (_count > 0) _count--;
    });
  }

  Widget _priceOrCount() {
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
                    child: Text('-', style: TextStyle(color: Colors.white))),
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
                style: const TextStyle(color: Colors.white),
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
                    child: Text('+', style: TextStyle(color: Colors.white))),
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
            '${widget.price.toString()} руб.',
            style: const TextStyle(color: Colors.white),
          )),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 192,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(widget.image, height: 100, width: 100),
          
          Text(widget.name,style: TextStyle(fontSize: 16)),
          
          _priceOrCount(),

        ],
      ),
    );
  }
}
