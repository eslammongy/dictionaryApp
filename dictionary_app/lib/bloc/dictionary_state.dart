import 'package:dictionary_app/model/word_response.dart';

abstract class DictionaryState {}

class NoWordToSearchSate extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final List<WordResponse> listWords;

  WordSearchedState({this.listWords});
}

class ErrorSearchState extends DictionaryState {
  final String errorMessage;
  ErrorSearchState({this.errorMessage});
}

class StateOfChangeAppTheme extends DictionaryState {}
