import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:coffe_shop/src/features/widgets/coffe_card_widget.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final List<CoffeModel> coffeModel;
  const MenuScreen({super.key, required this.coffeModel});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentTub = 0;
  late List<Widget> _sliversWidget;
  late List<CoffeModel> _coffeModel;

  //_fetchCoffeMenu(){
  //  //get from API
  //  _coffeModel =
  //}

  _getSliverWidgets(List<CoffeModel> coffeModel) {
    final List<Widget> list = [];
    for (int i = 0; i < coffeModel.length; i++) {
      list.add(SliverToBoxAdapter(
          child: Text(
        coffeModel[i].title,
        key: coffeModel[i].columnKey,
      )));
      list.add(
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
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

  _onTap(int index) {
    scrollToDirection(widget.coffeModel[index].rowKey);
    setState(() {
      _currentTub = index;
    });
    scrollToDirection(widget.coffeModel[index].columnKey);
  }

  void _onScrollEvent() {
    final extentAfter = _scrollController.position;
    print(extentAfter);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollEvent);
    _getSliverWidgets(widget.coffeModel);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: SizedBox(
        height: 30,
        child: ListView.builder(
            itemCount: widget.coffeModel.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                  key: widget.coffeModel[index].rowKey,
                  color: _currentTub == index ? Colors.amber : Colors.blue,
                  child: OutlinedButton(
                    onPressed: (){_onTap(index);},
                    child: Text(widget.coffeModel[index].title),
                  ));
            }),
      )),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: _sliversWidget,
      ),
    );
  }
}
