import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/products/bloc/products_bloc.dart';
import 'package:product_list/features/products/presentation/widgets/product_list_item.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        switch (state.status) {
          case ProductsStatus.failure:
            return const Center(child: Text('failed to fetch products'));
          case ProductsStatus.success:
            if (state.products.isEmpty) {
              return const Center(child: Text('no products'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ProductListItem(product: state.products[index]);
              },
              itemCount: state.products.length,
              controller: _scrollController,
            );
          case ProductsStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
