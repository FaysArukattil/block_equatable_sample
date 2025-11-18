// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:block_equatable_sample/models/respproducts.dart';
import 'package:block_equatable_sample/services/apiservice.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(Productloading()) {
    ApiService apiService = ApiService();
    on<Fetch>((event, emit) async {
      emit(Productloading());
      try {
        var list = await apiService.loadproducts();
        emit(Productloaded(list!));
      } catch (e) {
        emit(ProductLoadingError(e.toString()));
      }
    });
  }
}
