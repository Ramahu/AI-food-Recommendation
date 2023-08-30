import 'dart:developer';
import 'dart:math' as math;
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/foodModel.dart';
import '../../../model/pollmodel.dart';
import '../../../model/resultModel.dart';
import '../../../shared/network/repository.dart';

part 'appEvent.dart';
part 'appState.dart';

class AppBloc extends Bloc<AppEvents, AppState> {
  final Repository repository;

  static AppBloc get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  var selectedGender = '';
  var selectedAct = '';
  var selectedGoal = '';
  var selectedVeg = '';
  List<String> selectedDiseases=[];
  ResultModel? resultModel;
  List<FoodModel> predictModelBreak = [];
  List<FoodModel> predictModelLunch = [];
  List<FoodModel> predictModelDinner = [];

  callFunInit() async {
    emit(Loading());
    var data = await repository.getUserDetails();
    log("==========getUserDetails=============");
    data.fold((l) {
      emit(Error(l.toString()));
      debugPrint("error");
    }, (r) {
      emit(Success(repository.pollModel));
      resultModel = r;
      performPredictFuncBreakFast().then((value){

        performPredictFuncBreakLunch().then((value){
          performPredictFuncBreakDinner();
        });
      });

    });
    log(data.toString());
  }

  double doubleInRange(math.Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  performPredictFuncBreakFast() async {
    emit(Loading());
    var data = await repository.predict({
      "nutrition_input": [
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.breakfast_calories![0].toString()),
            double.parse(resultModel!.breakfast_calories![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.breakfast_fat![0].toString()),
            double.parse(resultModel!.breakfast_fat![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.breakfast_saturatedFat![0].toString()),
            double.parse(resultModel!.breakfast_saturatedFat![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.breakfast_cholesterol![0].toString()),
            double.parse(resultModel!.breakfast_cholesterol![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.breakfast_sodium![0].toString()),
            double.parse(resultModel!.breakfast_sodium![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.breakfast_carbohydrate![0].toString()),
            double.parse(resultModel!.breakfast_carbohydrate![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.breakfast_fiber![0].toString()),
            double.parse(resultModel!.breakfast_fiber![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.breakfast_sugar![0].toString()),
            double.parse(resultModel!.breakfast_sugar![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.breakfast_protein![0].toString()),
            double.parse(resultModel!.breakfast_protein![1])),
      ],
      "ingredients": ["egg"],
      //"lamb",,"rice","lamb",chicken","beef",
      //resultModel?.food_allergy.toString()
      "non_ingredients": [],
      "params": {"n_neighbors": 5, "return_distance": false}
    });
    data.fold((l) {
      emit(Error(l.toString()));
      debugPrint("error");
    }, (r) {
      emit(Success(repository.pollModel));
      predictModelBreak = r;
    });

    log(data.toString());
  }
  performPredictFuncBreakLunch() async {
    emit(Loading());
    var data = await repository.predict({
      "nutrition_input": [
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.lunch_calories![0].toString()),
            double.parse(resultModel!.lunch_calories![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.lunch_fat![0].toString()),
            double.parse(resultModel!.lunch_fat![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.lunch_saturatedFat![0].toString()),
            double.parse(resultModel!.lunch_saturatedFat![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.lunch_cholesterol![0].toString()),
            double.parse(resultModel!.lunch_cholesterol![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.lunch_sodium![0].toString()),
            double.parse(resultModel!.lunch_sodium![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.lunch_carbohydrate![0].toString()),
            double.parse(resultModel!.lunch_carbohydrate![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.lunch_fiber![0].toString()),
            double.parse(resultModel!.lunch_fiber![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.lunch_sugar![0].toString()),
            double.parse(resultModel!.lunch_sugar![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.lunch_protein![0].toString()),
            double.parse(resultModel!.lunch_protein![1])),
      ],
      "ingredients": ["c"],
      "non_ingredients": [resultModel?.food_allergy.toString()],
      "params": {"n_neighbors": 5, "return_distance": false}
    });
    data.fold((l) {
      emit(Error(l.toString()));
      debugPrint("error");
    }, (r) {
      emit(Success(repository.pollModel));
      predictModelLunch = r;
    });

    log(data.toString());
  }
  performPredictFuncBreakDinner() async {
    emit(Loading());
    var data = await repository.predict({
      "nutrition_input": [
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.dinner_calories![0].toString()),
            double.parse(resultModel!.dinner_calories![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.dinner_fat![0].toString()),
            double.parse(resultModel!.dinner_fat![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.dinner_saturatedFat![0].toString()),
            double.parse(resultModel!.dinner_saturatedFat![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.dinner_cholesterol![0].toString()),
            double.parse(resultModel!.dinner_cholesterol![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.dinner_sodium![0].toString()),
            double.parse(resultModel!.dinner_sodium![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.dinner_carbohydrate![0].toString()),
            double.parse(resultModel!.dinner_carbohydrate![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.dinner_fiber![0].toString()),
            double.parse(resultModel!.dinner_fiber![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.dinner_sugar![0].toString()),
            double.parse(resultModel!.dinner_sugar![1])),
        doubleInRange(
            math.Random(),
            double.parse(resultModel!.dinner_protein![0].toString()),
            double.parse(resultModel!.dinner_protein![1])),
      ],
      "ingredients": ["c"],
      "non_ingredients": [resultModel?.food_allergy.toString()],
      "params": {"n_neighbors": 5, "return_distance": false}
    });
    data.fold((l) {
      emit(Error(l.toString()));
      debugPrint("error");
    }, (r) {
      emit(Success(repository.pollModel));
      predictModelDinner = r;
    });

    log(data.toString());
  }

  AppBloc(this.repository) : super(AppInitialState()) {

    on<AppChangeBottomIndex>((event, emit) {
      emit(AppNotChangeBottomIndexState());
      try {
        currentIndex = event.index;
        emit(AppChangeBottomIndexState());
      } catch (e) {}
    });

    on<InitFunc>((event, emit) async {
      log("Init Func");
     await callFunInit();
    });

    on<PollRequested>((event, emit) async {
      log("Poll");
      emit(Loading());
      var data = await repository.poll(
          age: event.age,
          weight: event.weight,
          height: event.height,
          activity: event.activity,
          goal: event.goal,
          gender: event.gender,
          vegetarian: event.vegetarian,
          allergy: event.allergy,
          diseases: event.disease);

      log("=========poll==============");
      data.fold((l) {
        emit(Error(l.toString()));
        debugPrint("error");
      }, (r) {
        emit(Success(repository.pollModel));
        resultModel = r;
      });

      log(data.toString());
    });
  }
  @override
  Stream<AppInitialState> mapEventToState(AppEvents event) async* {
    if (event is AppInitialState) {

      yield AppInitialState();
    }
  }

  @override
  void onTransition(Transition<AppEvents, AppState> transition) {
    if (transition.currentState is AppInitialState) {
      add(InitFunc());
    }
  }
}
