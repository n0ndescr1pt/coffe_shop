import 'dart:async';

import 'package:coffe_shop/src/features/map/view/map_screen.dart';
import 'package:coffe_shop/src/features/menu/bloc/coffe_list_bloc/coffe_list_bloc.dart';
import 'package:coffe_shop/src/features/menu/utils/scroll_utils.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/category_listview.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/coffe_card_widget.dart';
import 'package:coffe_shop/src/features/order/bloc/order_list_bloc.dart';
import 'package:coffe_shop/src/features/order/view/widget/bottom_sheet.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ItemScrollController itemController = ItemScrollController();
  final ItemPositionsListener itemListener = ItemPositionsListener.create();

  final ItemScrollController categoryItemController = ItemScrollController();
  final streamController = StreamController<int>();

  int currentTub = 0;
  final ScrollUtils _scrollUtils = ScrollUtils();

  final CoffeListBloc coffeListBloc = GetIt.I<CoffeListBloc>();
  final OrderListBloc orderListBloc = GetIt.I<OrderListBloc>();

  @override
  void initState() {
    super.initState();
    coffeListBloc.add(LoadCoffeListEvent());
    itemListener.itemPositions.addListener(_onScrollEvent);
  }

  @override
  void dispose() {
    super.dispose();
    streamController.close();
  }

  void _onScrollEvent() {
    final indices =
        itemListener.itemPositions.value.map((e) => e.index).toList();
    if (currentTub != indices[0]) {
      currentTub = indices[0];
      streamController.sink.add(currentTub);
      _scrollUtils.scrollToDirection(categoryItemController, currentTub);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => coffeListBloc),
        BlocProvider(create: (context) => orderListBloc)
      ],
      child: BlocBuilder<CoffeListBloc, CoffeListState>(
        bloc: coffeListBloc,
        builder: (context, state) {
          if (state is CoffeListLoaded) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 90,
                surfaceTintColor: AppColors.backgroundColor,
                backgroundColor: AppColors.backgroundColor,
                titleSpacing: 16,
                centerTitle: true,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.place),
                        TextButton(
                            onPressed: () {
                              try {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MapScreen(mapPoints: state.mapPoints),
                                  ),
                                );
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Text(state.adress,
                                style: Theme.of(context).textTheme.bodyMedium)),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                      child: CategoryListView(
                        itemController: itemController,
                        coffeModel: state.coffeList,
                        categoryItemController: categoryItemController,
                        streamController: streamController,
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: BlocBuilder<OrderListBloc, OrderListState>(
                bloc: orderListBloc,
                builder: (context, state) {
                  if (state is DoOrderState) {
                    return Visibility(
                        visible: state.drinks.isNotEmpty,
                        child: SizedBox(
                          height: 45,
                          width: 99,
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              showModalBottomSheet(
                                showDragHandle: true,
                                context: context,
                                builder: (ctx) => MyBottomSheet(
                                    drinks: state.drinks, ctx: context),
                              );
                            },
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue[200],
                            icon: const Icon(Icons.shopping_bag_outlined),
                            label: Text(
                              AppLocalizations.of(context)!.localeName == "ru"
                                  ? '${state.summ.round()} ₽'
                                  : '${state.summ.round()} \$',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ));
                  }

                  return Container();
                },
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ScrollablePositionedList.builder(
                  itemCount: state.coffeList.length,
                  itemScrollController: itemController,
                  itemPositionsListener: itemListener,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.coffeList[index].title,
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: state.coffeList[index].drinks.length,
                          itemBuilder: (BuildContext context, int jindex) {
                            return CoffeCard(
                              drinkModel: state.coffeList[index].drinks[jindex],
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          }
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
