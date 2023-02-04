import 'package:chef_ruler/chef/main/model/product_model.dart';
import 'package:chef_ruler/chef/main/model/select_model.dart';
import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainInitialState extends MainState {}

class MainLoadingState extends MainState {}

class MainGetProductState extends MainState {
  List<MainPageModel> products;

  MainGetProductState({required this.products});
}

class SelectProductInitialState extends MainState {}

class SelectProductLoadingState extends MainState {}

class SelectProductGetState extends MainState {
  List<SelectProductModel> products;

  SelectProductGetState({required this.products});
}
