part of 'search_bloc.dart';

abstract class searchStates extends Equatable {}

class Loading extends searchStates {
  @override
  List<Object?> get props => [];
}

class Success extends searchStates {
  @override
  List<Object?> get props => [];

  final FoodsModel? foodsModel;

  Success(this.foodsModel);
}

class Fail extends searchStates {
  @override
  List<Object?> get props => [];
}

class Error extends searchStates {
  final String error;

  Error(this.error);

  @override
  List<Object?> get props => [error];
}
