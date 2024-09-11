import 'package:injectable/injectable.dart';

import '../repository/fake_store_repository.dart';

@injectable
class GetAllCategories {
  final FakeStoreRepository _fakeStoreRepository;

  GetAllCategories({required FakeStoreRepository fakeStoreRepository})
      : _fakeStoreRepository = fakeStoreRepository;

  Future<List<String>> call() =>
      _fakeStoreRepository.getAllCategories();
}