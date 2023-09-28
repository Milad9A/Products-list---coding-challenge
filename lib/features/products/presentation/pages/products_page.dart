import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/core/injection_container.dart';
import 'package:product_list/features/products/bloc/products_bloc.dart';
import 'package:product_list/features/products/presentation/widgets/products_list.dart';
import 'package:product_list/features/products/presentation/widgets/search_field.dart';
import 'package:product_list/features/products/presentation/widgets/sorting_button.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductsBloc>()..add(ProductsFetched()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Products List')),
        body: const Column(
          children: [
            Row(
              children: [
                Expanded(child: SearchField()),
                SortingButton(),
              ],
            ),
            Expanded(
              child: ProductsList(),
            ),
          ],
        ),
      ),
    );
  }
}
