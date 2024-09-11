import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../domain/usecase/get_all_categories.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetAllCategories _getAllCategories;

  CategoriesCubit(this._getAllCategories)
      : super(CategoriesState()) {
    getData();
  }

  Future<void> getData() async {
    emit(CategoriesState(
      isLoading: true,
      data: state.data,
    ));

    List<String> doTask = await _getAllCategories();

    emit(CategoriesState(
      isLoading: false,
      data: doTask,
    ));
  }
}

class CategoriesState {
  final bool isLoading;
  final List<String> data;

  CategoriesState({
    this.isLoading = true,
    this.data = const [],
  });
}
