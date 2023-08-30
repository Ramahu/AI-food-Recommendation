import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../model/foodModel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/repository.dart';
import 'bloc/food_bloc.dart';
import 'food.dart';

class Fav extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

 var bloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: white,
      ),
      body: BlocProvider(
        create: (BuildContext context) {
          return FoodBloc(
            repository: Repository(),
          )..add(AllFavRequested());
        },
        child: BlocConsumer<FoodBloc, FoodStates>(listener: (context, state) {
          if (state is SuccessAllFav) {
            if (BlocProvider.of<FoodBloc>(context).ids.isNotEmpty) {
              BlocProvider.of<FoodBloc>(context).add(
                SearchIDRequested(BlocProvider.of<FoodBloc>(context).ids),
              );
            }
          }
          if (state is SuccessDel) {
            back(context);
          }
          if (state is SuccessID) {}

          if (state is Error) {}
        }, builder: (context, state) {
          bloc= BlocProvider.of<FoodBloc>(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const SizedBox(height: 10.0,),
                  if (state is Loading)
                    const Center(
                        child: CircularProgressIndicator(
                      color: defaultPurple,
                    )),
                  if (BlocProvider.of<FoodBloc>(context).searchList != null)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildFoodItem(
                        context,
                        BlocProvider.of<FoodBloc>(context).searchList![index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 12.0,
                      ),
                      itemCount:
                          BlocProvider.of<FoodBloc>(context).searchList!.length,
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget buildFoodItem(BuildContext context, FoodModel? food) =>   Slidable(
  endActionPane: ActionPane(
  extentRatio: 0.25,
  motion: const StretchMotion (),
  children: [
  SlidableAction(
  onPressed:(context){
  defaultAlert(context:_scaffoldKey.currentContext!,
  function:() async{
    bloc.add(
      DelRequested(food!.id.toString()),
    );


  }
  );
  },
  backgroundColor: Colors.redAccent,
  foregroundColor: white,
  icon: Icons.delete,
  label: 'Delete',
  ),
  ],
  ),
  child:InkWell(
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
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${food.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text('${food.description}',
                        maxLines: 2,
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
  ),
      );

}
