import 'package:dictionary_app/bloc/dictionary_bloc.dart';
import 'package:dictionary_app/repository/words_repo.dart';
import 'package:dictionary_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final dictionaryBloc = context.watch<DictionaryBloc>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary App',
      home: BlocProvider(
        create: (context) => DictionaryBloc(wordRepository: WordRepository()),
        child: HomeScreen(),
      ),
    );
  }
}
