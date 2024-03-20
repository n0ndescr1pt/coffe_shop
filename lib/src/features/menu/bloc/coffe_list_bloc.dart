import 'package:bloc/bloc.dart';
import 'package:coffe_shop/src/features/menu/data/coffe_services.dart';
import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:meta/meta.dart';

part 'coffe_list_event.dart';
part 'coffe_list_state.dart';

class CoffeListBloc extends Bloc<CoffeListEvent, CoffeListState> {
  CoffeListBloc() : super(CoffeListInitial()) {

    on<LoadCoffeListEvent>((event, emit) async {
      final coffeList = await event.coffeServices.getData();
      emit(CoffeListLoaded(coffeList: coffeList));
    });
  }

}
