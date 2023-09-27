import 'package:flutter/material.dart';
import 'package:product_list/features/products/data/models/product.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: Text(product.title),
        isThreeLine: true,
        subtitle: Text(product.description),
        dense: true,
      ),
    );
  }
}
