import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(this._questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Blue', 'Black', 'Red', 'White']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Lion', 'Panther', 'Rat']
      },
      {
        'questionText': 'Who\'s your favorite Musician?',
        'answers': ['Micheal Jackson', 'Petit Pays', 'Arafat', '2 Face']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[this._questionIndex]['questionText']),
            ...(questions[this._questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(this._answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
