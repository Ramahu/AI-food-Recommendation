part of 'search_bloc.dart';

abstract class SearchEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchRequested extends SearchEvents {
  final List<String> text;
  //final List<String> text2;

  SearchRequested(this.text
      //,this.text2
  );
}
