import 'package:flash_word/models/AnswerOptions.dart';

class StudyCard {
  String _word1;
  String _word2;

  DateTime _lastAsked;
  DateTime _askAgain;

  int _answeredWellRate =
      0; //Shows how well the user knows this particular card the higher it is the later it will be asked again
  int _answeredTimes = 0; //This is just to show statistics later

  answerOptions _lastAnswer;

  StudyCard(this._word1, this._word2) {
    this._askAgain = DateTime.now();
  }

  void answer(answerOptions option) {
    //Revalue the variables
    this._askAgain = DateTime.now();
    this._lastAsked = DateTime.now();
    this._lastAnswer = option;
    this._answeredTimes += 1;

    //Determine the next date when the card will be asked again
    if (option.index == 0) {
      //For every good answer in a row ask the same card the number of the streak days later
      //Hence if the card is answered well 2 times then we show it again minimum 2 days later
      this._answeredWellRate += 1;
      this._askAgain =
          this._askAgain.add(new Duration(days: this._answeredWellRate));
    } else if (option.index == 1) {
      //If answered so so (better well than worse) then we divide the duration by 2
      this._answeredWellRate = (this._answeredWellRate / 2).round();
      this._askAgain = this._askAgain.add(new Duration(
          days: this._answeredWellRate,
          minutes: this._answeredWellRate == 0 ? 10 : 0));
    } else {
      //Reset back to 0 if answered poorly, I know, quite harsh :P
      this._answeredWellRate = 0;
      //3 minutes should be enough
      this._askAgain = this._askAgain.add(new Duration(minutes: 3));
    }
  }

  bool isReadyToAskAgain() {
    return DateTime.now().isAfter(this._askAgain);
  }

  String getWord1() {
    return this._word1;
  }

  String getWord2() {
    return this._word2;
  }
}
