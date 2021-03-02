import 'package:flutter/material.dart';

class ModelCheckbox {
  String title;
  bool value;

  ModelCheckbox({
    @required this.title,
    this.value = false,
  });
}