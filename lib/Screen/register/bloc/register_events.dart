part of 'register_bloc.dart';

abstract class RegisterEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterRequested extends RegisterEvents {
  final String email;
  final String password;
  final String gender;
  final String name;

  RegisterRequested(this.email, this.password, this.name, this.gender);
}

// class GenderEvent extends RegisterEvents {
//   @override
//   List<Object> get props => [];
//   // final bool isFemale;
//   //  GenderEvent(this.isFemale);
// }
