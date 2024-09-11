import 'package:flutter_fake_store/product/domain/entity/product.dart';
import 'package:injectable/injectable.dart';

import '../repository/fake_store_repository.dart';

@injectable
class GetProductById {
  final FakeStoreRepository _fakeStoreRepository;

  GetProductById({required FakeStoreRepository fakeStoreRepository})
      : _fakeStoreRepository = fakeStoreRepository;

  Future<Product> call(String id) =>
      _fakeStoreRepository.getProductById(id);
}

