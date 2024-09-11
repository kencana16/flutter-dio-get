import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fake_store/product/domain/entity/product.dart';
import 'package:injectable/injectable.dart';

import '../domain/usecase/get_product_by_id.dart';

@injectable
class ProductDetailCubit extends Cubit<ProductDetailState> {
  final GetProductById _getProductById;

  ProductDetailCubit(this._getProductById) : super(ProductDetailState()) {}

  Future<void> getData(String id) async {
    emit(ProductDetailState(
      isLoading: true,
      data: state.data,
    ));

    Product doTask = await _getProductById(id);

    emit(ProductDetailState(
      isLoading: false,
      data: doTask,
    ));
  }
}

class ProductDetailState {
  final bool isLoading;
  final Product? data;

  ProductDetailState({this.isLoading = true, this.data, F});
}
