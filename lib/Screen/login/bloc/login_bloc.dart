import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/usermodel.dart';
import '../../../shared/network/repository.dart';

part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final Repository repository;
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  var tabIndex = 0;

  // void changeTabIndex(int index){
  //   tabIndex.value = index ;
  // }

  LoginBloc({required this.repository}) : super(UnAuthenticated()) {
    // When User Presses the SignIn Button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<LoginRequested>((event, emit) async {
      emit(Loading());
      print('Loading');
      try {
        print('repo');
        await repository
            .login(email: event.email, password: event.password)
            .then((value) {
          emit(Authenticated(repository.loginModel));
          // Navigator.push(context, MaterialPageRoute(builder: builder));
        });
        print('try');
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
        print('catch');
      }
    });

    on<PasswordVisibility>((event, emit) {
      emit(PasswordInvisibility());
      try {
        isPassword = !isPassword;
        suffix = isPassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined;
        emit(Passwordvisibility());
      } catch (e) {}
    });

    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    // on<SignOutRequested>((event, emit) async {
    // emit(Loading());
    // await authRepository.signOut();
    // emit(UnAuthenticated());
    // });
  }
}
