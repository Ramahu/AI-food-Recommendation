part of 'appbloc.dart';

abstract class AppEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class AppChangeBottomIndex extends AppEvents {
  final int index;

  AppChangeBottomIndex(this.index);
}
class InitFunc extends AppEvents{

}
class PollRequested extends AppEvents {
  final String age;
  final String weight;
  final String height;
  final String activity;
  final String gender;
  final String goal;
  final String vegetarian;
  final List<String> allergy;
  final List<String> disease;

  PollRequested(this.age, this.weight, this.height, this.activity, this.gender,
      this.goal, this.vegetarian, this.allergy,this.disease);
}

