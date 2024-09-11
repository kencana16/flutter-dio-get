import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fake_store/dependencies.dart';
import 'package:flutter_fake_store/product/domain/entity/product.dart';
import 'package:flutter_fake_store/product/presentation/categories_cubit.dart';
import 'package:flutter_fake_store/product/presentation/product_grid_item.dart';
import 'package:flutter_fake_store/product/presentation/products_cubit.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsCubit>(),
        ),
      ],
      child: Builder(
        builder: (
          context,
        ) {
          ProductsState productState = context.watch<ProductsCubit>().state;
          CategoriesState categoriestate =
              context.watch<CategoriesCubit>().state;

          return LayoutBuilder(builder: (context, constraint) {
            double maxWidth = constraint.maxWidth;

            int crossAxisCount = 2;
            print(maxWidth);
            if (maxWidth.isFinite) {
              crossAxisCount = (maxWidth / 210).floor();
            }

            return CustomScrollView(
              slivers: [
                ///Category
                if (categoriestate.isLoading)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: const SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    ),
                  )
                else ...[
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        "Daftar Kategori",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: categoriestate.data
                            .map((e) => ChoiceChip(
                                  label: Text(e),
                                  onSelected: (value) => context
                                      .read<ProductsCubit>()
                                      .category = e,
                                  selected: productState.category == e,
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 16,
                  ),
                ),

                /// Produk
                if (productState.isLoading)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: const SliverFillRemaining(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    ),
                  )
                else ...[
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        "Daftar Produk",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverGrid.builder(
                      itemCount: productState.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: 2 / 3,
                      ),
                      itemBuilder: (context, index) {
                        Product item = productState.data[index];

                        return ProductGridItem(item: item);
                      },
                    ),
                  ),
                ]
              ],
            );
          });
        },
      ),
    );
  }
}
