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

  Widget _PriceOrCount() {
    if (_count > 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _decrementCouner,
            child: Container(
              child: const Center(
                child: Text('-'),
              ),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blue.shade500,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue.shade500,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(child: Text(_count.toString())),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: _incrementCouner,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blue.shade500,
              ),
              child: Center(
                child: Text('+'),
              ),
            ),
          ),
        ],
      );
    } else {
      return GestureDetector(
        onTap: _incrementCouner,
        child: Container(
          width: 128,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blue.shade500,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
                child: Text('${widget.price?.toString() ?? 'loading'} руб.')),
          ),
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
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              widget?.image ??
                  'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(widget?.name ?? 'Drink'),
            const SizedBox(
              height: 4,
            ),
            _PriceOrCount(),
          ],
        ),
      ),
    );
  }
}
