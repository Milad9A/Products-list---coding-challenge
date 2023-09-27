import 'package:product_list/features/products/data/models/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
}
