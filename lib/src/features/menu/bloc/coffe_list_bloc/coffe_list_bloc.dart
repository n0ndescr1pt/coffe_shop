import 'package:coffe_shop/src/features/map/data/map_repository.dart';
import 'package:coffe_shop/src/features/map/models/point_model.dart';
import 'package:coffe_shop/src/features/menu/data/coffe_repository.dart';
import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:coffe_shop/src/features/menu/utils/scaffold_message.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coffe_list_event.dart';
part 'coffe_list_state.dart';

class CoffeListBloc extends Bloc<CoffeListEvent, CoffeListState> {
  final ICoffeRepository _coffeRepository;
  final IMapRepository _mapRepository;
  List<CoffeModel> coffeList = [];
  List<MapPointModel> mapPoints = [];
  String adress = "";
  CoffeListBloc(
      {required ICoffeRepository coffeRepository,
      required IMapRepository mapRepository})
      : _coffeRepository = coffeRepository,
        _mapRepository = mapRepository,
        super(CoffeListInitial()) {
    on<LoadCoffeListEvent>(_loadCoffeList);
    on<SetAdressEvent>(_setAdress);
    on<SendOrderEvent>(_sendOrder);
  }
  _loadCoffeList(LoadCoffeListEvent event, Emitter<CoffeListState> emit) async {
    coffeList = await _coffeRepository.fetchData();
    mapPoints = await _mapRepository.getPointList();
    adress = await _mapRepository.getSavedAdress();
    emit(CoffeListLoaded(
        coffeList: coffeList, mapPoints: mapPoints, adress: adress));
  }

  _sendOrder(SendOrderEvent event, Emitter<CoffeListState> emit) async {
    bool isSend = await _coffeRepository.sendOrder();
    if (event.context.mounted) {
      if (isSend) {
        showScaffoldMessage(event.context, "Успешно отправлено");
      } else {
        showScaffoldMessage(event.context, "Ошибка");
      }
    }
  }

  _setAdress(SetAdressEvent event, Emitter<CoffeListState> emit) async {
    await _mapRepository.setAdress(event.adress);
    emit(CoffeListLoaded(
        coffeList: coffeList, mapPoints: mapPoints, adress: adress));
  }
}
