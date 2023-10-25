import 'package:flutter/material.dart';
import 'package:ishtariha/constants.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'صفحة اتصل بنا',
        style: TextStyle(
          fontSize: 20.0,
          color: mainClr,
        ),
      ),
    );
  }
}
