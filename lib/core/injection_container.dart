import 'package:get_it/get_it.dart';
import 'package:product_list/features/products/bloc/products_bloc.dart';
import 'package:product_list/features/products/data/repositories/products_repository_impl.dart';
import 'package:product_list/features/products/data/repositories/products_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// BLoCs
  sl.registerFactory(
    () => ProductsBloc(
      repository: sl<ProductsRepository>(),
    ),
  );

  /// Repositories
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(),
  );
}
