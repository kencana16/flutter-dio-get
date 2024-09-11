import 'package:flutter/material.dart';
import 'package:flutter_fake_store/product/domain/entity/product.dart';
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
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 1.3,
          child: ColoredBox(
            color: Colors.white,
            child: image != null ? Image.network(image) : FlutterLogo(),
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
                    item.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontSize: 8),
                    maxLines: 2,
                  ),
                Spacer(),
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
                    Spacer(),
                    RatingBarIndicator(
                      rating: item.rating?.rate ?? 0,
                      itemBuilder: (context, index) => Icon(
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
    ));
  }
}
