import 'package:bloc/bloc.dart';
import 'package:dictionary_app/bloc/dictionary_state.dart';
import 'package:dictionary_app/repository/words_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryBloc extends Cubit<DictionaryState> {
  final WordRepository wordRepository;
  DictionaryBloc({this.wordRepository}) : super(NoWordToSearchSate());

  final queryTextControll = TextEditingController();

  Future getWordResultSearched() async {
    emit(WordSearchingState());

    try {
      final resultWords =
          await wordRepository.getWordsFromDictionary(queryTextControll.text);
      if (resultWords == null) {
        emit(ErrorSearchState(
            errorMessage:
                "There was an error when searching for a ${queryTextControll.text}!!"));
      } else {
        print(resultWords.toString());
        emit(WordSearchedState(listWords: resultWords));
        emit(NoWordToSearchSate());
      }
    } on Exception catch (e) {
      print(e);
      emit(ErrorSearchState(errorMessage: e.toString()));
    }
  }

  // bool currentAppTheme = false;
  // void chengeAppTheme({bool currentTheme}) {
  //   if (c != null) {
  //     currentAppTheme = currentTheme;
  //   } else {
  //     currentAppTheme = !currentAppTheme;
  //     CachHelper.setAppTheme(key: "DarkTheme", value: currentAppTheme)
  //         .then((value) => emit(StateOfChangeAppTheme()));
  //   }
  // }
}
