part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductsFetched extends ProductsEvent {}

class ProductsSorted extends ProductsEvent {
  final Sorting sorting;

  const ProductsSorted({required this.sorting});
}

class ProductsSearched extends ProductsEvent {
  final String query;

  const ProductsSearched({required this.query});
}
