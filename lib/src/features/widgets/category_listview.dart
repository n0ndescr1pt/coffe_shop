import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:coffe_shop/src/features/menu/utils/scroll_utils.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  final List<CoffeModel> coffeModel;
  final int currentTub;
  const CategoryListView({super.key, required this.coffeModel, required this.currentTub});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  late int currentTub;
  final ScrollUtils _scrollUtils = ScrollUtils();

_onTap(int index) {
    _scrollUtils.scrollToDirection(widget.coffeModel[index].rowKey);
    setState(() {
      currentTub = index;
    });
    _scrollUtils.scrollToDirection(widget.coffeModel[index].columnKey);
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTub = widget.currentTub;
  }

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
                    widget.currentTub == index ? AppColors.mainColor : Colors.white,
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
                  color: widget.currentTub == index ? Colors.white : Colors.black,
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
