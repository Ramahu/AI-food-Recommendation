import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Screen/Layout/bloc/appbloc.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import 'Layout/layout.dart';


class PollScreeen extends StatelessWidget {
  final Bloc bloc;
  PollScreeen(this.bloc);
  var counterBloc;
  var formKey = GlobalKey<FormState>();
  var key = GlobalKey<FormState>();
  var ageController = TextEditingController();
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  var allergyController = TextEditingController();
  List<String> gender = ['male', 'female'];
  List<String> activity = [
    'Sedentary',
    'Lightly active',
    'Moderately active',
    'Very active',
    'Super active'
  ];
  List<String> goal = [
    'Maintenance',
    'Weight Loss',
    'Weight Gain',
    'Muscle Gain'
  ];
  List<String> veg = ['yes', 'no'];
  List<String> disease = ["Diabetes","Liver Disease","Heart Disease"];

  @override
  Widget build(BuildContext context) {

     counterBloc = BlocProvider.of<AppBloc>(context);
    return Scaffold(
      body:
      // BlocProvider(
      //   create: (BuildContext context) {
      //     return PollBloc(
      //       repository: Repository(),
      //     );
      //   },
      //   child:
      BlocConsumer<AppBloc, AppState>(listener: (context, state) {
        // if (state is ) {
        //   // navigateAndFinish(context, Layout());
        // }
        //
        // if (state is Error) {}
      }, builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backCircle(context),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ShaderMask(
                    shaderCallback: (rect) => const LinearGradient(
                      colors: [defaultNavyBlue, defaultPurple],
                    ).createShader(rect),
                    child: Center(
                      child: Text(
                        'Add your info',
                        style: GoogleFonts.signikaNegative(
                          textStyle: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  defaultTextForm(
                    controller: ageController,
                    type: TextInputType.number,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    label: 'Age',
                    labelStyle: const TextStyle(
                      color: grey,
                    ),
                    prefix: const Icon(
                      Icons.person_outline,
                      color: defaultPurple,
                    ),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    enableBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultTextForm(
                    controller: weightController,
                    type: TextInputType.number,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    label: 'Weight',
                    labelStyle: const TextStyle(
                      color: grey,
                    ),
                    prefix: const Icon(
                      Icons.line_weight,
                      color: defaultPurple,
                    ),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your weight';
                      }
                      return null;
                    },
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    enableBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultTextForm(
                    controller: heightController,
                    type: TextInputType.number,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    label: 'Height',
                    labelStyle: const TextStyle(
                      color: grey,
                    ),
                    prefix: const Icon(
                      Icons.height_outlined,
                      color: defaultPurple,
                    ),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your height';
                      }
                      return null;
                    },
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    enableBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultDropdown(
                    items: gender.map(buildGenderItem).toList(),
                    onChange: (value) {
                      BlocProvider.of<AppBloc>(context).selectedGender =
                          value.toString();
                      print(BlocProvider.of<AppBloc>(context).selectedGender);
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please choose an item';
                      }
                      return null;
                    },
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    hint: const Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    enableBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    prefix: const Icon(
                      Icons.person_2_outlined,
                      color: defaultPurple,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultDropdown(
                    items: activity.map(buildActItem).toList(),
                    onChange: (value) {
                      BlocProvider.of<AppBloc>(context).selectedAct =
                          value.toString();
                      print(BlocProvider.of<AppBloc>(context).selectedAct);
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please choose an item';
                      }
                      return null;
                    },
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    hint: const Text(
                      'Activity',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    enableBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    prefix: const Icon(
                      Icons.sports_handball_outlined,
                      color: defaultPurple,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultDropdown(
                    items: goal.map(buildGoalItem).toList(),
                    onChange: (value) {
                      BlocProvider.of<AppBloc>(context).selectedGoal =
                          value.toString();
                      print(BlocProvider.of<AppBloc>(context).selectedGoal);
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please choose an item';
                      }
                      return null;
                    },
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    hint: const Text(
                      'Goal',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    enableBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    prefix: const Icon(
                      Icons.sports_handball_outlined,
                      color: defaultPurple,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultDropdown(
                    items: veg.map(buildGenderItem).toList(),
                    onChange: (value) {
                      BlocProvider.of<AppBloc>(context).selectedVeg =
                          value.toString();
                      print(BlocProvider.of<AppBloc>(context).selectedVeg);
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please choose an item';
                      }
                      return null;
                    },
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    hint: const Text(
                      'Vegetarian',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    enableBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    prefix: const Icon(
                      Icons.no_food_outlined,
                      color: defaultPurple,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultTextForm(
                    controller: allergyController,
                    type: TextInputType.text,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    label: 'Allergy',
                    labelStyle: const TextStyle(
                      color: grey,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    enableBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),

                  defaultDropdown(
                    items: disease.map(buildDiseasesItem).toList(),
                    onChange: (value) {
                      print(counterBloc.selectedDiseases);
                    },
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    hint: const Text(
                      'Disease',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    enableBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: defaultPurple,
                      ),
                    ),
                    prefix: const Icon(
                      Icons.no_food_outlined,
                      color: defaultPurple,
                    ),
                  ),

                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: defaultGradientBottom(
                        text: 'ADD',
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50.0,
                        color1: defaultNavyBlue,
                        color2: defaultPurple,
                        function: () async {
                          if (formKey.currentState!.validate()) {
                            List<String> allergy = allergyController.text.split(',');
                            BlocProvider.of<AppBloc>(context).add(
                              PollRequested(
                                ageController.text,
                                weightController.text,
                                heightController.text,
                                BlocProvider.of<AppBloc>(context).selectedAct,
                                BlocProvider.of<AppBloc>(context)
                                    .selectedGender,
                                BlocProvider.of<AppBloc>(context).selectedGoal,
                                BlocProvider.of<AppBloc>(context).selectedVeg,
                                allergy,
                                BlocProvider.of<AppBloc>(context).selectedDiseases,
                              ),
                            );
                           if (state is Success) {
                          navigateAndFinish(context, Layout());
                          }
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        );
        // }),
      }),
    );
  }

  DropdownMenuItem<String> buildGenderItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(
        fontSize: 15.0,
      ),
    ),
  );

  DropdownMenuItem<String> buildActItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(
        fontSize: 15.0,
      ),
    ),
  );

  DropdownMenuItem<String> buildGoalItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(
        fontSize: 15.0,
      ),
    ),
  );
  DropdownMenuItem<String> buildDiseasesItem(String item) => DropdownMenuItem(
    value: item,
    child:
    Row(
      children: [
        Checkbox(
          activeColor:defaultPurple,
          value: counterBloc.selectedDiseases.contains(item),
          onChanged: (value) {
            counterBloc.selectedDiseases.contains(item)
                ? counterBloc.selectedDiseases.remove(item)
                : counterBloc.selectedDiseases.add(item);
            print(counterBloc.selectedDiseases);
          },
        ),
        const SizedBox(width: 5.0,),
        Text(
          item,
          style: const TextStyle(
            fontSize: 15.0,
          ),
        ),
      ],
    ),
  );


}

