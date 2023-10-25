import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/ads_controller.dart';
import 'package:ishtariha/controllers/navbar_controller.dart';
import 'package:ishtariha/controllers/search_controller.dart';
import 'package:ishtariha/screens/search/search_result.dart';
import 'package:ishtariha/utils.dart';
import 'package:ishtariha/widgets/button.dart';
import 'package:ishtariha/widgets/input.dart';
import 'package:ishtariha/widgets/selector.dart';
import 'package:provider/provider.dart';

class SerachScreen extends StatelessWidget {
  const SerachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchController1>(
        builder: (context, searchController, child) {
      return Consumer<NavigationController>(
        builder: (context, navigationController, child) {
          return Consumer<AdsController>(
            builder: (context, adsController, child) {
              return SafeArea(
                child: Scaffold(
                  // resizeToAvoidBottomInset: false,
                  body: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const SizedBox(height: 15.0),
                        // const Align(
                        //   alignment: Alignment.center,
                        //   child: Text(
                        //     'صفحة البحث',
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 20.0,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 15.0),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * .85,
                                      child: Input(
                                        hintText: 'بحث',
                                        textAlign: TextAlign.right,
                                        onChanged: (value) {
                                          searchController.changeLabel(value);
                                        },
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
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2.0,
                                              color: mainClr,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50.0),
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
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
                                              const EdgeInsets.fromLTRB(
                                                  20, 0, 20, 0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 180.0,
                                      child: IshSelector(
                                        title: searchController.mark,
                                        items: const [
                                          'Ferrari',
                                          'BMW',
                                          'Chevrolet'
                                        ],
                                        onSelect: (value) {
                                          searchController.changeMark(value);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    const Text('ماركة السيارة'),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 180.0,
                                      child: IshSelector(
                                        title: searchController.model,
                                        items: const [
                                          '1IBM 7.C',
                                          'RSD 21.DD',
                                          'QPS D77'
                                        ],
                                        onSelect: (value) {
                                          searchController.changeModel(value);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    const Text('موديل السيارة'),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 180.0,
                                      child: IshSelector(
                                          title: searchController.year,
                                          items: List.generate(
                                            20,
                                            (index) =>
                                                (2022 - index).toString(),
                                          ),
                                          onSelect: (value) {
                                            searchController.changeYear(value);
                                          }),
                                    ),
                                    const SizedBox(width: 20.0),
                                    const Text('سنة الصنع'),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 180.0,
                                      child: IshSelector(
                                        title: searchController.city,
                                        items: const [
                                          'الرياض',
                                          'جدة',
                                          'الدمام'
                                        ],
                                        onSelect: (value) {
                                          searchController.changecity(value);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    const Text('المدينة'),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Button(
                                  onPressed: () {
                                    navigationController
                                        .naviagte(const SearchResultScreen());
                                    navigationController.changeIndex(3);
                                  },
                                  label: 'فلترة',
                                  width: screenWidth * .6,
                                ),
                                Container(),
                                const SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }
}
