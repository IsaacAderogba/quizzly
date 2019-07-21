import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    const questions = const [
      {
        'questionText': "What's your favourite color?",
        'answers': [
          'Black',
          'Red',
          'Green',
          'White',
        ]
      },
      {
        'questionText': "What's your favourite animal?",
        'answers': [
          'Rabbit',
          'Snake',
          'Elephant',
          'Lion',
        ]
      },
      {
        'questionText': "What's your favourite instructor?",
        'answers': [
          'Max',
          'Stephen',
          'Gabe',
          'Isaac',
        ]
      },
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My First App"),
      ),
      body: Column(
        children: <Widget>[
          Question(questions[_questionIndex]['questionText']),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList() // generates a new list
        ],
      ),
    ));
  }

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }
}
