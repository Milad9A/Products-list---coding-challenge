import 'package:product_list/features/products/data/models/product.dart';
import 'package:product_list/features/products/data/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<List<Product>> getProducts({Sorting sorting = Sorting.asc}) async {
    final products = await Product.generateFakeProducts();

    if (sorting == Sorting.desc) {
      products.sort((a, b) => b.title.compareTo(a.title));
      return products;
    }

    return products;
  }
}
