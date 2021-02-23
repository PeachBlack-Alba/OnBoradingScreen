import 'package:flutter/material.dart';

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
  TextEditingController _textController = TextEditingController();

  // var selectedLanguage = SelectedLanguage();

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

  List<String> newDataList = List.from(Language);

  onItemChanged(String value) {
    setState(() {
      newDataList = languages.where((string) => string.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              textInputAction: TextInputAction.continueAction,
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
                return ListTile(
                    title: Text(data),
                    onTap: () {
                      setState(() {
                        Language.selected = !Language.selected;

                        print(Language[index].selected.toString());
                      });
                    });
              }).toList(),
            ),
          )
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
