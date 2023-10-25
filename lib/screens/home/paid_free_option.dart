import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/navbar_controller.dart';
import 'package:ishtariha/screens/ads/publish_ad_screen.dart';
import 'package:ishtariha/screens/login/register_screen.dart';
import 'package:ishtariha/utils.dart';
import 'package:provider/provider.dart';

class BuyCarButton extends StatelessWidget {
  static bool show = true;
  const BuyCarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
        builder: (context, navigationController, child) {
      return InkWell(
        onTap: () {
          if (RegisterScreen.firstTime) {
            RegisterScreen.firstTime = false;
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: SizedBox(
                  height: 200.0,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        'اختر نوع اﻹعلان',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              // navigationController
                              //     .naviagte(const PublishAdScreen());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              height: 120.0,
                              decoration: BoxDecoration(
                                color: greyish,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'إعلان مدفوع',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: mainClr,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        getIcon('dollar'),
                                        color: mainClr,
                                      ),
                                      const Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Text(
                                          '97 ريال',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: mainClr,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              // navigationController
                              //     .naviagte(const PublishAdScreen());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              height: 120.0,
                              decoration: BoxDecoration(
                                color: greyish,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'إعلان مجاني',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: mainClr,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    getIcon('free'),
                                    color: mainClr,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
            // navigationController
            //     .naviagte(const PublishAdScreen());
          } else {
            navigationController.naviagte(const PublishAdScreen());
          }
        },
        child: const Text(
          'بيع سيارتك',
          style: TextStyle(
            fontSize: 20.0,
            color: mainClr,
          ),
        ),
      );
    });
  }
}
