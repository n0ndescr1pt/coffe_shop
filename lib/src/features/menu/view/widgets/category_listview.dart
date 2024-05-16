import 'dart:async';

import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:coffe_shop/src/features/menu/utils/scroll_utils.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoryListView extends StatefulWidget {
  final List<CoffeModel> coffeModel;
  final ItemScrollController categoryItemController;
  final ItemScrollController itemController;
  final StreamController<int> streamController;
  const CategoryListView(
      {super.key,
      required this.coffeModel,
      required this.streamController,
      required this.categoryItemController,
      required this.itemController});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollUtils scrollUtils = ScrollUtils();

    return StreamBuilder(
      stream: widget.streamController.stream,
      builder: (context, snapshot) => ScrollablePositionedList.separated(
        itemScrollController: widget.categoryItemController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.coffeModel.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return TextButton(
            style: TextButton.styleFrom(
              backgroundColor: snapshot.data == index
                  ? AppColors.mainColor
                  : AppColors.whiteColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
            onPressed: () {
              scrollUtils.scrollToDirection(
                  widget.categoryItemController, index);
              scrollUtils.scrollToDirection(
                  widget.itemController, index);
            },
            child: Text(
              widget.coffeModel[index].title,
              style: TextStyle(
                fontSize: 14,
                color: snapshot.data == index
                    ? AppColors.whiteColor
                    : AppColors.textColor,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }
}
