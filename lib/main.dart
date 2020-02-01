import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 8}
      ],
    },
    {
      'questionText': 'What is your favorite   animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Goat', 'score': 3},
        {'text': 'Tiger', 'score': 8}
      ],
    },
    {
      'questionText': 'Who is your favorite   instructor?',
      'answers': [
        {'text': 'Maximillian', 'score': 10},
        {'text': 'Brad', 'score': 8},
        {'text': 'Wes', 'score': 8},
        {'text': 'Bucky', 'score': 8}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    print(_totalScore);

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First APP'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
