import 'foodModel.dart';

class MealModel {
  String? name;
  double? calorie;
  List<String>? fat;
  List<String>? saturatedFat;
  List<String>? fiber;
  List<String>? carb;
  List<String>? protein;
  List<String>? sugar;
  List<String>? sodium;
  List<String>? cholesterol;
  List<FoodModel>? food;

  MealModel({
    this.name,
    this.calorie,
    this.fat,
    this.saturatedFat,
    this.fiber,
    this.carb,
    this.protein,
    this.sugar,
    this.sodium,
    this.cholesterol,
    this.food,
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    calorie = json['calories'];
    fat = json['fat'];
    saturatedFat = json['SaturatedFat'];
    fiber = json['Fiber'];
    carb = json['Carbohydrate'];
    protein = json['Protein'];
    sugar = json['Sugar'];
    sodium = json['Sodium'];
    cholesterol = json['Cholesterol'];
    protein = json['protein'];
    food = json['food'];
  }
}

class AllInSystemDietModel {
  String? gender;
  String? age;
  String? goal;
  String? weight;
  double? BMR;
  String? vegetarian;
  List? allergy;
  DailyMealModel? daily;
  List<DailyMealModel>? meal;
  List<double>? daily_Protein;

  List<double>? Breakfast_Protein;

  List<double>? Lunch_Protein;

  List<double>? Dinner_Protein;

  List<double>? daily_Carbohydrate;

  List<double>? Breakfast_Carbohydrate;

  List<double>? Lunch_Carbohydrate;

  List<double>? Dinner_Carbohydrate;

  List<double>? daily_fat;

  List<double>? Breakfast_fat;

  List<double>? Lunch_fat;

  List<double>? Dinner_fat;

  List<double>? daily_SaturatedFat;

  List<double>? Breakfast_SaturatedFat;

  List<double>? Lunch_SaturatedFat;

  List<double>? Dinner_SaturatedFat;

  List<double>? daily_Sugar;

  List<double>? Breakfast_Sugar;

  List<double>? Lunch_Sugar;

  List<double>? Dinner_Sugar;

  List<double>? daily_Fiber;

  List<double>? Breakfast_Fiber;

  List<double>? Lunch_Fiber;

  List<double>? Dinner_Fiber;

  List<double>? daily_Sodium;

  List<double>? Breakfast_Sodium;

  List<double>? Lunch_Sodium;

  List<double>? Dinner_Sodium;

  List<double>? daily_Cholesterol;

  List<double>? Breakfast_Cholesterol;

  List<double>? Lunch_Cholesterol;

  List<double>? Dinner_Cholesterol;

  AllInSystemDietModel({
    this.gender,
    this.age,
    this.goal,
    this.weight,
    this.BMR,
    this.vegetarian,
    this.allergy,
    this.daily,
    this.meal,
    this.daily_Protein,
    this.Breakfast_Protein,
    this.Lunch_Protein,
    this.Dinner_Protein,
    this.daily_Carbohydrate,
    this.Breakfast_Carbohydrate,
    this.Lunch_Carbohydrate,
    this.Dinner_Carbohydrate,
    this.daily_fat,
    this.Breakfast_fat,
    this.Lunch_fat,
    this.Dinner_fat,
    this.daily_SaturatedFat,
    this.Breakfast_SaturatedFat,
    this.Lunch_SaturatedFat,
    this.Dinner_SaturatedFat,
    this.daily_Sugar,
    this.Breakfast_Sugar,
    this.Lunch_Sugar,
    this.Dinner_Sugar,
    this.daily_Fiber,
    this.Breakfast_Fiber,
    this.Lunch_Fiber,
    this.Dinner_Fiber,
    this.daily_Sodium,
    this.Breakfast_Sodium,
    this.Lunch_Sodium,
    this.Dinner_Sodium,
    this.daily_Cholesterol,
    this.Breakfast_Cholesterol,
    this.Lunch_Cholesterol,
    this.Dinner_Cholesterol,
  });

