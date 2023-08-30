import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '/model/foodModel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/repository.dart';
import 'bloc/food_bloc.dart';

class Food extends StatelessWidget {
  final FoodModel? food;

  const Food({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return FoodBloc(
            repository: Repository(),
          );
        },
        child: BlocConsumer<FoodBloc, FoodStates>(listener: (context, state) {
          if (state is SuccessFav) {}

          if (state is Error) {}
        }, builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: food?.image?.isNotEmpty == true
                    ? DecorationImage(
                        image: NetworkImage(
                          '${food?.image?[0]}',
                        ),
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth,
                      )
                    :
                // const DecorationImage(
                //         image: NetworkImage(
                //           'https://blog-images-1.pharmeasy.in/blog/production/wp-content/uploads/2021/01/25180542/shutterstock_1545283778-1-768x512.jpg',
                //         ),
                //         alignment: Alignment.topCenter,
                //         fit: BoxFit.fitWidth,
                //       ),

                const DecorationImage(
                  image: AssetImage('assets/images/logo2.png'),
                  alignment: Alignment.topCenter,
                  scale: 2.5,
                  // fit: BoxFit.fitWidth,
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [defaultNavyBlue, defaultPurple],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backCircle(context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(100, 90)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Center(
                              child: ShaderMask(
                                shaderCallback: (rect) => const LinearGradient(
                                  colors: [defaultNavyBlue, defaultPurple],
                                ).createShader(rect),
                                child: Text(
                                  '${food?.name}',
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.signikaNegative(
                                      textStyle: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: grey,
                                  )),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Description',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black54,
                                    )),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(' ${food?.description} ',
                                    maxLines: null,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: grey,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Recipe Instructions',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black54,
                                    )),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(' ${food?.recipeInstructions} ',
                                    maxLines: null,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: grey,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Recipe Ingredient Parts',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black54,
                                    )),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(' ${food?.recipeIngredientParts} ',
                                    maxLines: null,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: grey,
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 2.0,
                              ),
                              ShaderMask(
                                shaderCallback: (rect) => const LinearGradient(
                                  colors: [defaultNavyBlue, defaultPurple],
                                ).createShader(rect),
                                child: const Icon(
                                  Icons.access_time_outlined,
                                  color: grey,
                                  size: 20.0,
                                ),
                              ),
                              const SizedBox(
                                width: 2.0,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Total Time",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "${food?.totalTime} ",
                                    style: const TextStyle(
                                      color: grey,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 7.0,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Prep Time",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "${food?.prepTime} ",
                                    style: const TextStyle(
                                      color: grey,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 7.0,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Cook Time",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "${food?.cookTime} ",
                                    style: const TextStyle(
                                      color: grey,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          const Text(
                            'Nutrition detail',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
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
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                "${food?.calorie} Kcal",
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
                                      "${food?.fat}",
                                      style: const TextStyle(
                                        color: grey,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    //satfat
                                    Row(
                                      children: [
                                        circle(color: teal),
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
                                      "${food?.saturatedFat}",
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
                                      "${food?.carb}",
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
                                      "${food?.fiber}",
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
                                      "${food?.protein}",
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
                                      "${food?.sodium}",
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
                                      "${food?.sugar}",
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
                                      "${food?.cholesterol}",
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
                          const SizedBox(
                            height: 30.0,
                          ),
                          Center(
                            child: defaultGradientBottom(
                                text: 'Add To Fav',
                                width: 250,
                                height: 40.0,
                                color1: defaultNavyBlue,
                                color2: defaultPurple,
                                function: () async {
                                  BlocProvider.of<FoodBloc>(context).add(
                                    FavRequested(food!.id.toString()),
                                  );
                                  BlocProvider.of<FoodBloc>(context).add(
                                    AllFavRequested(),
                                  );
                                  BlocProvider.of<FoodBloc>(context).ids.add(food!.id);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
