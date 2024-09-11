// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_fake_store/product/data/datasource/fake_store_datasource.dart'
    as _i3;
import 'package:flutter_fake_store/product/data/repository/fake_store_repository_impl.dart'
    as _i5;
import 'package:flutter_fake_store/product/domain/repository/fake_store_repository.dart'
    as _i4;
import 'package:flutter_fake_store/product/domain/usecase/get_all_categories.dart'
    as _i6;
import 'package:flutter_fake_store/product/domain/usecase/get_all_products.dart'
    as _i7;
import 'package:flutter_fake_store/product/domain/usecase/get_product_by_id.dart'
    as _i8;
import 'package:flutter_fake_store/product/presentation/categories_cubit.dart'
    as _i10;
import 'package:flutter_fake_store/product/presentation/product_detail_cubit.dart'
    as _i11;
import 'package:flutter_fake_store/product/presentation/products_cubit.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.FakeStoreDatasource>(() => _i3.FakeStoreDatasourceImpl());
    gh.factory<_i4.FakeStoreRepository>(() =>
        _i5.FakeStoreRepositoryImpl(datasource: gh<_i3.FakeStoreDatasource>()));
    gh.factory<_i6.GetAllCategories>(() => _i6.GetAllCategories(
        fakeStoreRepository: gh<_i4.FakeStoreRepository>()));
    gh.factory<_i7.GetAllProducts>(() =>
        _i7.GetAllProducts(fakeStoreRepository: gh<_i4.FakeStoreRepository>()));
    gh.factory<_i8.GetProductById>(() =>
        _i8.GetProductById(fakeStoreRepository: gh<_i4.FakeStoreRepository>()));
    gh.factory<_i9.ProductsCubit>(
        () => _i9.ProductsCubit(gh<_i7.GetAllProducts>()));
    gh.factory<_i10.CategoriesCubit>(
        () => _i10.CategoriesCubit(gh<_i6.GetAllCategories>()));
    gh.factory<_i11.ProductDetailCubit>(
        () => _i11.ProductDetailCubit(gh<_i8.GetProductById>()));
    return this;
  }
}
