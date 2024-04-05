import 'package:coffe_shop/src/features/menu/data/coffe_repository.dart';
import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'coffe_list_event.dart';
part 'coffe_list_state.dart';

class CoffeListBloc extends Bloc<CoffeListEvent, CoffeListState> {
  final ICoffeRepository _coffeRepository;
  CoffeListBloc({required ICoffeRepository coffeRepository})
      : _coffeRepository = coffeRepository,
        super(CoffeListInitial()) {
    on<LoadCoffeListEvent>(_loadCoffeList);

    on<SendOrderEvent>(_sendOrder);
  }
  _loadCoffeList(LoadCoffeListEvent event, Emitter<CoffeListState> emit) async {
    final coffeList = await _coffeRepository.fetchData();
    emit(CoffeListLoaded(coffeList: coffeList));
  }

  _sendOrder(SendOrderEvent event, Emitter<CoffeListState> emit) async {
    await _coffeRepository.sendOrder(event.context);
  }
}
