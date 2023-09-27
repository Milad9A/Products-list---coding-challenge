import 'package:product_list/features/products/data/models/product.dart';
import 'package:product_list/features/products/data/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<List<Product>> getProducts() {
    return Product.generateFakeProducts();
  }
}
