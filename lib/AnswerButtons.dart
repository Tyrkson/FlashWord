import 'package:flutter/material.dart';
import 'answerButton.dart';
import 'models/AnswerOptions.dart';

class AnswerButtons extends StatelessWidget {
  final revealAndGetNewCard;
  final cardAnswer;

  AnswerButtons(this.revealAndGetNewCard, this.cardAnswer);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          answerButton(answerOptions.Good, revealAndGetNewCard, cardAnswer),
          answerButton(
              answerOptions.Quite_good, revealAndGetNewCard, cardAnswer),
          answerButton(answerOptions.Bad, revealAndGetNewCard, cardAnswer),
        ],
      ),
    );
  }
}
