part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class Productloading extends ProductState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
final class Productloaded extends ProductState {
  List<Products>? plist;

  Productloaded(this.plist);
  @override
  List<Object> get props => [plist!];
}

// ignore: must_be_immutable
final class ProductLoadingError extends ProductState {
  String? errormessage;

  ProductLoadingError(this.errormessage);
  @override
  List<Object> get props => [errormessage!];
}
