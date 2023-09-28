import 'package:product_list/features/products/data/models/product.dart';

enum Sorting { asc, desc }

abstract class ProductsRepository {
  Future<List<Product>> getProducts({Sorting sorting});
}
