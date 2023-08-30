import '/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/flutter_onboarding.dart';
import 'package:flutter_onboarding/onboarding_model.dart';
import 'login/login.dart';

class Onboarding extends StatelessWidget {

  final pages = [
  IntroModel(
  title: 'Health life style',
  description:
  'We can help you find the best healthy lifestyle',
  titleColor: grey,
  descriptionColor: grey,
  imagePath: 'assets/images/4.jpg',
  ),
  IntroModel(
      title: 'Recommend Diet Plan',
      description:
      ' We recommended a healthy diet plan for you and healthy recipes that you need based on your goal and nutrition values.',
      titleColor: grey,
      descriptionColor: grey,
      imagePath: 'assets/images/7.jpg',
    ),
  IntroModel(
    title: 'Get daily calorie targets and other nutrition value ',
    description:
    'set your goal and weight, height, age, gender, allergy, diseases, activity level ,vegetarian and we will do the rest.',
    titleColor: grey,
    descriptionColor: grey,
    imagePath: 'assets/images/3.jpg',
  ),
    IntroModel(
      title: 'Get the exact nutrition values of everything ',
      description:
      'We are updating our food dataset to help you track your calories',
      titleColor: grey,
      descriptionColor: grey,
      imagePath: 'assets/images/2.jpg',
    ),
    IntroModel(
      title: 'Search for food',
      description:
      'You can search for food based on its ingredients.',
      titleColor: grey,
      descriptionColor: grey,
      imagePath: 'assets/images/6.jpg',
    ),
    IntroModel(
      title: 'Notifications',
      description:
      'We will send notifications to remind you of mealimes.',
      titleColor: grey,
      descriptionColor: grey,
      imagePath: 'assets/images/1.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterOnBoarding(
        imageHeight: 200,
          backgroundColor: white,
          nextButtonColor: defaultPurple,
          activeIndicatorColor: defaultPurple,
          inactiveIndicatorColor: defaultNavyBlue,

          getStartedButtonDecoration : const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  defaultNavyBlue,
                  defaultPurple,
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          pages: pages,
          onGetStartedRoute: MaterialPageRoute(
            builder: (context) =>  LoginScreeen(),
          ),
        ),
    );
  }
}