part of 'products_bloc.dart';

enum ProductsStatus { loading, loaded, failed }

class ProductsState extends Equatable {
  const ProductsState({
    this.status = ProductsStatus.loading,
    this.initialProducts = const <Product>[],
    this.products = const <Product>[],
    this.query = '',
    this.sorting = Sorting.asc,
  });

  final ProductsStatus status;
  final List<Product> initialProducts;
  final List<Product> products;
  final String query;
  final Sorting sorting;

  ProductsState copyWith({
    ProductsStatus? status,
    List<Product>? initialProducts,
    List<Product>? products,
    String? query,
    Sorting? sorting,
  }) {
    return ProductsState(
      status: status ?? this.status,
      initialProducts: initialProducts ?? this.initialProducts,
      products: products ?? this.products,
      query: query ?? this.query,
      sorting: sorting ?? this.sorting,
    );
  }

  @override
  List<Object> get props => [
        status,
        initialProducts,
        products,
        query,
        sorting,
      ];
}
