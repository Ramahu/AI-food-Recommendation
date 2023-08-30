part of 'food_bloc.dart';

abstract class FoodEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class FavRequested extends FoodEvents {
  final String id;

  FavRequested(this.id);
}

class DelRequested extends FoodEvents {
  final String id;

  DelRequested(this.id);
}

class AllFavRequested extends FoodEvents {
  // final List<int> ids;
  //
  // AllFavRequested(this.ids);
}

class SearchIDRequested extends FoodEvents {
  final List<int?> ids;

  SearchIDRequested(this.ids);
}
