import 'package:flutter/material.dart';
import 'package:flutter_fake_store/dependencies.dart';
import 'package:flutter_fake_store/router.dart';
import 'package:go_router/go_router.dart';

import 'product/presentation/product_grid.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      initialLocation: HomeRoute().location, // location getter is generated.
      routes: $appRoutes,
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Store"),
      ),
      body: ProductGridPage(),
    );
  }
}
