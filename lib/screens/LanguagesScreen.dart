import 'package:flutter/material.dart';
import 'dart:core';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
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

  Map<String, String> dictionary = {
    'Spanish': 'SP',
    'Italian': 'IT',
    'German': 'DE',
    'Arab': 'AR',
    'Greek': 'GR',
    'Thai': 'TH',
    'Chinese': 'CH',
    'French': 'FR'
  };

  List<Language> languages = <Language>[
    Language(
      1,
      'Spanish',
    ),
    Language(
      2,
      'Italian',
    ),
    Language(
      3,
      'German',
    ),
    Language(
      4,
      'Arab',
    ),
    Language(
      5,
      'Greek',
    ),
    Language(
      6,
      'Thai',
    ),
    Language(
      7,
      'Chinese',
    ),
    Language(
      8,
      'French',
    )
  ];

  List<Language> newDataList;

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
                hintText: 'Type languages',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return Ink(
                  color: data.selected ? Colors.lightGreen : Colors.transparent,
                  child: ListTile(
                      title: Text(data.title),
                      onTap: () {
                        setState(() {
                          data.selected = !data.selected;

                          print("${data.title} is now ${data.selected ? "selected" : "not selected"}");
                          print(dictionary[data.title]);
                        });
                      }),
                );
              }).toList(),
            ),
          ),
          Expanded(
              child: Column(children: [
                Text('Selected languages :'),
                Expanded(
                    child: ListView(
                        children: newDataList.where((l) => l.selected).map((l) => Padding(child: Text(l.title), padding: EdgeInsets.only(right: 10))).toList()))
              ]))
        ],
      ),
    );
  }
}

class Language {
  final int id;
  final String title;
  bool selected = false;

  Language(this.id, this.title);
}

