part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductCategoryLoading extends ProductState {}

final class ProductCategoryLoaded extends ProductState {
  final List<Category> datas;
  ProductCategoryLoaded(this.datas);
}

final class ProductCategoryError extends ProductState {
  final String message;
  ProductCategoryError(this.message);
}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<Product> datas;
  ProductLoaded(this.datas);
}

final class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
