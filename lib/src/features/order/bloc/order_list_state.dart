part of 'order_list_bloc.dart';

@immutable
sealed class OrderListState {}

final class OrderListInitial extends OrderListState {}

class DoOrderState extends OrderListState {
  final List<DrinkModel> drinks;

  DoOrderState({required this.drinks});
}
