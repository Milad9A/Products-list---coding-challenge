import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/products/bloc/products_bloc.dart';
import 'package:product_list/features/products/data/repositories/products_repository.dart';

class SortingButton extends StatelessWidget {
  const SortingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProductsBloc, ProductsState, Sorting>(
      selector: (state) => state.sorting,
      builder: (context, sorting) {
        return IconButton(
          icon: Icon(
            sorting == Sorting.asc
                ? CupertinoIcons.sort_down
                : CupertinoIcons.sort_up,
          ),
          onPressed: () {
            context.read<ProductsBloc>().add(
                  ProductsSorted(
                    sorting:
                        sorting == Sorting.asc ? Sorting.desc : Sorting.asc,
                  ),
                );
          },
        );
      },
    );
  }
}
