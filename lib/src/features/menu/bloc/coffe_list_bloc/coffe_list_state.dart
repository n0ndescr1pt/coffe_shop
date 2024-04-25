part of 'coffe_list_bloc.dart';

@immutable
sealed class CoffeListState {}

final class CoffeListInitial extends CoffeListState {}

class CoffeListLoading extends CoffeListState {}

class CoffeListLoaded extends Equatable implements CoffeListState {
  final List<CoffeModel> coffeList;
  final List<MapPointModel> mapPoints;
  final String adress;

  const CoffeListLoaded(
      {required this.coffeList, required this.mapPoints, required this.adress});

  @override
  // TODO: implement props
  List<Object?> get props => [coffeList, mapPoints, adress];
}
