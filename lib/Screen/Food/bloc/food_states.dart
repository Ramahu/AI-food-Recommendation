part of 'food_bloc.dart';

abstract class FoodStates extends Equatable {}

class Loading extends FoodStates {
  @override
  List<Object?> get props => [];
}

class SuccessFav extends FoodStates {
  @override
  List<Object?> get props => [];

  final FavModel? favModel;

  SuccessFav(this.favModel);
}

class SuccessDel extends FoodStates {
  @override
  List<Object?> get props => [];

  final FavModel? favModel;

  SuccessDel(this.favModel);
}

class SuccessAllFav extends FoodStates {
  @override
  List<Object?> get props => [];

  final AllFavModel? allFavModel;

  SuccessAllFav(this.allFavModel);
}

class SuccessID extends FoodStates {
  @override
  List<Object?> get props => [];

  final FoodsModel? foodsModel;

  SuccessID(this.foodsModel);
}

class Fail extends FoodStates {
  @override
  List<Object?> get props => [];
}

class Error extends FoodStates {
  final String error;

  Error(this.error);

  @override
  List<Object?> get props => [error];
}
