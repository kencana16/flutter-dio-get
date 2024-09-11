import 'package:flutter_fake_store/product/data/datasource/fake_store_datasource.dart';
import 'package:flutter_fake_store/product/domain/entity/product.dart';
import 'package:flutter_fake_store/product/domain/repository/fake_store_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecase/get_all_products.dart';

@Injectable(as: FakeStoreRepository)
class FakeStoreRepositoryImpl extends FakeStoreRepository {
  final FakeStoreDatasource _datasource;

  FakeStoreRepositoryImpl({required FakeStoreDatasource datasource})
      : _datasource = datasource;

  @override
  Future<List<Product>> getAllProducts(GetAllProductsParam param) {
    return _datasource.getAllProducts(param);
  }

  @override
  Future<List<String>> getAllCategories() {
    return _datasource.getAllCategories();
  }
}
