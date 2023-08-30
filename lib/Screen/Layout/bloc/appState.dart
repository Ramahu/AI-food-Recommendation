part of 'appbloc.dart';

abstract class AppState extends Equatable {}

class AppInitialState extends AppState {
  @override
  List<Object?> get props => [];
}

class AppChangeBottomIndexState extends AppState {
  @override
  List<Object?> get props => [];
}
class Loading extends AppState {
  @override
  List<Object?> get props => [];
}

class AppNotChangeBottomIndexState extends AppState {
  @override
  List<Object?> get props => [];
}

class Success extends AppState {
  @override
  List<Object?> get props => [];

  final PollModel? pollModel;

  Success(this.pollModel);
}

class Fail extends AppState {
  @override
  List<Object?> get props => [];
}

class Error extends AppState {
  final String error;

  Error(this.error);

  @override
  List<Object?> get props => [error];
}
