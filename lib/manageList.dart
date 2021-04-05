import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/StudyCard.dart';
import 'models/TestData.dart';

class ManageList extends StatefulWidget {
  @override
  _ManageListState createState() => _ManageListState();
}

class _ManageListState extends State<ManageList> {
  String _languageA;

  String _languageB;

  List<StudyCard> cards = testcards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: "Language a"),
              onSubmitted: (String v) => setState(() {
                _languageA = v;
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: "Language b"),
              onSubmitted: (String v) => setState(() {
                _languageB = v;
              }),
            ),
          ),
          ElevatedButton(onPressed: () => add(), child: Text("Add a Card")),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: Row(
                    children: [
                      Text(cards[index].getWord1()),
                      Text(cards[index].getWord2()),
                    ],
                  ));
                }),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Title',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20, color: Theme.of(context).textTheme.bodyText1?.color),
      ),
    );
  }

  add() {
    setState(() {
      cards.add(new StudyCard(_languageA, _languageB));
    });
  }
}
