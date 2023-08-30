import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/Screen/Food/food.dart';
import '../../model/foodModel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/repository.dart';
import 'bloc/search_bloc.dart';

class Search extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var controller = TextEditingController();
  var controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return SearchBloc(
            repository: Repository(),
          );
        },
        child: BlocConsumer<SearchBloc, searchStates>(
            listener: (context, state) {
          if (state is Success) {}

          if (state is Error) {}
        }, builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    backCircle(context),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // defaultTextForm(
                    //   controller: controller2,
                    //   type: TextInputType.text,
                    //   autoValidateMode: AutovalidateMode.onUserInteraction,
                    //   label: 'non ingredients',
                    //   hint:" Non ingredients",
                    //   labelStyle: const TextStyle(
                    //     color: grey,
                    //   ),
                    //   prefix: const Icon(
                    //     Icons.search,
                    //     color: grey,
                    //   ),
                    //   border: const OutlineInputBorder(
                    //     borderRadius:
                    //     BorderRadius.all(Radius.circular(25)),
                    //     borderSide: BorderSide(
                    //       color: defaultPurple,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 15.0,
                    // ),

                    defaultTextForm(
                        controller: controller,
                        type: TextInputType.text,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        label: 'ingredients',
                        hint: "Ingredients",
                        labelStyle: const TextStyle(
                          color: grey,
                        ),
                        prefix: const Icon(
                          Icons.search,
                          color: grey,
                        ),
                        onSubmit: (String text) async {
                          List<String> stringList = controller.text.split(',');
                          List<String> stringList2 = controller2.text.split(',');
                          BlocProvider.of<SearchBloc>(context).add(
                            SearchRequested(
                                stringList
                                //,stringList2
                            ),
                          );
                        },
                        border: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(
                            color: defaultPurple,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    if (state is Loading)
                      const Center(
                          child: CircularProgressIndicator(
                        color: defaultPurple,
                      )),
                    if (BlocProvider.of<SearchBloc>(context).searchList != null)
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => buildFoodItem(
                            context,
                            BlocProvider.of<SearchBloc>(context).searchList![index],
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 12.0,
                          ),
                          itemCount: BlocProvider.of<SearchBloc>(context).searchList!.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget buildFoodItem(BuildContext context, FoodModel? food) => InkWell(
        onTap: () {
          navigateTo(
            context,
            Food(food: food),
          );
        },
        highlightColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 5,
                color: Colors.grey,
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              if(food!.image!.isNotEmpty)
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(60.0),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: NetworkImage('${food.image?[0]}'),
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 15.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${food.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3.0,),
                    Text('${food.recipeIngredientParts}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
