part of 'coffe_list_bloc.dart';

@immutable
sealed class CoffeListEvent {}

class LoadCoffeListEvent extends CoffeListEvent {
final CoffeServices coffeServices;

  LoadCoffeListEvent({required this.coffeServices});
}
