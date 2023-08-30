import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/favmodel.dart';
import '../../../model/foodModel.dart';
import '../../../shared/network/repository.dart';

part 'food_events.dart';
part 'food_states.dart';

class FoodBloc extends Bloc<FoodEvents, FoodStates> {
  final Repository repository;
  List<int?> ids = [];
  List<FoodModel>? searchList;
  List<dynamic>? favIdList;

  FoodBloc({required this.repository}) : super(Fail()) {

    on<DelRequested>((event, emit) async {
      emit(Loading());
      try {
        await repository.deleteToFav(id: event.id);
        emit(SuccessDel(repository.favModel));
      } catch (e) {
        emit(Error(e.toString()));
        emit(Fail());
      }
    });

    on<FavRequested>((event, emit) async {
      emit(Loading());
      try {
        await repository.addToFav(id: event.id);
        emit(SuccessFav(repository.favModel));
      } catch (e) {
        emit(Error(e.toString()));
        emit(Fail());
      }
    });

    on<AllFavRequested>((event, emit) async {
      emit(Loading());
      try {
        await repository.getFav();
        emit(SuccessAllFav(repository.allFavModel));
        favIdList = repository.allFavModel?.favorite;
        ids = favIdList!.map((dynamic item) {
      if (item is int) {
      return item as int;
      } else if (item is String) {
      return int.tryParse(item);
      }
      return null;
      }).toList();
        print("=========favIdList==============");
        print(favIdList?.length);
        print(favIdList);
        print(ids);
        print("=========favIdList==============");
      } catch (e) {
        emit(Error(e.toString()));
        emit(Fail());
      }
    });

    on<SearchIDRequested>((event, emit) async {
      emit(Loading());
      try {
        await repository.searchID(ids: event.ids);
        emit(SuccessID(repository.favFoods));
        searchList = repository.favFoods?.foods;
        print("=========favFoods==============");
        print(searchList?.length);
        print(searchList);
        print("=========favFoods==============");
      } catch (e) {
        emit(Error(e.toString()));
        emit(Fail());
      }
    });
  }
}
