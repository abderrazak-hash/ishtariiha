import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/navbar_controller.dart';
import 'package:ishtariha/controllers/publish_ad_controller.dart';
import 'package:ishtariha/utils.dart';
import 'package:ishtariha/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PublishAdScreen extends StatefulWidget {
  const PublishAdScreen({Key? key}) : super(key: key);

  @override
  State<PublishAdScreen> createState() => _PublishAdScreenState();
}

class _PublishAdScreenState extends State<PublishAdScreen> {
  CarouselController crslCtrl = CarouselController();
  int selectedSlide = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PublishAdController>(
      create: (context) => PublishAdController(),
      child: Consumer<PublishAdController>(
          builder: (context, publishAdController, child) {
        return Consumer<NavigationController>(
          builder: (context, navigationController, child) {
            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              'بيع سيارتك',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(
                                width: double.infinity,
                              ),
                              const Text(
                                'ماركة السيارة',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Input(hintText: 'ماركة السيارة'),
                              const SizedBox(height: 25.0),
                              const Text(
                                'موديل السيارة',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Input(hintText: 'موديل السيارة'),
                              const SizedBox(height: 25.0),
                              const Text(
                                'سنة السيارة',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Input(hintText: 'سنة السيارة'),
                              const SizedBox(height: 25.0),
                              const Text(
                                'ممشى السيارة',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Input(hintText: 'ممشى السيارة'),
                              const SizedBox(height: 25.0),
                              const Text(
                                'محرك السيارة',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Input(hintText: 'محرك السيارة'),
                              const SizedBox(height: 25.0),
                              const Text(
                                'حالة السيارة',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Input(hintText: 'حالة السيارة'),
                              const SizedBox(height: 25.0),
                              const Text(
                                'سعر السيارة',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Input(hintText: 'سعر السيارة'),
                              const SizedBox(height: 25.0),
                              const Text(
                                'المدينة',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Input(hintText: 'المدينة'),
                              const SizedBox(height: 10.0),
                              const Text(
                                'صور السيارة',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              if (publishAdController.files.isNotEmpty)
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 160.0,
                                      child: CarouselSlider(
                                        carouselController: crslCtrl,
                                        options: CarouselOptions(
                                          height: 160.0,
                                          viewportFraction: 0.75,
                                          enlargeCenterPage: true,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              selectedSlide = index;
                                            });
                                          },
                                        ),
                                        items: publishAdController.files
                                            .map(
                                              (e) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                                child: Image.file(
                                                  File(e.path!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Center(
                                      child: AnimatedSmoothIndicator(
                                        activeIndex: selectedSlide,
                                        count: publishAdController.files.length,
                                        effect: const WormEffect(
                                          activeDotColor: mainClr,
                                          dotColor: grey,
                                        ),
                                        onDotClicked: (index) {
                                          crslCtrl.animateToPage(index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  publishAdController.uploadFile();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(getIcon('gallery')),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'رفع صور',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              Button(
                                onPressed: () {
                                  navigationController.naviagte(
                                      navigationController.screens[3]);
                                },
                                label: 'نشر اﻹعلان',
                                width: screenWidth * .6,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
