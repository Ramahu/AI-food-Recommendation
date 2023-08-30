part of 'login_bloc.dart';

abstract class LoginStates extends Equatable {}

// When the user presses the signin or signup button the state is changed to loading first and then to Authenticated.
class Loading extends LoginStates {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class Authenticated extends LoginStates {
  @override
  List<Object?> get props => [];

  final LoginModel? loginModel;

  Authenticated(this.loginModel);
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends LoginStates {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends LoginStates {
  final String error;

  AuthError(this.error);

  @override
  List<Object?> get props => [error];
}

class Passwordvisibility extends LoginStates {
  @override
  List<Object?> get props => [];
}

class PasswordInvisibility extends LoginStates {
  @override
  List<Object?> get props => [];
}
