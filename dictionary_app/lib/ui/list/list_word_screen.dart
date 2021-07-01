import 'package:dictionary_app/model/word_response.dart';
import 'package:dictionary_app/ui/detailes/detail_screen.dart';
import 'package:flutter/material.dart';

class ListWordScreen extends StatelessWidget {
  final List<WordResponse> words;
  ListWordScreen({this.words});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282828),
      body: Center(
        child: Container(
          width: 200,
          child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Search Result",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "${index + 1} -> ${words[index].word}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    wordResponse: words[index],
                                  )));
                    },
                  ),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.blueGrey,
                  ),
              itemCount: words.length),
        ),
      ),
    );
  }
}
