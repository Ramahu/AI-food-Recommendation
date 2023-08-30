class PollModel {
  String? age;
  String? weight;
  String? gender;
  String? goal;
  double? bmr;

  PollModel.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    age = json['age'];
    goal = json['goal'];
    weight = json['weight'];
    bmr = json['BMR'];

  }
}
