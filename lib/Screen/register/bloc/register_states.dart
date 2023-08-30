part of 'register_bloc.dart';

abstract class RegisterStates extends Equatable {}

// When the user presses the signin or signup button the state is changed to loading first and then to Authenticated.
class Loading extends RegisterStates {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class Authenticated extends RegisterStates {
  @override
  List<Object?> get props => [];

  final RegisterModel? registerModel;

  Authenticated(this.registerModel);
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends RegisterStates {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends RegisterStates {
  final String error;

  AuthError(this.error);

  @override
  List<Object?> get props => [error];
}

// class GenderFemaleState extends RegisterStates {
//   @override
//   List<Object> get props => [];
//
//   // final bool isFemale;
//   // GenderState(this.isFemale);
// }
// class GenderNotFemaleState extends RegisterStates {
//   @override
//   List<Object> get props => [];
//}
