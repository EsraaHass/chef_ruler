import 'package:bloc/bloc.dart';
import 'package:chef_ruler/chef/main/bloc/main_event.dart';
import 'package:chef_ruler/chef/main/bloc/main_state.dart';
import 'package:chef_ruler/chef/main/data/local_data_services.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final LocalDataServices services;

  MainBloc(MainState initialState, this.services) : super(initialState) {
    // ignore: void_checks
    on<MainGetProductEvent>((event, emit) async {
      emit(MainLoadingState());
      try {
        var products = await services.getMainProduct();
        emit(MainGetProductState(products: products));
      } catch (e) {
        print('error message = ${e.toString()}');
      }
    });
    on<SelectProductGetEvent>((event, emit) async {
      emit(SelectProductInitialState());
      try {
        var products = await services.getSelectProduct(event.categoryGender);
        emit(SelectProductGetState(products: products));
      } catch (e) {
        print('error message = ${e.toString()}');
      }
    });
  }
}
