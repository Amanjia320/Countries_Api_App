// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class FavouriteItemProvider with ChangeNotifier {
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItem(int value) {
    //the parameter int value is used to receive an external value that you want to add to the _selectedItem list.
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selectedItem.remove(value);
    notifyListeners();
  }
}
