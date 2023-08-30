import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import '/Screen/search/search.dart';
import '/model/resultModel.dart';
import '../model/mealmodel.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import 'Layout/bloc/appbloc.dart';

class Home extends StatelessWidget {
  String? goal;
  String? weight;
  double? calorie;
  List<double>? fat;
  List<double>? saturatedFat;
  List<double>? fiber;
  List<double>? carb;
  List<double>? protein;
  List<double>? sugar;
  List<double>? sodium;
  List<double>? cholesterol;

  @override
  Widget build(BuildContext context) {
    ResultModel resultModel = BlocProvider.of<AppBloc>(context).resultModel!;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          iconTheme: const IconThemeData(color: grey),
          actions: [
            IconButton(
              onPressed: () {
                navigateTo(
                  context,
                  Search(),
                );
              },
              icon: const Icon(Icons.search, color: defaultPurple),
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
        body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 40.0, right: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          depth: 9,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 8,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Your goal",
                                      style: TextStyle(
                                        color: grey,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      // goal
                                      BlocProvider.of<AppBloc>(context)
                                          .resultModel!
                                          .goal
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Latest weight",
                                      style: TextStyle(
                                        color: grey,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "${resultModel.weight} Kg",
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
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
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          depth: 9,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.0,
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "TODAY",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ShaderMask(
                                    shaderCallback: (rect) =>
                                        const LinearGradient(
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
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2.0,
                                  ),
                                  Text(
                                    "${resultModel.daily_calories} Kcal",
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14.0,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          "${resultModel.daily_fat}",
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
                                          "${resultModel.daily_saturatedFat}",
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
                                          "${resultModel.daily_carbohydrate}",
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
                                          "${resultModel.daily_fiber}",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          "${resultModel.daily_protein}",
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
                                          "${resultModel.daily_sodium}",
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
                                          "${resultModel.daily_sugar}",
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
                                          "${resultModel.daily_cholesterol}",
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
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      const Text(
                        "Meals today",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 170,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List<MealModel> d = [
                              MealModel(
                                  name: "Breakfast",
                                  calorie: double.parse(resultModel
                                      .breakfast_calories
                                      .toString())),
                              MealModel(
                                  name: "Dinner",
                                  calorie: double.parse(
                                      resultModel.dinner_calories.toString())),
                              MealModel(
                                  name: "Lunch",
                                  calorie: double.parse(
                                      resultModel.lunch_calories.toString())),
                            ];
                            return buildMeal(context, d[index]);
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10.0,
                          ),
                          itemCount: 3,
                        ),
                      ),
                    ],
                  ),
                )));
  }
}

buildMeal(
  BuildContext context,
  MealModel meal,
) => Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(
            const BorderRadius.only(topRight: Radius.circular(90.0))),
        depth: 9,
        lightSource: LightSource.topLeft,
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [defaultNavyBlue, defaultPurple],
          ),
        ),
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 1.5,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
          height: 20.0,
        ),
        Text(
          "${meal.name}",
          style: const TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "${meal.calorie} Kcal",
          style: const TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
      ],
    ),
  ),
);
