import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/ads_controller.dart';
import 'package:ishtariha/controllers/navbar_controller.dart';
import 'package:ishtariha/models/ad.dart';
import 'package:ishtariha/screens/ads/view_ad.dart';
import 'package:ishtariha/utils.dart';
import 'package:ishtariha/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return Consumer<AdsController>(
            builder: (context, adsController, child) {
          return SafeArea(
            child: Scaffold(
              // floatingActionButton: const PublishAdButton(),
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: screenWidth * .85,
                      child: Input(
                        hintText: 'بحث',
                        textAlign: TextAlign.right,
                        decorations: InputDecoration(
                          prefixIcon: Container(
                            width: 35.0,
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                              getIcon('search'),
                              height: 25.0,
                              width: 25.0,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          filled: true,
                          fillColor: whitish,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                              color: mainClr,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                              color: scndClr,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: greyish,
                            fontSize: 15.0,
                            letterSpacing: 1,
                          ),
                          hintTextDirection: TextDirection.rtl,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    // const Text(
                    //   'أحدث اﻹعلانات',
                    //   style: TextStyle(
                    //     fontSize: 18.0,
                    //   ),
                    // ),
                    Container(
                      height: 60.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: scndClr,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/ad.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Expanded(
                      child: ListView.builder(
                          itemCount: adsController.ads.length,
                          itemBuilder: (context, index) =>
                              AdCard(ad: adsController.ads[index])),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

class AdCard extends StatelessWidget {
  final Ad ad;
  final bool isMyAd;
  const AdCard({Key? key, required this.ad, this.isMyAd = false})
      : super(key: key);

  Widget info({required String info, required String icon}) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            info,
            style: const TextStyle(
              color: mainClr,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: mainClr,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              getIcon(icon),
              color: scndClr,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return Consumer<AdsController>(
          builder: (context, adsController, child) {
            return InkWell(
              onTap: () {
                navigationController.naviagte(ViewAdScreen(ad: ad));
              },
              child: Container(
                height: screenWidth + 120,
                width: screenWidth,
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(width: 1.5, color: greyish),
                  color: white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: screenWidth - 40,
                      width: screenWidth - 40,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              getImage(ad.photos!.first),
                              fit: BoxFit.fill,
                            ),
                          ),
                          //! Edit
                          if (isMyAd)
                            Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor: mainClr,
                                  child: SvgPicture.asset(
                                    getIcon('pan'),
                                    color: scndClr,
                                  ),
                                ),
                              ),
                            ),
                          //! Special
                          if (ad.isSpecial)
                            Positioned(
                              top: 0.0,
                              left: 0.0,
                              child: Container(
                                height: 25,
                                width: 70,
                                padding: const EdgeInsets.only(bottom: 6),
                                decoration: BoxDecoration(
                                  color: scndClr,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xCC025A01),
                                      Color(0xFF47F41C),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    'مميز',
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 16.0,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              info(
                                  info: '${ad.distance}',
                                  icon: 'Clip path group'),
                              info(info: 'محرك السيارة', icon: 'motor'),
                              info(info: '${ad.phone}', icon: 'dialer'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              info(info: ad.mark!, icon: 'car'),
                              info(info: '${ad.price}', icon: 'money'),
                              info(info: 'جديدة', icon: 'search_car'),
                            ],
                          ),
                        ),
                      ],
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
}
