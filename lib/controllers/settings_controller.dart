import 'package:flutter/widgets.dart';

class SettingsController extends ChangeNotifier {
  TextEditingController phoneController =
      TextEditingController(text: '0756238491');
  bool showPhone = false, removeAds = false;

  void switchShowPhone(bool? value) {
    showPhone = value!;
    notifyListeners();
  }

  void switchRemoveAds(bool? value) {
    removeAds = value!;
    notifyListeners();
  }
}
