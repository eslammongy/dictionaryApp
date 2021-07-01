import 'package:dictionary_app/model/word_response.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final WordResponse wordResponse;

  DetailsScreen({this.wordResponse});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282828),
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "${wordResponse.word}",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final meaning = wordResponse.meanings[index];
                  final definations = meaning.definitions;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meaning.partOfSpeech,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ListView.separated(
                          itemBuilder: (context, index) => Column(
                            children: [
                              Text(
                                "Defination : " + definations[index].definition,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Sentence  : ${definations[index].example}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "synonyms  : ${definations[index].synonyms}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              // Text(
                              //   "Phonetic  : ${wordResponse.phonetics[index].text}",
                              //   style: TextStyle(
                              //       color: Colors.white, fontSize: 20),
                              // ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                          itemCount: definations.length,
                          shrinkWrap: true,
                        )
                      ],
                    ),
                  );
                },
                itemCount: wordResponse.meanings.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
