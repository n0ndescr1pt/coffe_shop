part of 'coffe_list_bloc.dart';

@immutable
sealed class CoffeListEvent {}

class LoadCoffeListEvent extends CoffeListEvent {

}

class SendOrderEvent extends CoffeListEvent {
  final BuildContext context;

  SendOrderEvent({required this.context});
}
class SetAdressEvent extends CoffeListEvent {
  final String adress;

  SetAdressEvent({required this.adress});
}
