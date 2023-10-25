import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/navbar_controller.dart';
import 'package:ishtariha/screens/ads/my_ads_screen.dart';
import 'package:ishtariha/screens/ads/publish_ad_screen.dart';
import 'package:ishtariha/screens/login/register_screen.dart';
import 'package:ishtariha/screens/more/conds_rules.dart';
import 'package:ishtariha/screens/more/contact_us.dart';
import 'package:ishtariha/screens/more/who_us.dart';
import 'package:ishtariha/utils.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
        builder: (context, navigationController, child) {
      return SafeArea(
        child: Scaffold(
          // floatingActionButton: const PublishAdButton(),
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // const Padding(
                //   padding: EdgeInsets.all(20.0),
                //   child: Center(
                //     child: Text(
                //       'المزيد',
                //       style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 20.0,
                //       ),
                //     ),
                //   ),
                // ),

                item(
                  title: 'حسابي',
                  icon: 'Profile',
                  action: () {
                    navigationController.naviagte(const MyAdsScreen());
                    navigationController.changeIndex(0);
                  },
                ),

                item(
                  title: 'اتصل بنا',
                  icon: 'dialer',
                  action: () {
                    navigationController.naviagte(const ContactUsScreen());
                    navigationController.changeIndex(0);
                  },
                ),

                item(
                  title: 'من نحن',
                  icon: 'info',
                  action: () {
                    navigationController.naviagte(const WhoUsScreen());
                    navigationController.changeIndex(0);
                  },
                ),

                item(
                  title: 'اﻷحكام والشروط',
                  icon: 'list',
                  action: () {
                    navigationController.naviagte(const CondsRulesScreen());
                    navigationController.changeIndex(0);
                  },
                ),

                item(
                  title: 'معارض السيارات',
                  icon: 'car',
                  action: () {
                    if (RegisterScreen.firstTime) {
                      RegisterScreen.firstTime = false;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const RegisterScreen(isShow: true),
                        ),
                      );
                    } else {
                      navigationController.naviagte(const PublishAdScreen());
                    }
                  },
                ),

                const Spacer(),
                // const Text('كل الحقوق محفوظة')
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget item(
      {required String title, required Function action, String icon = 'home'}) {
    return InkWell(
      onTap: () {
        action();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 6.0),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              color: Color(0x44000000),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ],
          color: const Color(0xFFF8F8F8),
        ),
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(width: 10.0),
            SvgPicture.asset(
              getIcon(icon),
              color: scndClr,
              // width: 30,
              // fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
