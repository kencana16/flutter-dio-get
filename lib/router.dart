import 'package:flutter/material.dart';
import 'package:flutter_fake_store/main.dart';
import 'package:flutter_fake_store/product/presentation/product_detail_page.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<ProductDetailsRoute>(path: 'items/:id')
  ],
)
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) 
    => const MyHomePage();
}

class ProductDetailsRoute extends GoRouteData {
  final int id;
  const ProductDetailsRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductDetailPage(id: id);
}
