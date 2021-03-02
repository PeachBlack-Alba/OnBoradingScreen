import 'package:flutter/material.dart';
import 'package:onBoarding/ui/ModelCheckBox.dart';

class InterestHobbies extends StatefulWidget {
  @override
  _InterestHobbiesState createState() => _InterestHobbiesState();
}

class _InterestHobbiesState extends State<InterestHobbies> {
  final interests = [
    ModelCheckbox(title: 'Sports'),
    ModelCheckbox(title: 'Playing an instrument'),
    ModelCheckbox(title: 'Listening to music'),
    ModelCheckbox(title: 'Reading'),
    ModelCheckbox(title: 'Gaming'),
    ModelCheckbox(title: 'Cooking'),
    ModelCheckbox(title: 'Fitness'),
    ModelCheckbox(title: 'Tattoo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: interests.map((interest) => buildSingleCheckbox(interest)).toList(),
      ),
    );
  }

  Widget buildSingleCheckbox(ModelCheckbox interest) => buildCheckbox(
      interest: interest,
      onClicked: () {
        setState(() {
          final newValue = !interest.value;
          interest.value = newValue;
        });
      });

  Widget buildCheckbox({
    @required ModelCheckbox interest,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: interest.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(interest.title),
      );
}
