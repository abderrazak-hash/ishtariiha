import 'package:flutter/cupertino.dart';

class SearchController1 extends ChangeNotifier {
  String model = '', mark = '', year = '', city = '', label = '';

  void changeModel(String value) {
    model = value;
    notifyListeners();
  }

  void changeMark(String value) {
    mark = value;
    notifyListeners();
  }

  void changeYear(String value) {
    year = value;

    notifyListeners();
  }

  void changecity(String value) {
    city = value;
    notifyListeners();
  }

  void changeLabel(String value) {
    label = value;
    notifyListeners();
  }
}
