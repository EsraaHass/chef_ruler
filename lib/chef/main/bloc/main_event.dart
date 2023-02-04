import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainGetProductEvent extends MainEvent {}

class SelectProductGetEvent extends MainEvent {
  String categoryGender;

  SelectProductGetEvent(this.categoryGender);
}
