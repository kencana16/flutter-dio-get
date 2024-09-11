// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../dependencies.dart';
import 'product_detail_cubit.dart';

class ProductDetailPage extends StatelessWidget {
  final int id;

  const ProductDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailCubit>()..getData(id.toString()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Produk"),
        ),
        body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            var item = state.data;
            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (item == null) {
              return Center(
                child: Text("Data Tidak Ditemukan"),
              );
            }

            var image = item.image;
            var id = item.id;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: "image_$id",
                    child: AspectRatio(
                      aspectRatio: 3,
                      child: ColoredBox(
                        color: Colors.white,
                        child: image != null
                            ? Image.network(image)
                            : const FlutterLogo(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          item.title ?? "",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (item.description?.isNotEmpty ?? false)
                          Text(
                            item.description ?? "",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        Text(
                          "\$${item.price?.toString() ?? ""}",
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          item.category ?? "",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        RatingBarIndicator(
                          rating: item.rating?.rate ?? 0,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
