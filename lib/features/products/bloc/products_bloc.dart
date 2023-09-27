import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_list/features/products/data/models/product.dart';
import 'package:product_list/features/products/data/repositories/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required ProductsRepository repository})
      : _repository = repository,
        super(const ProductsState()) {
    on<ProductsFetched>(_onProductsFetched);
  }

  final ProductsRepository _repository;

  Future<void> _onProductsFetched(
    ProductsFetched event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      if (state.status == ProductsStatus.initial) {
        final products = await _repository.getProducts();

        return emit(state.copyWith(
          status: ProductsStatus.success,
          products: products,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: ProductsStatus.failure));
    }
  }
}
