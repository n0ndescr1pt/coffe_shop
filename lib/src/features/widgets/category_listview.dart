import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  final List<CoffeModel> coffeModel;
  const CategoryListView({super.key, required this.coffeModel});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {

  void scrollToDirection(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  _onTap(int index) {
    scrollToDirection(widget.coffeModel[index].rowKey);
    setState(() {
      _currentTub = index;
    });
    scrollToDirection(widget.coffeModel[index].columnKey);
  }

  int _currentTub = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.coffeModel.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    _currentTub == index ? AppColors.mainColor : Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
              key: widget.coffeModel[index].rowKey,
              onPressed: () {
                _onTap(index);
              },
              child: Text(
                widget.coffeModel[index].title,
                style: TextStyle(
                  fontSize: 14,
                  color: _currentTub == index ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 8)
          ],
        );
      },
    );
  }
}
