part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable {
  @override
  List<Object> get props => [];
}

// When the user signing in with email and password this event is called and the [AuthRepository] is called to sign in the user
class LoginRequested extends LoginEvents {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

// When the user signing out this event is called and the [AuthRepository] is called to sign out the user
class SignOutRequested extends LoginEvents {}

class PasswordVisibility extends LoginEvents {}
