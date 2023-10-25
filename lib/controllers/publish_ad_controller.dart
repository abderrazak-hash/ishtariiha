import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';

class PublishAdController extends ChangeNotifier {
  List<PlatformFile> files = [];

  void uploadFile() async {
    final result = await FilePicker.platform.pickFiles();
    files.addAll(result!.files.toList());
    notifyListeners();
  }
}
