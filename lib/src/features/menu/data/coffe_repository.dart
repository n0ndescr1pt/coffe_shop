
import 'package:coffe_shop/src/features/menu/data/data_source/coffe_data_source.dart';
import 'package:coffe_shop/src/features/menu/data/data_source/savable_coffe_data_source.dart';
import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:coffe_shop/src/features/menu/models/dto/coffe_dto.dart';

abstract class ICoffeRepository {
  Future<List<CoffeModel>> fetchData();
  Future<bool> sendOrder();
}

class CoffeRepository implements ICoffeRepository {
  final ICoffeDataSource _networkCoffeDataSource;
  final IDBCoffeDataSource _dbCoffeDataSource;

  const CoffeRepository(
      {required ICoffeDataSource networkCoffeDataSource,
      required IDBCoffeDataSource dbCoffeDataSource})
      : _networkCoffeDataSource = networkCoffeDataSource,
        _dbCoffeDataSource = dbCoffeDataSource;

  @override
  Future<List<CoffeModel>> fetchData() async {
    var dtos = <CoffeDto>[];
    try {
      dtos = await _networkCoffeDataSource.getData();
      await _dbCoffeDataSource.updateCoffeList(dtos);
    } catch (e) {
      dtos = await _dbCoffeDataSource.getCoffeList();
    }
    return dtos.map((e) => CoffeModel.fromDto(e)).toList();
  }

  @override
  Future<bool> sendOrder() async {
   return await _networkCoffeDataSource.sendOrder();
  }
}
