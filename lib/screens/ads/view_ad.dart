import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/ads_controller.dart';
import 'package:ishtariha/controllers/navbar_controller.dart';
import 'package:ishtariha/models/ad.dart';
import 'package:ishtariha/utils.dart';
import 'package:ishtariha/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewAdScreen extends StatefulWidget {
  final Ad ad;
  const ViewAdScreen({Key? key, required this.ad}) : super(key: key);

  @override
  State<ViewAdScreen> createState() => _ViewAdScreenState();
}

class _ViewAdScreenState extends State<ViewAdScreen> {
  CarouselController crslCtrl = CarouselController();
  late Ad ad;
  @override
  void initState() {
    super.initState();
    setState(() {
      ad = widget.ad;
    });
  }

  int selectedSlide = 0;

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
      return Consumer<AdsController>(builder: (context, adsController, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: Center(
                  //     child: Text(
                  //       ad.mark!,
                  //       style: const TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 21.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 300.0,
                        width: double.infinity,
                        child: PageView(
                          // carouselController: crslCtrl,
                          // options: CarouselOptions(
                          //   height: 160.0,
                          //   viewportFraction: 0.75,
                          //   enlargeCenterPage: true,
                          //   onPageChanged: (index, reason) {
                          //     setState(() {
                          //       selectedSlide = index;
                          //     });
                          //   },
                          // ),

                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index) {
                            setState(() {
                              selectedSlide = index;
                            });
                          },
                          children: ad.photos!
                              .map(
                                (e) => Image.asset(
                                  getImage(e),
                                  fit: BoxFit.fill,
                                  width: screenWidth,
                                  height: 240,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Column(
                          children: [
                            Center(
                              child: AnimatedSmoothIndicator(
                                activeIndex: selectedSlide,
                                count: ad.photos!.length,
                                effect: const WormEffect(
                                  activeDotColor: mainClr,
                                  dotColor: white,
                                ),
                                onDotClicked: (index) {
                                  crslCtrl.animateToPage(index);
                                },
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              decoration: const BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                              ),
                              height: 15.0,
                              width: screenWidth,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Button(
                          onPressed: null,
                          label: 'جديدة',
                          width: 90,
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'موديل السيارة: ${ad.model}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'سنة الصنع: ${ad.year}',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                  // const SizedBox(height: 15.0),
                  // const Divider(
                  //   height: 3,
                  //   thickness: 2,
                  // ),
                  // const SizedBox(height: 10.0),
                  // const Center(
                  //   child: Text(
                  //     'إعلانات أخرى',
                  //     style: TextStyle(
                  //       fontSize: 17.0,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 10.0),
                  // SizedBox(
                  //   height: 160.0,
                  //   child: CarouselSlider.builder(
                  //     options: CarouselOptions(
                  //       height: 160.0,
                  //       viewportFraction: .85,
                  //       enlargeCenterPage: true,
                  //     ),
                  //     itemCount: adsController.ads.length,
                  //     itemBuilder: (context, index, jndex) => InkWell(
                  //       onTap: () {
                  //         navigationController.naviagte(ViewAdScreen(ad: ad));
                  //       },
                  //       child: AdCard(
                  //         ad: adsController.ads[index],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
