

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int questionIndex = 0;

  bool showResultMessage = false;

  int score = 0;

  List<Map<String, dynamic>> questionsWithAnswers = [
    {
      'question': 'what is your favorite sport?',
      'answers': ['football', 'tennis', 'basketball', 'volleyball'],
      'correctAnswer': 'tennis'
    },
    {
      'question': 'what is your favorite animal?',
      'answers': ['camel', 'horse', 'dog', 'cat'],
      'correctAnswer': 'cat'
    },
    {
      'question': 'what is your favorite color?',
      'answers': ['red', 'green', 'purple', 'blue'],
      'correctAnswer': 'purple'
    }
  ];

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      showResultMessage = false;
      score = 0;
    });
  }

  void onPress(int questionIndx, String answer){
    if(questionIndx == 0 && answer == 'tennis') score++;
    if(questionIndx == 1 && answer == 'cat') score++;
    if(questionIndx == 2 && answer == 'purple') score++;

  }

  @override
  Widget build(BuildContext context) {
    final questionWithAnswer = questionsWithAnswers[questionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Quiz App')),
      ),
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (showResultMessage == false) ...[
            Text(
              questionWithAnswer['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16.0),
            for (int i = 0; i < questionWithAnswer['answers'].length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        onPress(questionIndex,questionWithAnswer['answers'][i]);
                        
                        if (questionIndex < questionsWithAnswers.length - 1) {
                          setState(() {
                            questionIndex++;
                          });
                        } else {
                          setState(() {
                            showResultMessage = true;
                          });
                        }
                      },
                      child: Text(questionWithAnswer['answers'][i])),
                ),
              )
          ] //if
          ,
          if (showResultMessage == true) ...[
            if(score >= 2)...[
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ]else Text('Oops!', style: TextStyle(fontSize:30, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text(
              'Your score is: $score/${questionsWithAnswers.length}',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(onPressed: resetQuiz, child: Text('Reset Quiz'))
          ]
        ]),
      ),
    ));
  }
}
