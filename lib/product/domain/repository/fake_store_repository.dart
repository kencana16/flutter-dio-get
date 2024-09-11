import 'package:flutter_fake_store/product/domain/entity/product.dart';
import 'package:flutter_fake_store/product/domain/usecase/get_all_products.dart';

abstract class FakeStoreRepository {
  Future<List<Product>> getAllProducts(GetAllProductsParam param);

  Future<List<String>> getAllCategories();

  Future<Product> getProductById(String id);
}
