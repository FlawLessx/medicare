import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicare/data/repository/_index.dart';
import 'package:medicare/exceptions/app_exception.dart';
import 'package:medicare/models/_index.dart';
import 'package:meta/meta.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());

  final _repository = Modular.get<ServiceRepository>();

  Future<void> categories() async {
    try {
      emit(ServiceCategoryLoading());

      final datas = await _repository.categories();

      emit(ServiceCategoryLoaded(datas));
    } on AppException catch (e) {
      emit(ServiceCategoryError(e.message));
    } catch (e) {
      emit(ServiceCategoryError(e.toString()));
    }
  }

  Future<void> lists(int categoryId) async {
    try {
      emit(ServiceLoading());

      final datas = await _repository.lists(categoryId);

      emit(ServiceLoaded(datas));
    } on AppException catch (e) {
      emit(ServiceError(e.message));
    } catch (e) {
      emit(ServiceError(e.toString()));
    }
  }
}
