part of 'service_cubit.dart';

@immutable
sealed class ServiceState {}

final class ServiceInitial extends ServiceState {}

final class ServiceCategoryLoading extends ServiceState {}

final class ServiceCategoryLoaded extends ServiceState {
  final List<Category> datas;
  ServiceCategoryLoaded(this.datas);
}

final class ServiceCategoryError extends ServiceState {
  final String message;
  ServiceCategoryError(this.message);
}

final class ServiceLoading extends ServiceState {}

final class ServiceLoaded extends ServiceState {
  final List<Service> datas;
  ServiceLoaded(this.datas);
}

final class ServiceError extends ServiceState {
  final String message;
  ServiceError(this.message);
}
