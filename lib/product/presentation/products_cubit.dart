import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fake_store/product/domain/entity/product.dart';
import 'package:flutter_fake_store/product/domain/usecase/get_all_products.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final GetAllProducts _getAllProducts;

  int? _limit;
  int? get limit => _limit;
  set limit(int? v) {
    _limit = v;
    getData();
  }

  Sort? _sort;
  Sort? get sort => _sort;
  set sort(Sort? v) {
    _sort = v;
    getData();
  }

  String? _category;
  String? get category => _category;
  set category(String? v) {
    _category = v;
    getData();
  }

  ProductsCubit(this._getAllProducts) : super(ProductsState()) {
    getData();
  }

  Future<void> getData() async {
    emit(ProductsState(
      isLoading: true,
      data: state.data,
    ));

    GetAllProductsParam param = GetAllProductsParam(
      limit: limit,
      sort: sort,
      category: category,
    );

    List<Product> doTask = await _getAllProducts(param);

    emit(ProductsState(
      isLoading: false,
      data: doTask,
      sort: sort,
      category: category,
    ));
  }
}

class ProductsState {
  final bool isLoading;
  final List<Product> data;
  final Sort? sort;
  final String? category;

  ProductsState({
    this.isLoading = true,
    this.data = const [],
    this.sort,
    this.category,
  });
}
