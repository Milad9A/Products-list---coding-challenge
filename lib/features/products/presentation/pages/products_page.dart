import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/core/injection_container.dart';
import 'package:product_list/features/products/bloc/products_bloc.dart';
import 'package:product_list/features/products/presentation/widgets/products_list.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocProvider(
        create: (_) => sl<ProductsBloc>()..add(ProductsFetched()),
        child: const ProductsList(),
      ),
    );
  }
}
