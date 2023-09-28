import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:product_list/features/products/data/models/product.dart';
import 'package:product_list/features/products/data/repositories/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required ProductsRepository repository})
      : _repository = repository,
        super(const ProductsState()) {
    on<ProductsFetched>(
      _onProductsFetched,
    );
    on<ProductsSorted>(
      _onProductsSorted,
      transformer: droppable(),
    );
    on<ProductsSearched>(
      _onProductsSearched,
    );
  }

  final ProductsRepository _repository;

  Future<void> _onProductsFetched(
    ProductsFetched event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ProductsStatus.loading));

      final products = await _repository.getProducts();

      return emit(state.copyWith(
        status: ProductsStatus.loaded,
        initialProducts: products,
        products: products,
      ));
    } catch (_) {
      emit(state.copyWith(status: ProductsStatus.failed));
    }
  }

  Future<void> _onProductsSorted(
    ProductsSorted event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: ProductsStatus.loading,
        sorting: event.sorting,
      ));

      final products = await _repository.getProducts(sorting: event.sorting);

      return emit(state.copyWith(
        status: ProductsStatus.loaded,
        initialProducts: products,
        products: products,
      ));
    } catch (_) {
      emit(state.copyWith(status: ProductsStatus.failed));
    }
  }

  Future<void> _onProductsSearched(
    ProductsSearched event,
    Emitter<ProductsState> emit,
  ) async {
    if (state.status != ProductsStatus.loaded) return;

    try {
      final query = event.query.toLowerCase();
      final filteredProducts = state.initialProducts
          .where((e) =>
              e.title.toLowerCase().startsWith(query) ||
              e.description.toLowerCase().startsWith(query))
          .toList();

      return emit(state.copyWith(products: filteredProducts, query: query));
    } catch (_) {
      emit(state.copyWith(status: ProductsStatus.failed));
    }
  }
}
