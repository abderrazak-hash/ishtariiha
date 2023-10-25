import 'package:flutter/material.dart';
import 'package:ishtariha/constants.dart';

class WhoUsScreen extends StatelessWidget {
  const WhoUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'صفحة من نحن',
        style: TextStyle(
          fontSize: 20.0,
          color: mainClr,
        ),
      ),
    );
  }
}
