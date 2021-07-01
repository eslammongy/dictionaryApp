import 'package:dictionary_app/bloc/dictionary_bloc.dart';
import 'package:dictionary_app/bloc/dictionary_state.dart';
import 'package:dictionary_app/ui/list/list_word_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dictionaryBloc = context.watch<DictionaryBloc>();
    return BlocListener(
        listener: (context, state) {
          if (state is WordSearchedState && state.listWords != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ListWordScreen(
                          words: state.listWords,
                        )));
          }
        },
        bloc: dictionaryBloc,
        child: Scaffold(
          backgroundColor: Color(0xff282828),
          body: dictionaryBloc.state is WordSearchingState
              ? getLoadingWidget()
              : dictionaryBloc.state is ErrorSearchState
                  ? getErrorWidget("There was an error when searching !!")
                  : dictionaryBloc.state is NoWordToSearchSate
                      ? getDictionaryFormWidget(context)
                      : ListWordScreen(),
        ));
  }

  getDictionaryFormWidget(BuildContext context) {
    final dictionaryBloc = context.watch<DictionaryBloc>();
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.10,
              ),
              // Container(
              //   width: double.infinity,
              //   child: IconButton(
              //       alignment: Alignment.topRight,
              //       onPressed: () {
              //         ThemeMode.light;
              //       },
              //       icon: Icon(Icons.brightness_medium_rounded)),
              // ),
              Image.asset(
                "assets/images/logo_image.png",
                height: 180,
                width: 200,
              ),
              Text(
                "Dictionary App",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Search any word you want quickly",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: dictionaryBloc.queryTextControll,
                decoration: InputDecoration(
                  hintText: "Search a word",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.1,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    dictionaryBloc.getWordResultSearched();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Colors.green,
                      padding: const EdgeInsets.all(16)),
                  child: Text(
                    "SEARCH",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 5,
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget getErrorWidget(String message) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/error_image.png"),
          Text(
            "$message",
            style: TextStyle(fontSize: 25, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
