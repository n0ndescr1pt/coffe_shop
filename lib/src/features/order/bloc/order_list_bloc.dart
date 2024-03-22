import 'package:coffe_shop/src/features/menu/models/drink_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_list_event.dart';
part 'order_list_state.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  final Map<int, DrinkModel> drinks;
  OrderListBloc(this.drinks) : super(OrderListInitial()) {
    on<AddToOrderEvent>((event, emit) {
      drinks[event.drink.productID] = DrinkModel(
          id: event.drink.id,
          name: event.drink.name,
          image: event.drink.image,
          price: event.drink.price,
          category: event.drink.category,
          counter: event.drink.counter,
          productID: event.drink.productID);
      print(drinks.values.toList());
    });

    on<RemoveFromOrderEvent>((event, emit) {
      drinks[event.drink.productID] = DrinkModel(
          id: event.drink.id,
          name: event.drink.name,
          image: event.drink.image,
          price: event.drink.price,
          category: event.drink.category,
          counter: event.drink.counter,
          productID: event.drink.productID);
      print(drinks.values.toList());
    });

    on<DoOrderEvent>((event, emit) {
      print(drinks.values.toList());
      emit(DoOrderState(drinks: drinks.values.toList()));
    });
  }
}