  factory AllInSystemDietModel.fromJson(Map<String, dynamic> data) {
    return AllInSystemDietModel(
      gender: data['gender'],
      age: data['age'],
      goal: data['goal'],
      weight: data['weight'],
      BMR: data['BMR'],
      vegetarian: data['vegetarian'],
      allergy: data['allergy'],
      daily: DailyMealModel.fromJson(data['daily']),

      meal: List<DailyMealModel>.from(
          data['meal'].map((e) => DailyMealModel.fromJson(e))),

      daily_Protein: List<double>.from(
          data['daily Protein']?.map((value) => value.toDouble()) ?? []),
      Breakfast_Protein: List<double>.from(
          data['Breakfast Protein']?.map((value) => value.toDouble()) ?? []),
      Lunch_Protein: List<double>.from(
          data['Lunch Protein']?.map((value) => value.toDouble()) ?? []),
      Dinner_Protein: List<double>.from(
          data['Dinner Protein']?.map((value) => value.toDouble()) ?? []),
      daily_Carbohydrate: List<double>.from(
          data['daily Carbohydrate']?.map((value) => value.toDouble()) ?? []),
      Breakfast_Carbohydrate: List<double>.from(
          data['Breakfast Carbohydrate']?.map((value) => value.toDouble()) ??
              []),
      Lunch_Carbohydrate: List<double>.from(
          data['Lunch Carbohydrate']?.map((value) => value.toDouble()) ?? []),
      Dinner_Carbohydrate: List<double>.from(
          data['Dinner Carbohydrate']?.map((value) => value.toDouble()) ?? []),
      daily_fat: List<double>.from(
          data['daily fat']?.map((value) => value.toDouble()) ?? []),
      Breakfast_fat: List<double>.from(
          data['Breakfast fat']?.map((value) => value.toDouble()) ?? []),
      Lunch_fat: List<double>.from(
          data['Lunch fat']?.map((value) => value.toDouble()) ?? []),
      Dinner_fat: List<double>.from(
          data['Dinner fat']?.map((value) => value.toDouble()) ?? []),
      daily_SaturatedFat: List<double>.from(
          data['daily SaturatedFat']?.map((value) => value.toDouble()) ?? []),
      Breakfast_SaturatedFat: List<double>.from(
          data['Breakfast SaturatedFat']?.map((value) => value.toDouble()) ??
              []),
      Lunch_SaturatedFat: List<double>.from(
          data['Lunch SaturatedFat']?.map((value) => value.toDouble()) ?? []),
      Dinner_SaturatedFat: List<double>.from(
          data['Dinner SaturatedFat']?.map((value) => value.toDouble()) ?? []),
      daily_Sugar: List<double>.from(
          data['daily Sugar']?.map((value) => value.toDouble()) ?? []),
      Breakfast_Sugar: List<double>.from(
          data['Breakfast Sugar']?.map((value) => value.toDouble()) ?? []),
      Lunch_Sugar: List<double>.from(
          data['Lunch Sugar']?.map((value) => value.toDouble()) ?? []),
      Dinner_Sugar: List<double>.from(
          data['Dinner Sugar']?.map((value) => value.toDouble()) ?? []),
      daily_Fiber: List<double>.from(
          data['daily Fiber']?.map((value) => value.toDouble()) ?? []),
      Breakfast_Fiber: List<double>.from(
          data['Breakfast Fiber']?.map((value) => value.toDouble()) ?? []),
      Lunch_Fiber: List<double>.from(
          data['Lunch Fiber']?.map((value) => value.toDouble()) ?? []),
      Dinner_Fiber: List<double>.from(
          data['Dinner Fiber']?.map((value) => value.toDouble()) ?? []),
      daily_Sodium: List<double>.from(
          data['daily Sodium']?.map((value) => value.toDouble()) ?? []),
      Breakfast_Sodium: List<double>.from(
          data['Breakfast Sodium']?.map((value) => value.toDouble()) ?? []),
      Lunch_Sodium: List<double>.from(
          data['Lunch Sodium']?.map((value) => value.toDouble()) ?? []),
      Dinner_Sodium: List<double>.from(
          data['Dinner Sodium']?.map((value) => value.toDouble()) ?? []),
      daily_Cholesterol: List<double>.from(
          data['daily Cholesterol']?.map((value) => value.toDouble()) ?? []),
      Breakfast_Cholesterol: List<double>.from(
          data['Breakfast Cholesterol']?.map((value) => value.toDouble()) ??
              []),
      Lunch_Cholesterol: List<double>.from(
          data['Lunch Cholesterol']?.map((value) => value.toDouble()) ?? []),
      Dinner_Cholesterol: List<double>.from(
          data['Dinner Cholesterol']?.map((value) => value.toDouble()) ?? []),
    );
  }
}

class DailyMealModel {
  String? name;
  double? calories;

  List<double>? Protein;

  List<double>? Carbohydrate;

  List<double>? fat;

  List<double>? SaturatedFat;

  List<double>? Sugar;

  List<double>? Fiber;

  List<double>? Sodium;

  List<double>? Cholesterol;

  DailyMealModel({
    required this.name,
    required this.calories,
    required this.Protein,
    required this.Carbohydrate,
    required this.fat,
    required this.SaturatedFat,
    required this.Sugar,
    required this.Fiber,
    required this.Sodium,
    required this.Cholesterol,
  });

  factory DailyMealModel.fromJson(Map<String, dynamic> data) {
    return DailyMealModel(
      name: data['name'],
      calories: data['calories'],
      Protein: List<double>.from(
          data['Protein']?.map((value) => value.toDouble()) ?? []),
      Carbohydrate: List<double>.from(
          data['Carbohydrate']?.map((value) => value.toDouble()) ?? []),
      fat: List<double>.from(
          data['fat']?.map((value) => value.toDouble()) ?? []),
      SaturatedFat: List<double>.from(
          data['SaturatedFat']?.map((value) => value.toDouble()) ?? []),
      Sugar: List<double>.from(
          data['Sugar']?.map((value) => value.toDouble()) ?? []),
      Fiber: List<double>.from(
          data['Fiber']?.map((value) => value.toDouble()) ?? []),
      Sodium: List<double>.from(
          data['Sodium']?.map((value) => value.toDouble()) ?? []),
      Cholesterol: List<double>.from(
          data['Cholesterol']?.map((value) => value.toDouble()) ?? []),
    );
  }
}
