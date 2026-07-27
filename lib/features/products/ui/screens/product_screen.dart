/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rania_store/core/di/dependency_injection.dart';
import 'package:rania_store/core/theme/text_styles.dart';
import 'package:rania_store/features/products/logic/cubit/product_cubit.dart';
import 'package:rania_store/features/products/logic/cubit/product_state.dart';
import 'package:rania_store/features/products/ui/widgets/product_item.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()..getAllProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Rania Store", style: TextStyles.appBarTitle),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// Search
              TextField(
                decoration: InputDecoration(
                  hintText: "Search products...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),

                      loading: () =>
                          const Center(child: CircularProgressIndicator()),

                      success: (products) {
                        return GridView.builder(
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: .63,
                              ),
                          itemBuilder: (context, index) {
                            return ProductItem(product: products[index]);
                          },
                        );
                      },

                      fail: (error) {
                        return Center(child: Text(error));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
