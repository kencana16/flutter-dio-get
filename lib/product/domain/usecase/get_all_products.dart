import 'package:flutter_fake_store/product/domain/entity/product.dart';
import 'package:injectable/injectable.dart';

import '../repository/fake_store_repository.dart';

@injectable
class GetAllProducts {
  final FakeStoreRepository _fakeStoreRepository;

  GetAllProducts({required FakeStoreRepository fakeStoreRepository})
      : _fakeStoreRepository = fakeStoreRepository;

  Future<List<Product>> call(GetAllProductsParam param) =>
      _fakeStoreRepository.getAllProducts(param);
}

enum Sort { asc, desc }

class GetAllProductsParam {
  final int? limit;
  final Sort? sort;
  final String? category;

  GetAllProductsParam({
    this.limit,
    this.sort,
    this.category,
  });
}
