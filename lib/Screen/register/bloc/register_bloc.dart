import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/usermodel.dart';
import '../../../shared/network/repository.dart';

part 'register_events.dart';
part 'register_states.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  final Repository repository;

  //bool isFemale= false;
  var selectedOption = '';

  RegisterBloc({required this.repository}) : super(UnAuthenticated()) {
    on<RegisterRequested>((event, emit) async {
      emit(Loading());
      try {
        await repository
            .register(
                email: event.email,
                password: event.password,
                name: event.name,
                gender: event.gender)
            .then((value) {
          emit(Authenticated(repository.registerModel));
        });
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    // on<GenderEvent>((event, emit) {
    //   emit(GenderNotFemaleState());
    //   try {
    //     isFemale = !isFemale;
    //     emit(GenderFemaleState());
    //   }catch (e) {}
    // });
  }
}
