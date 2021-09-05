import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What is your favourite IDE ?",
      'answers': [
        {"text": "Visual Studio Code", "score": 7},
        {"text": "Eclipse", "score": 5},
        {"text": "IntelliJ IDEA", "score": 10}
      ]
    },
    {
      'questionText': "What is your favourite programming language ?",
      'answers': [
        {"text": "Dart", "score": 3},
        {"text": "Java", "score": 7},
        {"text": "Javascript", "score": 5}
      ]
    },
    {
      'questionText': "What is your favourite Stact ?",
      'answers': [
        {"text": "MERN", "score": 10},
        {"text": "MEAN", "score": 7},
        {"text": "MEVN", "score": 5}
      ]
    },
    {
      'questionText': "What is favourite Operating System?",
      'answers': [
        {"text": "Linux", "score": 7},
        {"text": "Windows", "score": 5},
        {"text": "MacOs", "score": 10}
      ]
    },
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
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quesions"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
