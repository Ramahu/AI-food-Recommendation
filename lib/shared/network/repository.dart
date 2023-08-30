import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../model/favmodel.dart';
import '../../model/foodModel.dart';
import '../../model/mealmodel.dart';
import '../../model/pollmodel.dart';
import '../../model/resultModel.dart';
import '../../model/usermodel.dart';
import 'local/cache_helper.dart';
import 'remote/dio_helper.dart';

class Repository {
  String server1 = 'http://127.0.0.1:8000';
  String server2 = 'https://ahmadfrehan.000webhostapp.com';
  LoginModel? loginModel;
  RegisterModel? registerModel;
  PollModel? pollModel;
  AllInSystemDietModel? allInSystemDietModel;
  FoodsModel? searchList;
  FavModel? favModel;
  FavModel? deleteModel;
  FoodsModel? favFoods;
  AllFavModel? allFavModel;


  @override
  Future login({
    required String email,
    required String password,
  }) async {
    return await DioHelper.postData(
      url: '$server2/api/login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      Map<String, dynamic> data = Map<String, dynamic>.from(value.data);
      loginModel = LoginModel.fromJson(data);
      print('========================data======================');
      print(value.data);
      print('========================data======================');
      print(loginModel!.message);
      print(loginModel!.user?.email);
      print('=======================statusCode=================');
      print(value.statusCode);
      print('=================================================');
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Future register({
    required String email,
    required String password,
    String? gender,
    required String name,
  }) async {
    return await DioHelper.postData(
      url: '$server2/api/register',
      data: {
        'email': email,
        'password': password,
        'name': name,
        'gender': gender,
      },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print('========================data======================');
      print(value.data);
      print('========================data======================');
      print(registerModel!.message);
      print(registerModel!.token);
      print(registerModel!.user?.name);
      print('=======================statusCode=================');
      print(value.statusCode);
      print('=================================================');
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Future<Either<String, ResultModel>> poll({
    required String age,
    required String weight,
    required String height,
    required String activity,
    required String gender,
    required String goal,
    required String vegetarian,
    List<String>? allergy,
    List<String>? diseases,
  }) async {
    final response = await DioHelper.postData(
      url: '$server1/SystemDiet',
      data: {
        'age': age,
        'weight': weight,
        'height': height,
        'activity': activity,
        'goal': goal,
        'gender': gender,
        'vegetarian': vegetarian,
        'allergy': allergy,
        'diseases': diseases,
      },
    );
    Map<String, dynamic> data = Map<String, dynamic>.from(response.data);
    try {
      allInSystemDietModel = AllInSystemDietModel.fromJson(data['result']);
      log(allInSystemDietModel.toString());
      print('================poll========data======================');
      print(response.data);
      print('=================poll======statusCode=================');
      print(response.statusCode);
      print(allInSystemDietModel?.Breakfast_Protein?[0].toString());
      print('======================updateUser===========================');
      ResultModel resultModel = await updateUser(
          age: age,
          activity: activity,
          allInSystemDietModel: allInSystemDietModel);
      print('======================poll===========================');
      return Right(resultModel!);
    } catch (error) {
      log(error.toString());
      return Left(error.toString());
    }
  }

  String? token = CacheHelper.getData(key: 'token');
  String? userName = CacheHelper.getData(key: 'name');
  String? userEmail = CacheHelper.getData(key: 'email');

  @override
  Future<ResultModel> updateUser(
      {required String age,
      required String activity,
      AllInSystemDietModel? allInSystemDietModel}) async {
    log("${loginModel?.token}");
    log("${token}");
    final response = await DioHelper.postData(
      url: '$server2/api/update',
      token: "$token",
      data: {
        'name': userName ?? "",
        'email': userEmail ?? "",
        'age': age,
        'weight': allInSystemDietModel?.weight,
        'height': 170,
        'activity': activity,
        'goal': allInSystemDietModel?.goal,
        'gender': allInSystemDietModel?.gender,
        'vegetarian': allInSystemDietModel?.vegetarian,
        'food_allergy': allInSystemDietModel?.allergy,
        'BMR': allInSystemDietModel?.BMR,
        'daily_calories': allInSystemDietModel?.daily?.calories,
        'breakfast_calories': allInSystemDietModel?.meal?[0].calories,
        'lunch_calories': allInSystemDietModel?.meal?[1].calories,
        'dinner_calories': allInSystemDietModel?.meal?[2].calories,
        'daily_protein': allInSystemDietModel?.daily_Protein,
        'breakfast_protein': allInSystemDietModel?.Breakfast_Protein,
        'lunch_protein': allInSystemDietModel?.Lunch_Protein,
        'dinner_protein': allInSystemDietModel?.Dinner_Protein,
        'daily_carbohydrate': allInSystemDietModel?.daily?.Carbohydrate,
        'breakfast_carbohydrate': allInSystemDietModel?.Breakfast_Carbohydrate,
        'lunch_carbohydrate': allInSystemDietModel?.Lunch_Carbohydrate,
        'dinner_carbohydrate': allInSystemDietModel?.Dinner_Carbohydrate,
        'daily_fat': allInSystemDietModel?.daily_fat,
        'breakfast_fat': allInSystemDietModel?.Breakfast_fat,
        'lunch_fat': allInSystemDietModel?.Lunch_fat,
        'dinner_fat': allInSystemDietModel?.Dinner_fat,
        'daily_saturatedFat': allInSystemDietModel?.Dinner_SaturatedFat,
        'breakfast_saturatedFat': allInSystemDietModel?.Breakfast_SaturatedFat,
        'lunch_saturatedFat': allInSystemDietModel?.Lunch_SaturatedFat,
        'dinner_saturatedFat': allInSystemDietModel?.Dinner_SaturatedFat,
        'daily_sugar': allInSystemDietModel?.daily_Sugar,
        'breakfast_sugar': allInSystemDietModel?.Breakfast_Sugar,
        'lunch_sugar': allInSystemDietModel?.Lunch_Sugar,
        'dinner_sugar': allInSystemDietModel?.Dinner_Sugar,
        'daily_fiber': allInSystemDietModel?.daily_Fiber,
        'breakfast_fiber': allInSystemDietModel?.Breakfast_Fiber,
        'lunch_fiber': allInSystemDietModel?.Lunch_Fiber,
        'dinner_fiber': allInSystemDietModel?.Dinner_Fiber,
        'daily_sodium': allInSystemDietModel?.daily_Sodium,
        'breakfast_sodium': allInSystemDietModel?.Breakfast_Sodium,
        'lunch_sodium': allInSystemDietModel?.Lunch_Sodium,
        'dinner_sodium': allInSystemDietModel?.Dinner_Sodium,
        'daily_cholesterol': allInSystemDietModel?.daily_Cholesterol,
        'breakfast_cholesterol': allInSystemDietModel?.Breakfast_Cholesterol,
        'lunch_cholesterol': allInSystemDietModel?.Lunch_Cholesterol,
        'dinner_cholesterol': allInSystemDietModel?.Dinner_Cholesterol,
      },
    );
    print('======================updateUser==data======================');
    print(response.data['user']);
    ResultModel resultModel = ResultModel.fromJson(response.data['user']);
    print('==================updateUser=====statusCode=================');
    print(response.statusCode);
    print('========================updateUser=========================');
    return resultModel;
  }

  @override
  Future search({
    required  List<String> text,
  }) async {
    return await DioHelper.postData(
      url: '$server1/predict/',
      data: {
        "ingredients": text,
        "nutrition_input": [],
        "non_ingredients": [],
        "params": {"n_neighbors": 5, "return_distance": false}
      },
    ).then((value) {
      Map<String, dynamic> data = Map<String, dynamic>.from(value.data);
      searchList = FoodsModel.fromJson(data['output']);
      print('======================search==data======================');
      print(value.data);
      print('===================search====statusCode=================');
      print(value.statusCode);
      print(searchList?.foods.length);
      print('=========================search========================');
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<Either<String, ResultModel>> getUserDetails() async {
    try {
      final response =
          await DioHelper.getData(url: "$server2/api/show", token: token);
      log(response.toString());
      log(response.data.toString());
      Map<String, dynamic> data = Map<String, dynamic>.from(response.data);
      ResultModel resultModel = ResultModel.fromJson(data['user']);
      log(resultModel.toString());
      return Right(resultModel);
    } catch (error) {
      log(error.toString());
      return Left(error.toString());
    }
  }

  @override
  Future searchID({
    required List<int?> ids,
  }) async {
    return await DioHelper.postData(
      url: '$server1/get-by-id/',
      data: {
        "ids": ids,
      },
    ).then((value) {
      Map<String, dynamic> data = Map<String, dynamic>.from(value.data);
      favFoods = FoodsModel.fromJson(data['output']);
      print('====================searchID====data======================');
      print(value.data);
      print('====================searchID===statusCode=================');
      print(value.statusCode);
      print(favFoods?.foods.length);
      print('======================searchID===========================');
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<Either<String, List<FoodModel>>> predict(
      Map<String, dynamic> dataSend) async {
    try {
      final response = await DioHelper.postData(
          url: "$server1/predict/", data: json.encode(dataSend));
      log(response.toString());
      log(response.data.toString());
      Map<String, dynamic> data = Map<String, dynamic>.from(response.data);

      List<FoodModel> predictModel = [];
      for (var i in data['output']) {
        predictModel.add(FoodModel.fromJson(i));
      }

      log(predictModel.toString());
      return Right(predictModel);
    } catch (error) {
      log(error.toString());
      return Left(error.toString());
    }
  }

  @override
  Future addToFav({
    required String id,
  }) async {
    return await DioHelper.postData(
      url: '$server2/api/add-to-favorite',
      token: "${token}",
      data: {
        'recipe_id': id,
      },
    ).then((value) {
      favModel = FavModel.fromJson(value.data);
      print('===================addToFav=====data======================');
      print(value.data);
      print('=====================addToFav==statusCode=================');
      print(value.statusCode);
      print('=========================addToFav========================');
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Future getFav() async {
    return await DioHelper.getData(
      url: '$server2/api/get-favorite',
      token: "${token}",
    ).then((value) {
      allFavModel = AllFavModel.fromJson(value.data);
      print('===================getFav=====data======================');
      print(value.data);
      print('=====================getFav==statusCode=================');
      print(value.statusCode);
      print(allFavModel?.favorite);
      print('=========================getFav========================');
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Future deleteToFav({
    required String id,
  }) async {
    return await DioHelper.postData(
      url: '$server2/api/remove-to-favorite',
      token: "${token}",
      data: {
        'recipe_id': id,
      },
    ).then((value) {
      deleteModel = FavModel.fromJson(value.data);
      print('===================deleteToFav=====data======================');
      print(value.data);
      print('=====================deleteToFav==statusCode=================');
      print(value.statusCode);
      print('=========================deleteToFav========================');
    }).catchError((error) {
      print(error.toString());
    });
  }

}

