import 'dart:ffi';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

import 'question.dart';

class QuizBrain {
  int _current_number = 0;
  List<Widget> _correction = [];
  List<Question> _quizbank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true)
  ];
  String getQuestion() {
    return _quizbank[_current_number].questionText;
  }

  bool getAnswer() {
    return _quizbank[_current_number].questionAnswer;
  }

  void corrections(bool choice) {
    if (choice == getAnswer()) {
      _correction.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      _correction.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }

  List<Widget> mark() {
    return _correction; // Kembalikan array _correction
  }

  void nextquestion(BuildContext context) {
    if (_current_number < _quizbank.length - 1) {
      _current_number++;
    } else {
      Alert(
        context: context,
        type: AlertType.success,
        title: "QUIZ COMPLETE!",
        desc: "Good job for finish this quiz!",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      reset();
    }
  }

  void reset() {
    _correction.clear();
    _current_number = 0;
  }
}
