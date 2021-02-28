import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
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

  List<Music> languages = <Music>[
    Music(
      1,
      'A&B',
    ),
    Music(
      2,
      'Rock',
    ),
    Music(
      3,
      'Pop',
    ),
    Music(
      4,
      'Latin',
    ),
    Music(
      5,
      'Techno',
    ),
    Music(
      6,
      'Flamenco',
    ),
    Music(
      7,
      'Hip Hop',
    ),
    Music(
      8,
      'Rap',
    )
  ];

  List<Music> newDataList;

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
                hintText: 'Type Music genres',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return Ink(
                  color: data.selected ? TheBaseColors.lightGreen : Colors.transparent,

                  child: ListTile(
                      title: Text(data.title),
                      onTap: () {
                        setState(() {
                          data.selected = !data.selected;

                          print("${data.title} is now ${data.selected ? "selected" : "not selected"}");
                        });
                      }),
                );
              }).toList(),
            ),
          ),
          Expanded(
              child: Column(children: [
                Text('Selected Music genres :'),
                Expanded(
                    child: ListView(
                        children: newDataList.where((l) => l.selected).map((l) => Padding(child: Text(l.title), padding: EdgeInsets.only(right: 10))).toList()))
              ]))
        ],
      ),
    );
  }
}

class Music {
  final int id;
  final String title;
  bool selected = false;

  Music(this.id, this.title);

}
