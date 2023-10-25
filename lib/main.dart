import 'package:flutter/material.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/ads_controller.dart';
import 'package:ishtariha/controllers/navbar_controller.dart';
import 'package:ishtariha/controllers/search_controller.dart';
import 'package:ishtariha/controllers/settings_controller.dart';
import 'package:ishtariha/screens/nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MPayApp());
}

class MPayApp extends StatelessWidget {
  const MPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<RegisterPersonController>(
        //   create: (context) => RegisterPersonController(),
        // ),
        // ChangeNotifierProvider<RegisterShowController>(
        //   create: (context) => RegisterShowController(),
        // ),
        ChangeNotifierProvider<SearchController>(
          create: (context) => SearchController(),
        ),
        ChangeNotifierProvider<SearchController1>(
          create: (context) => SearchController1(),
        ),
        ChangeNotifierProvider<NavigationController>(
          create: (context) => NavigationController(),
        ),
        ChangeNotifierProvider<SettingsController>(
          create: (context) => SettingsController(),
        ),
        ChangeNotifierProvider<AdsController>(
          create: (context) => AdsController(),
        ),
      ],
      builder: (context, child) {
        return const MaterialApp(
          // theme: ThemeData(fontFamily: 'ElMessiri'),
          debugShowCheckedModeBanner: false,
          home: IshtarihaScreen(),
        );
      },
    );
  }
}

class IshtarihaScreen extends StatefulWidget {
  const IshtarihaScreen({Key? key}) : super(key: key);

  @override
  State<IshtarihaScreen> createState() => _IshtarihaScreenState();
}

class _IshtarihaScreenState extends State<IshtarihaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      screenHeight = MediaQuery.of(context).size.height;
      screenWidth = MediaQuery.of(context).size.width;
    });
    return const IshtarihaNaviagtion();
  }
}
