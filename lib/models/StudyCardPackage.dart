import 'dart:math';

import 'StudyCard.dart';

class StudyCardPackage {
  List<StudyCard> _cards = new List.filled(0, null);
  String _name;

  StudyCardPackage(this._name);

  void addCard(StudyCard card) {
    this._cards.add(card);
  }

  void removeCard(int index) {
    this._cards.removeAt(index);
  }

  void updateCard(int index, StudyCard card) {
    this._cards[index] = card;
  }

  List<StudyCard> getCards() {
    //The idea of shuffling is that we don't want that user memorize words by the card order.
    //This can happen and in order to avoid that we just need to change the order
    this._cards.shuffle(Random(DateTime.now().day));
    return this._cards;
  }
}
