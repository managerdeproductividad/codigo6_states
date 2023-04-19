import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  List<String> people = [];

  addPerson(String person) {
    people.add(person);
    notifyListeners();
  }
}