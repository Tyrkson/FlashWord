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

  TextEditingController languageAController = new TextEditingController();
  TextEditingController languageBController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          buildTextField(context, languageAController, "Language a"),
          buildTextField(context, languageBController, "Language b"),
          ElevatedButton(onPressed: () => addAndSave(), child: Text("Add a Card"),
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor, // background
              onPrimary: Theme.of(context).primaryColor),
          ),
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

  Padding buildTextField(BuildContext context, TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
              decoration: InputDecoration(hintText: hintText,
              hintStyle: TextStyle(
                color: Theme.of(context).textTheme.bodyText2.color,
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).textTheme.bodyText1.color)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
              filled: true,
              fillColor: Colors.white,
              ),
              controller: controller,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
              textAlign: TextAlign.center,
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

  addAndSave() {
    setState(() {
      cards.add(new StudyCard(languageAController.text, languageBController.text));
    });
  }
}
