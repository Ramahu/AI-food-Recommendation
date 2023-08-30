class ResultModel {
  int? id;
  String? name;
  String? email;
  String? email_verified_at;
  String? gender;
  String? height;
  String? weight;
  String? activity;
  String? goal;
  String? vegetarian;
  List<String>? food_allergy;

  String? BMR;
  String? daily_calories;
  String? breakfast_calories;
  String? lunch_calories;
  String? dinner_calories;
  List<String>? daily_protein;

  List<String>? breakfast_protein;

  List<String>? lunch_protein;

  List<String>? dinner_protein;

  List<String>? daily_carbohydrate;

  List<String>? breakfast_carbohydrate;

  List<String>? lunch_carbohydrate;

  List<String>? dinner_carbohydrate;

  List<String>? daily_fat;

  List<String>? breakfast_fat;

  List<String>? lunch_fat;

  List<String>? dinner_fat;

  List<String>? daily_saturatedFat;

  List<String>? breakfast_saturatedFat;

  List<String>? lunch_saturatedFat;

  List<String>? dinner_saturatedFat;

  List<String>? daily_sugar;

  List<String>? breakfast_sugar;

  List<String>? lunch_sugar;

  List<String>? dinner_sugar;

  List<String>? daily_fiber;

  List<String>? breakfast_fiber;

  List<String>? lunch_fiber;

  List<String>? dinner_fiber;

  List<String>? daily_sodium;

  List<String>? breakfast_sodium;

  List<String>? lunch_sodium;

  List<String>? dinner_sodium;

  List<String>? daily_cholesterol;

  List<String>? breakfast_cholesterol;

  List<String>? lunch_cholesterol;

  List<String>? dinner_cholesterol;

  ResultModel({
     this.id,
     this.name,
     this.email,
     this.email_verified_at,
     this.gender,
     this.height,
     this.weight,
     this.activity,
     this.goal,
     this.vegetarian,
     this.food_allergy,
     this.BMR,
     this.daily_calories,
     this.breakfast_calories,
     this.lunch_calories,
     this.dinner_calories,
     this.daily_protein,
     this.breakfast_protein,
     this.lunch_protein,
     this.dinner_protein,
     this.daily_carbohydrate,
     this.breakfast_carbohydrate,
     this.lunch_carbohydrate,
     this.dinner_carbohydrate,
     this.daily_fat,
     this.breakfast_fat,
     this.lunch_fat,
     this.dinner_fat,
     this.daily_saturatedFat,
     this.breakfast_saturatedFat,
     this.lunch_saturatedFat,
     this.dinner_saturatedFat,
     this.daily_sugar,
     this.breakfast_sugar,
     this.lunch_sugar,
     this.dinner_sugar,
     this.daily_fiber,
     this.breakfast_fiber,
     this.lunch_fiber,
     this.dinner_fiber,
     this.daily_sodium,
     this.breakfast_sodium,
     this.lunch_sodium,
     this.dinner_sodium,
     this.daily_cholesterol,
     this.breakfast_cholesterol,
     this.lunch_cholesterol,
     this.dinner_cholesterol,
  });

  factory ResultModel.fromJson(Map<String, dynamic> data) {
    return ResultModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      email_verified_at: data['email_verified_at'],
      gender: data['gender'],
      height: data['height'].toString(),
      weight: data['weight'].toString(),
      activity: data['activity'],
      goal: data['goal'],
      vegetarian: data['vegetarian'].toString(),
      food_allergy:
          List<String>.from(data['daily_protein']?.map((value) => value.toString()) ?? []),
      BMR: data['BMR'].toString(),
      daily_calories: data['daily_calories'].toString(),
      breakfast_calories: data['breakfast_calories'].toString(),
      lunch_calories: data['lunch_calories'].toString(),
      dinner_calories: data['dinner_calories'].toString(),
      daily_protein:
          List<String>.from(data['daily_protein']?.map((value) => value.toString()) ?? []),
      breakfast_protein: List<String>.from(
          data['breakfast_protein']?.map((value) => value.toString()) ?? []),
      lunch_protein:
          List<String>.from(data['lunch_protein']?.map((value) => value.toString()) ?? []),
      dinner_protein: List<String>.from(
          data['dinner_protein']?.map((value) => value.toString()) ?? []),
      daily_carbohydrate: List<String>.from(
          data['daily_carbohydrate']?.map((value) => value.toString()) ?? []),
      breakfast_carbohydrate: List<String>.from(
          data['breakfast_carbohydrate']?.map((value) => value.toString()) ?? []),
      lunch_carbohydrate: List<String>.from(
          data['lunch_carbohydrate']?.map((value) => value.toString()) ?? []),
      dinner_carbohydrate: List<String>.from(
          data['dinner_carbohydrate']?.map((value) => value.toString()) ?? []),
      daily_fat:
          List<String>.from(data['daily_fat']?.map((value) => value.toString()) ?? []),
      breakfast_fat:
          List<String>.from(data['breakfast_fat']?.map((value) => value.toString()) ?? []),
      lunch_fat:
          List<String>.from(data['lunch_fat']?.map((value) => value.toString()) ?? []),
      dinner_fat:
          List<String>.from(data['dinner_fat']?.map((value) => value.toString()) ?? []),
      daily_saturatedFat: List<String>.from(
          data['daily_saturatedFat']?.map((value) => value.toString()) ?? []),
      breakfast_saturatedFat: List<String>.from(
          data['breakfast_saturatedFat']?.map((value) => value.toString()) ?? []),
      lunch_saturatedFat: List<String>.from(
          data['lunch_saturatedFat']?.map((value) => value.toString()) ?? []),
      dinner_saturatedFat: List<String>.from(
          data['dinner_saturatedFat']?.map((value) => value.toString()) ?? []),
      daily_sugar:
          List<String>.from(data['daily_sugar']?.map((value) => value.toString()) ?? []),
      breakfast_sugar: List<String>.from(
          data['breakfast_sugar']?.map((value) => value.toString()) ?? []),
      lunch_sugar:
          List<String>.from(data['lunch_sugar']?.map((value) => value.toString()) ?? []),
      dinner_sugar:
          List<String>.from(data['dinner_sugar']?.map((value) => value.toString()) ?? []),
      daily_fiber:
          List<String>.from(data['daily_fiber']?.map((value) => value.toString()) ?? []),
      breakfast_fiber: List<String>.from(
          data['breakfast_fiber']?.map((value) => value.toString()) ?? []),
      lunch_fiber:
          List<String>.from(data['lunch_fiber']?.map((value) => value.toString()) ?? []),
      dinner_fiber:
          List<String>.from(data['dinner_fiber']?.map((value) => value.toString()) ?? []),
      daily_sodium:
          List<String>.from(data['daily_sodium']?.map((value) => value.toString()) ?? []),
      breakfast_sodium: List<String>.from(
          data['breakfast_sodium']?.map((value) => value.toString()) ?? []),
      lunch_sodium:
          List<String>.from(data['lunch_sodium']?.map((value) => value.toString()) ?? []),
      dinner_sodium:
          List<String>.from(data['dinner_sodium']?.map((value) => value.toString()) ?? []),
      daily_cholesterol: List<String>.from(
          data['daily_cholesterol']?.map((value) => value.toString()) ?? []),
      breakfast_cholesterol: List<String>.from(
          data['breakfast_cholesterol']?.map((value) => value.toString()) ?? []),
      lunch_cholesterol: List<String>.from(
          data['lunch_cholesterol']?.map((value) => value.toString()) ?? []),
      dinner_cholesterol: List<String>.from(
          data['dinner_cholesterol']?.map((value) => value.toString()) ?? []),
    );
  }
}
