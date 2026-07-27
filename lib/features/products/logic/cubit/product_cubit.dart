import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rania_store/core/network/api_result.dart';
import 'package:rania_store/features/products/repos/product_repo.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;

  ProductCubit(this.productRepo) : super(ProductState.initial());

  Future<void> getAllProducts() async {
    emit(ProductState.loading());

    try {
      final response = await productRepo.getAllProducts();

      response.when(
        success: (data) {
          emit(ProductState.success(data));
        },
        failure: (error) {
          emit(ProductState.fail(error));
        },
      );
    } catch (e) {
      emit(ProductState.fail(e.toString()));
    }
  }
}
