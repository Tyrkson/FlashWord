import 'package:auto_size_text/auto_size_text.dart';
import 'package:flash_word/AnswerButtons.dart';
import 'package:flash_word/answerButton.dart';
import 'package:flash_word/main.dart';
import 'package:flash_word/manageList.dart';
import 'package:flash_word/models/StudyCard.dart';
import 'package:flash_word/models/TestData.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'models/AnswerOptions.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  bool _isAtoB = true;
  bool _isRevealed = false;

  List<StudyCard> cards = testcards;
  List<StudyCard> _readyToAskCards = List.empty(growable: true);
  StudyCard _card;

  String _cardText1;
  String _cardText2;

  String _noMoreCards = "There are no more cards left to learn rn!";

  _homeState() {
    setText();
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(
                  fontSize: 46,
                  color: Theme.of(context).textTheme.bodyText1?.color),
            ),
            SizedBox(
              height: 50,
            ),
            _card != null ? buildCardTextHolder() : Container(),
            _card != null
                ? _isRevealed
                    ? AnswerButtons(revealAndGetNewCard, _card.answer)
                    : buildRevealButtonPart()
                : Container(
                    child: AutoSizeText(
                    _noMoreCards,
                    style: TextStyle(
                        fontSize: 200,
                        color: Theme.of(context).textTheme.bodyText1?.color),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ))
          ],
        ),
      ),
    );
  }

  swap() {
    setState(() {
      String temp = _cardText2;
      _cardText2 = _cardText1;
      _cardText1 = temp;
    });
  }

  openMenu() {}

  revealAndGetNewCard() {
    reveal();
    setText();
  }

  reveal() {
    swap();
    setState(() {
      _isRevealed = !_isRevealed;
      print(_isRevealed);
    });
  }

  switchLanguages() {
    setState(() {
      _isAtoB = !_isAtoB;
    });
  }

  void setText() {
    _card = getNewCard();

    if (_card == null) return;

    _cardText1 = _card.getWord1();
    _cardText2 = _card.getWord2();
  }

  StudyCard getNewCard() {
    if (_readyToAskCards.isEmpty) {
      fillReadyCards();
    }
    //If still empty, then we have no new cards to ask right now
    if (_readyToAskCards.isEmpty) {
      return null;
    }
    return _readyToAskCards.removeAt(0);
  }

  void fillReadyCards() {
    for (StudyCard c in cards) {
      if (c.isReadyToAskAgain()) {
        _readyToAskCards.add(c);
      }
    }
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.add_to_photos_outlined,
          color: Theme.of(context).accentColor,
        ),
        onPressed: null,
      ),
      title: Text(
        '10/20',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20, color: Theme.of(context).textTheme.bodyText1?.color),
      ),
      actions: [
        FocusedMenuHolder(
          menuWidth: MediaQuery.of(context).size.width * 0.30,
          openWithTap: true,
          menuOffset: 5.0,
          onPressed: () => null,
          menuItems: [
            FocusedMenuItem(
                title: Text("Tsau Vete"),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManageList()),
                    ),
                trailingIcon: Icon(Icons.wb_sunny_sharp)),
            FocusedMenuItem(
                title: Text("Switch"),
                onPressed: () => switchLanguages(),
                trailingIcon: Icon(Icons.autorenew_rounded)),
          ],
          child: IconButton(
            icon: Icon(
              Icons.add_circle_outline_sharp,
              color: Theme.of(context).accentColor,
            ),
            onPressed: openMenu(),
          ),
        ),
      ],
    );
  }

  Expanded buildRevealButtonPart() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 120,
            height: 46,
            child: ElevatedButton(
              onPressed: () => reveal(),
              child: Text(
                "Reveal",
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor, // background
                  onPrimary: Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }

  Container buildCardTextHolder() {
    return Container(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).accentColor),
            color: Theme.of(context).primaryColor,
          ),
          child: SizedBox(
            height: 250,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    _isAtoB == true ? _cardText2 : _cardText1,
                    style: TextStyle(
                        fontSize: 200,
                        color: Theme.of(context).textTheme.bodyText1?.color),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
