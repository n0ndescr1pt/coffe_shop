import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:coffe_shop/src/features/menu/utils/scroll_utils.dart';
import 'package:coffe_shop/src/features/widgets/category_listview.dart';
import 'package:coffe_shop/src/features/widgets/coffe_card_widget.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final List<CoffeModel> coffeModel;
  const MenuScreen({super.key, required this.coffeModel});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int countWidgetDisplay = 0;
  int currentTub = 0;
  final ScrollUtils _scrollUtils = ScrollUtils();
  final ScrollController _scrollController = ScrollController();
  late List<Widget> _sliversWidget;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollEvent);
    getSliverWidgets(widget.coffeModel);
  }
  //late List<CoffeModel> _coffeModel;

  //_fetchCoffeMenu(){
  //  //get from API
  //  _coffeModel =
  //}

  void _onScrollEvent() {
    double currentToDownScroll = 0;
    for (int i = 0; i <= countWidgetDisplay; i++) {
      currentToDownScroll += widget.coffeModel[i].drinks.length * 245 / 2;
    }

    if (_scrollController.offset.round() > currentToDownScroll) {
      setState(() {
        countWidgetDisplay++;
        currentTub = countWidgetDisplay;
      });
      _scrollUtils.scrollToDirection(widget.coffeModel[countWidgetDisplay].rowKey);
    }
    
    if (countWidgetDisplay > 0) {
      double currentToUpScroll = 0;
      for (int i = 0; i <= countWidgetDisplay - 1; i++) {
        currentToUpScroll += widget.coffeModel[i].drinks.length * 245 / 2;
      }

      if (_scrollController.offset.round() < currentToUpScroll) {
        setState(() {
          countWidgetDisplay--;
          currentTub = countWidgetDisplay;
        });
        _scrollUtils.scrollToDirection(widget.coffeModel[countWidgetDisplay].rowKey);
      }
    }
  }

  //final extentAfter = _scrollController.position;

//this method return all slivers in customScrollView
  void getSliverWidgets(List<CoffeModel> coffeModel) {
    final List<Widget> list = [];
    for (int i = 0; i < coffeModel.length; i++) {
      list.add(SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        sliver: SliverToBoxAdapter(
            child: Text(
          coffeModel[i].title,
          key: coffeModel[i].columnKey,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        )),
      ));
      list.add(
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CoffeCard(
                name: coffeModel[i].drinks[index].name,
                image: coffeModel[i].drinks[index].image,
                price: coffeModel[i].drinks[index].price,
              );
            },
            childCount: coffeModel[i].drinks.length,
          ),
        ),
      );
    }
    _sliversWidget = list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        surfaceTintColor: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
        titleSpacing: 16,
        centerTitle: true,
        title: SizedBox(
          height: 35,
          child: CategoryListView(
            coffeModel: widget.coffeModel,
            currentTub: currentTub,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: _sliversWidget,
        ),
      ),
    );
  }
}
