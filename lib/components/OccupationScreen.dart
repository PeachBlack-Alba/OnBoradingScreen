import 'package:flutter/material.dart';

class OccupationScreen extends StatefulWidget {
  @override
  _OccupationScreenState createState() => _OccupationScreenState();
}

class _OccupationScreenState extends State<OccupationScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListSearch(),
    );
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  final TextEditingController _textController = TextEditingController();

  // var selectedLanguage = SelectedLanguage();

  List<Occupation> languages = <Occupation>[
    Occupation(
      1,
      'Software Developer',
    ),
    Occupation(
      2,
      'Psychologist',
    ),
    Occupation(
      3,
      'Student',
    ),
    Occupation(
      4,
      'Marketing',
    ),
    Occupation(
      5,
      'Human Resources',
    ),
    Occupation(
      6,
      'Nurse',
    ),
    Occupation(
      7,
      'Actor',
    ),
    Occupation(
      8,
      'Artist',
    )
  ];

  List<Occupation> newDataList;

  onItemChanged(String value) {
    setState(() {
      newDataList = languages.where((lang) => lang.title.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  initState() {
    super.initState();
    newDataList = [...languages];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Type Occupation',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return ListTile(
                    title: Text(data.title),
                    onTap: () {
                      setState(() {
                        data.selected = !data.selected;

                        print("${data.title} is now ${data.selected ? "selected" : "not selected"}");
                      });
                    });
              }).toList(),
            ),
          ),
          Expanded(
              child: Column(children: [
                Text('Selected Occupation :'),
                Expanded(
                    child: ListView(
                        children: newDataList.where((l) => l.selected).map((l) => Padding(child: Text(l.title), padding: EdgeInsets.only(right: 10))).toList()))
              ]))
        ],
      ),
    );
  }
}

class Occupation {
  final int id;
  final String title;
  bool selected = false;

  Occupation(this.id, this.title);
}
