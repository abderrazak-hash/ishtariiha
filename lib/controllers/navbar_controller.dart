import 'package:flutter/widgets.dart';
import 'package:ishtariha/screens/ads/ads_screen.dart';
import 'package:ishtariha/screens/ads/ads_types.dart';
import 'package:ishtariha/screens/ads/publish_ad_screen.dart';
import 'package:ishtariha/screens/home/home_screen.dart';
import 'package:ishtariha/screens/login/register_screen.dart';
import 'package:ishtariha/screens/more/more_screen.dart';
import 'package:ishtariha/screens/search/search_screen.dart';

class NavigationController extends ChangeNotifier {
  final int initialIndex = 4;
  late List<Widget> screens;

  NavigationController() {
    screens = [
      const MoreScreen(),
      const AdsScreen(),
      RegisterScreen.firstTime
          ? const AdsTypesScreen()
          : const PublishAdScreen(),
      const SerachScreen(),
      const HomeScreen(),
    ];
    currentScreen = screens[currentIndex];
  }

  int currentIndex = 4;
  late Widget currentScreen;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void naviagte(Widget screen) {
    currentScreen = screen;
    if (screens.contains(screen)) {
      currentIndex = screens.indexOf(screen);
    } else {
      currentIndex = initialIndex;
    }
    notifyListeners();
  }
}
