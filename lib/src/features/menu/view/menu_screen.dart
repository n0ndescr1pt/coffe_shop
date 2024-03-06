import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:coffe_shop/src/features/widgets/category_listview.dart';
import 'package:coffe_shop/src/features/widgets/coffe_card_widget.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuScreen extends StatefulWidget {
  final List<CoffeModel> coffeModel;
  const MenuScreen({super.key, required this.coffeModel});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ScrollController _scrollController = ScrollController();
  late List<Widget> _sliversWidget;
  late List<CoffeModel> _coffeModel;

  //_fetchCoffeMenu(){
  //  //get from API
  //  _coffeModel =
  //}

  _getSliverWidgets(List<CoffeModel> coffeModel) {
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
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CoffeCard(
                name: widget.coffeModel[i].drinks[index].name,
                image: widget.coffeModel[i].drinks[index].image,
                price: widget.coffeModel[i].drinks[index].price,
              );
            },
            childCount: coffeModel[i].drinks.length,
          ),
        ),
      );
    }
    _sliversWidget = list;
  }

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


  //void _onScrollEvent() {
  //  //for (int i = 0; i < widget.coffeModel.length; i++) {
  //    final renderBox = widget.coffeModel[_a].columnKey.currentContext!
  //        .findRenderObject() as RenderBox;
  //    if (_scrollController.position.pixels.round() ==
  //        renderBox.localToGlobal(Offset.zero).dy.round()) {
  //          setState(() {
  //            _a++;
  //          });
  //      scrollToDirection(widget.coffeModel[_a].rowKey);
  //    }
  //  //}
//
  //  //final extentAfter = _scrollController.position;
  //  print(_scrollController.position.pixels);
  //  print( renderBox.localToGlobal(Offset.zero).dy);
  //}

  @override
  void initState() {
    super.initState();
    //_scrollController.addListener(_onScrollEvent);
    _getSliverWidgets(widget.coffeModel);
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
          child: CategoryListView(coffeModel: widget.coffeModel,),
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
