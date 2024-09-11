import 'package:flutter_fake_store/product/domain/entity/product.dart';
import 'package:flutter_fake_store/product/domain/usecase/get_all_products.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class FakeStoreDatasource {
  Future<List<Product>> getAllProducts(GetAllProductsParam param);

  Future<List<String>> getAllCategories();

  Future<Product> getProductById(String id);
}

@Injectable(as: FakeStoreDatasource)
class FakeStoreDatasourceImpl extends FakeStoreDatasource {
  final Dio _dio;

  FakeStoreDatasourceImpl()
      : _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com')) {
    _dio.interceptors.add(PrettyDioLogger());
  }

  @override
  Future<List<String>> getAllCategories() {
    return _dio.get<List<dynamic>>('/products/categories').then((value) =>
        value.data
            ?.map((e) => e is String ? e : null)
            .whereType<String>()
            .toList() ??
        []);
  }

  @override
  Future<List<Product>> getAllProducts(GetAllProductsParam param) {
    String path = '/products';

    var category = param.category;
    if (category != null && category.isNotEmpty) {
      path = '/products/category/$category';
    }

    Map<String, dynamic> queryParam = {
      'limit': param.limit,
      'sort': param.sort?.name,
    };

    queryParam.removeWhere((key, value) => value == null);

    return _dio
        .get<List<dynamic>>(
          path,
          queryParameters: queryParam,
        )
        .then((value) =>
            value.data
                ?.map((e) =>
                    e is Map<String, dynamic> ? Product.fromJson(e) : null)
                .whereType<Product>()
                .toList() ??
            []);
  }

  @override
  Future<Product> getProductById(String id) {
    String path = '/products/$id';

    return _dio
        .get<Map<String, dynamic>>(
          path,
        )
        .then((value) => Product.fromJson(value.data ?? {}));
  }
}
