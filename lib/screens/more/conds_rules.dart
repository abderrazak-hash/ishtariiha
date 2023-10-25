import 'package:flutter/material.dart';
import 'package:ishtariha/constants.dart';

class CondsRulesScreen extends StatelessWidget {
  const CondsRulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'صفحة اﻷحكام والشروط',
        style: TextStyle(
          fontSize: 20.0,
          color: mainClr,
        ),
      ),
    );
  }
}
