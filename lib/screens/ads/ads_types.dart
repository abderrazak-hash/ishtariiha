import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/ads_controller.dart';
import 'package:ishtariha/controllers/navbar_controller.dart';
import 'package:ishtariha/screens/login/register_screen.dart';
import 'package:ishtariha/utils.dart';
import 'package:ishtariha/widgets/button.dart';
import 'package:provider/provider.dart';

class AdsTypesScreen extends StatelessWidget {
  const AdsTypesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return Consumer<AdsController>(
          builder: (context, adsController, child) {
            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                // floatingActionButton: const PublishAdButton(),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'اختر نوع اﻹعلان',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 270,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // height: 300,
                            width: screenWidth * .45,
                            // padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(width: 1.5, color: orange),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 70,
                                    width: 50,
                                    // padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      color: orange,
                                      border:
                                          Border.all(width: 1.5, color: orange),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(26.0),
                                        bottomRight: Radius.circular(26.0),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'مميز',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 20.0,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    const Text(
                                      'مميز',
                                      style: TextStyle(
                                        color: mainClr,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          item(
                                              label: 'فعال لمدة 60 يوم',
                                              clr: mainClr),
                                          item(
                                              label: 'رفع حتى 10 صور',
                                              clr: mainClr),
                                          item(
                                              label: 'مميز حتى 5 أيام',
                                              clr: mainClr),
                                          item(
                                              label: 'يحدث كل 15 يوم',
                                              clr: mainClr),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Button(
                                      onPressed: () {
                                        // if (RegisterScreen.firstTime) {
                                        // RegisterScreen.firstTime = false;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen(),
                                          ),
                                        );
                                        // } else {
                                        //   navigationController.naviagte(
                                        //       const PublishAdScreen());
                                        // }
                                      },
                                      son: Container(
                                        height: 35,
                                        width: 120,
                                        // padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                          color: orange,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'استمر',
                                            style: TextStyle(
                                              color: white,
                                              fontSize: 18.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // height: 225,
                            width: screenWidth * .45,
                            // padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(
                                width: 1.5,
                                color: const Color(0xFFD9D9D9),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 70,
                                    width: 50,
                                    // padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD9D9D9),
                                      border: Border.all(
                                        width: 1.5,
                                        color: const Color(0xFFD9D9D9),
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(26.0),
                                        bottomRight: Radius.circular(26.0),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'مجاني',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 16.0,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    const Text(
                                      'مجاني',
                                      style: TextStyle(
                                        color: mainClr,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          item(
                                            label: 'فعال لمدة 30 يوم',
                                            clr: const Color(0xFF9d9d9d),
                                          ),
                                          item(
                                            label: 'رفع 5 صور فقط',
                                            clr: const Color(0xFF9d9d9d),
                                          ),
                                          item(
                                            label:
                                                'يمكن أن يكون لديك إعلانات أساسية نشطة',
                                            clr: const Color(0xFF9d9d9d),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Button(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen(),
                                          ),
                                        );
                                      },
                                      son: Container(
                                        height: 35,
                                        width: 120,
                                        // padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                          color: Color(0xFFD9D9D9),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'استمر',
                                            style: TextStyle(
                                              color: white,
                                              fontSize: 18.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget item({required String label, required Color clr}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: mainClr,
              fontSize: 15.0,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            SvgPicture.asset(
              getIcon('tick'),
              color: clr,
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
