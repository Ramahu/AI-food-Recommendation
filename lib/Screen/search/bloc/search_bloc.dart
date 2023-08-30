import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/foodModel.dart';
import '../../../shared/network/repository.dart';

part 'search_events.dart';
part 'search_states.dart';

class SearchBloc extends Bloc<SearchEvents, searchStates> {
  final Repository repository;
  List<FoodModel>? searchList;

  SearchBloc({required this.repository}) : super(Fail()) {
    on<SearchRequested>((event, emit) async {
      emit(Loading());
      try {
        await repository.search(
            text: event.text,
            //text2: event.text2
        );
        emit(Success(repository.searchList));
        searchList = repository.searchList?.foods;
        print("=========searchList==============");
        print(searchList?.length);
        print(searchList);
        print("=========searchList==============");
      } catch (e) {
        emit(Error(e.toString()));
        emit(Fail());
      }
    });
  }
}
