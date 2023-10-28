import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/data/repository/_index.dart';
import 'package:medicare/exceptions/app_exception.dart';
import 'package:medicare/models/_index.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final _repository = Modular.get<ProductRepository>();

  Future<void> categories() async {
    try {
      emit(ProductCategoryLoading());

      final datas = await _repository.categories();

      emit(ProductCategoryLoaded(datas));
    } on AppException catch (e) {
      emit(ProductCategoryError(e.message));
    } catch (e) {
      emit(ProductCategoryError(e.toString()));
    }
  }

  Future<void> lists(int? categoryId) async {
    try {
      emit(ProductLoading());

      final datas = await _repository.lists(categoryId);

      emit(ProductLoaded(datas));
    } on AppException catch (e) {
      emit(ProductError(e.message));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
