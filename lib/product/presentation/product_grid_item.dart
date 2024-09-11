import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fake_store/product/domain/entity/product.dart';
import 'package:flutter_fake_store/router.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context) {
    var image = item.image;
    var id = item.id;
    return Card(
        child: InkWell(
      onTap: id == null
          ? null
          : () {
              ProductDetailsRoute(id: id).go(context);
            },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: "image_$id",
            child: AspectRatio(
              aspectRatio: 1.3,
              child: ColoredBox(
                color: Colors.white,
                child:
                    image != null ? Image.network(image) : const FlutterLogo(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item.title ?? "",
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                  ),
                  if (item.description?.isNotEmpty ?? false)
                    Text(
                      item.description ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontSize: 8),
                      maxLines: 2,
                    ),
                  const Spacer(),
                  Text(
                    "\$${item.price?.toString() ?? ""}",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.end,
                  ),
                  Row(
                    children: [
                      Text(
                        item.category ?? "",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const Spacer(),
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
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
