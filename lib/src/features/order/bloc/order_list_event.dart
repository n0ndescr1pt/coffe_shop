part of 'order_list_bloc.dart';

@immutable
sealed class OrderListEvent {}

class AddToOrderEvent extends OrderListEvent {
  final DrinkModel drink;
  final String localName;

  AddToOrderEvent({required this.drink, required this.localName});
}

class RemoveFromOrderEvent extends OrderListEvent {
  final DrinkModel drink;
  final String localName;

  RemoveFromOrderEvent({required this.drink, required this.localName});
}

class ClearOrderEvent extends OrderListEvent {}
