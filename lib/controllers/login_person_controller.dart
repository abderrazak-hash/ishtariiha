import 'package:flutter/material.dart';
import 'package:ishtariha/models/client.dart';
import 'package:ishtariha/screens/login/register_screen.dart';
import 'package:ishtariha/screens/nav_bar.dart';

class LoginPersonController extends ChangeNotifier {
  late User client;
  bool keepConnected = false;

  LoginPersonController() {
    client = User();
  }

  void switchKeepConnected(value) {
    keepConnected = value;
    notifyListeners();
  }

  void login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const IshtarihaNaviagtion(),
      ),
    );
  }

  void register(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }
}
