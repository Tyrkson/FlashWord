import 'package:flutter/material.dart';
import 'models/AnswerOptions.dart';

// ignore: camel_case_types
class answerButton extends StatelessWidget {
  answerOptions _option;
  String _name;
  final reveal;
  final answer;

  answerButton(this._option, this.reveal, this.answer) {
    if (this._option == answerOptions.Good) this._name = "Good";
    if (this._option == answerOptions.Quite_good) this._name = "Quite Good";
    if (this._option == answerOptions.Bad) this._name = "Bad";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              child: Text(
                this._name,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              onPressed: () => answerProcess(),
              //color: Theme.of(context).accentColor,
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor, // background
                  onPrimary: Theme.of(context).primaryColor),
            ),
          ),
        ),
        Spacer()
      ],
    );
  }

  answerProcess() {
    this.answer(this._option);
    this.reveal();
  }
}
