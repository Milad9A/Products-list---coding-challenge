import 'package:bloc_test/bloc_test.dart';
import 'package:product_list/core/injection_container.dart' as di;
import 'package:product_list/features/products/bloc/products_bloc.dart';
import 'package:product_list/features/products/data/models/product.dart';
import 'package:product_list/features/products/data/repositories/products_repository.dart';
import 'package:test/test.dart';

void main() async {
  await di.init();

  group(
    'ProductsBloc',
    () {
      late ProductsBloc productsBloc;

      setUp(() {
        productsBloc = di.sl<ProductsBloc>();
      });

      test(
        'initial state is correct',
        () {
          expect(
            productsBloc.state,
            const ProductsState(),
          );
        },
      );

      blocTest(
        'Fetching products - should emit [loading, loaded]',
        build: () => productsBloc,
        act: (bloc) => bloc.add(ProductsFetched()),
        wait: const Duration(seconds: 2),
        expect: () => [
          const ProductsState(status: ProductsStatus.loading),
          isA<ProductsState>()
              .having(
                (s) => s.status,
                'status',
                ProductsStatus.loaded,
              )
              .having(
                (s) => s.products,
                'products',
                isA<List<Product>>(),
              )
              .having(
                (s) => s.initialProducts,
                'initial products',
                isA<List<Product>>(),
              ),
        ],
      );

      blocTest(
        'Sorting products in ascending order - should emit [loading, loaded]',
        build: () => productsBloc,
        act: (bloc) => bloc.add(const ProductsSorted(sorting: Sorting.asc)),
        wait: const Duration(seconds: 2),
        expect: () => [
          const ProductsState(
            status: ProductsStatus.loading,
            sorting: Sorting.asc,
          ),
          isA<ProductsState>()
              .having(
                (s) => s.status,
                'status',
                ProductsStatus.loaded,
              )
              .having(
                (s) => s.sorting,
                'sorting asc',
                Sorting.asc,
              )
        ],
      );

      blocTest(
        'Sorting products in descending order - should emit [loading, loaded]',
        build: () => productsBloc,
        act: (bloc) => bloc.add(const ProductsSorted(sorting: Sorting.desc)),
        wait: const Duration(seconds: 2),
        expect: () => [
          const ProductsState(
            status: ProductsStatus.loading,
            sorting: Sorting.desc,
          ),
          isA<ProductsState>()
              .having(
                (s) => s.status,
                'status',
                ProductsStatus.loaded,
              )
              .having(
                (s) => s.sorting,
                'sorting desc',
                Sorting.desc,
              )
        ],
      );
    },
  );
}
