class FoodsModel {
  List<FoodModel> foods;

  FoodsModel({
    required this.foods,
  });

  factory FoodsModel.fromJson(List<dynamic> json) =>
      FoodsModel(
        foods: List<FoodModel>.from(json.map((x) => FoodModel.fromJson(x))),
      );
}

class FoodModel {
  int? id;
  String? name;
  List<String>? image;
  double? calorie;
  double? fat;
  double? saturatedFat;
  double? fiber;
  double? carb;
  double? protein;
  double? sugar;
  double? sodium;
  double? cholesterol;
  String? description;
  List<String>? recipeInstructions;
  List<String>? recipeIngredientParts;
  String? totalTime;
  String? prepTime;
  String? cookTime;

  FoodModel(
      {  this.id,
        required this.name,
         this.image,
         this.calorie,
         this.fat,
         this.saturatedFat,
         this.fiber,
         this.carb,
         this.protein,
         this.sugar,
         this.sodium,
         this.cholesterol,
         this.description,
         this.recipeInstructions,
         this.recipeIngredientParts,
         this.totalTime,
         this.prepTime,
         this.cookTime});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
    id : json['RecipeId'],
    name : json['Name'],
    image : List<String>.from(json['Images']?.map((value) => value.toString()) ?? []),
    calorie : json['Calories'],
    fat : json['FatContent'],
    saturatedFat : json['SaturatedFatContent'],
    fiber : json['FiberContent'],
    carb : json['CarbohydrateContent'],
    sugar : json['SugarContent'],
    sodium : json['SodiumContent'],
    cholesterol : json['CholesterolContent'],
    protein : json['ProteinContent'],
    description : json['Description'],
    recipeInstructions : List<String>.from(json['RecipeInstructions']?.map((value) => value.toString()) ?? []),
    recipeIngredientParts : List<String>.from(json['RecipeIngredientParts']?.map((value) => value.toString()) ?? []),
    totalTime : json['TotalTime'],
    prepTime : json['PrepTime'],
    cookTime : json['CookTime'],
    );
  }
}
