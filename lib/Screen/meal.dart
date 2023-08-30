import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import '../model/foodModel.dart';
import '../model/mealmodel.dart';
import '../model/resultModel.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import 'Food/food.dart';
import 'Layout/bloc/appbloc.dart';

class Meal extends StatelessWidget {

  Meal({super.key});
  @override
  Widget build(BuildContext context) {
    ResultModel? resultModel = BlocProvider.of<AppBloc>(context).resultModel;
    List<MealModel> meals = [
      MealModel(
        name: "Breakfast",
        calorie: double.parse(resultModel!.breakfast_calories.toString()),
        fat: resultModel.breakfast_fat,
        carb: resultModel.breakfast_carbohydrate,
        fiber: resultModel.breakfast_fiber,
        cholesterol: resultModel.breakfast_cholesterol,
        food: BlocProvider.of<AppBloc>(context).predictModelBreak,
        protein: resultModel.breakfast_protein,
        saturatedFat: resultModel.breakfast_saturatedFat,
        sodium: resultModel.breakfast_sodium,
        sugar: resultModel.breakfast_sugar,
      ),
      MealModel(
        name: "Lunch",
        calorie: double.parse(resultModel.lunch_calories.toString()),
        fat: resultModel.lunch_fat,
        carb: resultModel.lunch_carbohydrate,
        fiber: resultModel.lunch_fiber,
        cholesterol: resultModel.lunch_cholesterol,
        food: BlocProvider.of<AppBloc>(context).predictModelLunch,
        protein: resultModel.lunch_protein,
        saturatedFat: resultModel.lunch_saturatedFat,
        sodium: resultModel.lunch_sodium,
        sugar: resultModel.lunch_sugar,
      ),
      MealModel(
        name: "Dinner",
        calorie: double.parse(resultModel.dinner_calories.toString()),
        fat: resultModel.dinner_fat,
        carb: resultModel.dinner_carbohydrate,
        fiber: resultModel.dinner_fiber,
        cholesterol: resultModel.dinner_cholesterol,
        food: BlocProvider.of<AppBloc>(context).predictModelDinner,
        protein: resultModel.dinner_protein,
        saturatedFat: resultModel.dinner_saturatedFat,
        sodium: resultModel.dinner_sodium,
        sugar: resultModel.dinner_sugar,
      ),
    ];
    return Scaffold(
      appBar: AppBar(backgroundColor: white),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 20.0, left: 40.0, right: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      buildMeal(context, meals[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20.0,
                  ),
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

buildMeal(BuildContext context, MealModel meal) => Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        depth: 9,
        lightSource: LightSource.topLeft,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 0.9,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            ShaderMask(
              shaderCallback: (rect) => const LinearGradient(
                colors: [defaultNavyBlue, defaultPurple],
              ).createShader(rect),
              child: Text(
                '${meal.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.signikaNegative(
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [defaultNavyBlue, defaultPurple],
                  ).createShader(rect),
                  child: const Icon(
                    Icons.local_fire_department,
                    color: grey,
                    size: 20.0,
                  ),
                ),
                const SizedBox(
                  width: 2.0,
                ),
                const Text(
                  "Calories",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  width: 2.0,
                ),
                Text(
                  "${meal.calorie} Kcal",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //fat
                      Row(
                        children: [
                          circle(color: defaultPurple),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "Fat",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${meal.fat}",
                        style: const TextStyle(
                          color: grey,
                          fontSize: 12.0,
                        ),
                      ),
                      //satfat
                      Row(
                        children: [
                          circle(color: tealAccent),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "SaturatedFat",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${meal.saturatedFat}",
                        style: const TextStyle(
                          color: grey,
                          fontSize: 12.0,
                        ),
                      ),
                      //carb
                      Row(
                        children: [
                          circle(color: defaultNavyBlue),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "Carb",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${meal.carb}",
                        style: const TextStyle(
                          color: grey,
                          fontSize: 12.0,
                        ),
                      ),
                      //fiber
                      Row(
                        children: [
                          circle(color: blue),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "Fiber",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${meal.fiber}",
                        style: const TextStyle(
                          color: grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //const SizedBox(height: 5.0,),
                      //Protein
                      Row(
                        children: [
                          circle(color: red),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "Protein",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${meal.protein?.map((e) => double.parse(e).toStringAsFixed(3))}",
                        style: const TextStyle(
                          color: grey,
                          fontSize: 12.0,
                        ),
                      ),
                      //Sodium
                      Row(
                        children: [
                          circle(color: yellow),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "Sodium",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${meal.sodium}",
                        style: const TextStyle(
                          color: grey,
                          fontSize: 12.0,
                        ),
                      ),
                      //Sugar
                      Row(
                        children: [
                          circle(color: orange),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "Sugar",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${meal.sugar}",
                        style: const TextStyle(
                          color: grey,
                          fontSize: 12.0,
                        ),
                      ),
                      //Cholesterol
                      Row(
                        children: [
                          circle(color: pink),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "Cholesterol",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${meal.cholesterol}",
                        style: const TextStyle(
                          color: grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Food",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildFood(context, meal.food![index]),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5.0,
                ),
                itemCount: meal.food!.length,
              ),
            ),
          ],
        ),
      ),
    );

buildFood(BuildContext context, FoodModel food) {
  return InkWell(
    onTap: () {
      navigateTo(
        context,
        Food(food: food),
      );
    },
    highlightColor: Colors.grey,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(170.0),
              image: food.image?.isNotEmpty == true
                  ? DecorationImage(
                image: NetworkImage(
                  '${food.image?[0]}',
                ),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              )
                  : const DecorationImage(
                image: AssetImage('assets/images/FoodIQ.png'),
                alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                // fit: BoxFit.fitWidth,
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
          const SizedBox(
            width: 3.0,
          ),
          SizedBox(
            width: 170,
            child: Text(
              "${food.name}",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black54,
                //fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
          //const SizedBox(width: 2.0,),
        ],
      ),
    ),
    );
}
