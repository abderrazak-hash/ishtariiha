import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishtariha/constants.dart';
import 'package:ishtariha/controllers/navbar_controller.dart';
import 'package:ishtariha/utils.dart';
import 'package:provider/provider.dart';

class IshtarihaNaviagtion extends StatelessWidget {
  const IshtarihaNaviagtion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavigationController>(
      create: (context) => NavigationController(),
      child: Consumer<NavigationController>(
          builder: (context, navigationController, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('اشترها'),
            centerTitle: true,
            backgroundColor: mainClr,
          ),
          /*bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationController.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  getIcon('home'),
                  color:
                      navigationController.currentIndex == 4 ? mainClr : grey,
                ),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  getIcon('search'),
                  color:
                      navigationController.currentIndex == 3 ? mainClr : grey,
                ),
                label: 'البحث',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  getIcon('publish'),
                  // color: green,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  getIcon('promotion'),
                  height: 18.0,
                  width: 18.0,
                  fit: BoxFit.scaleDown,
                  color:
                      navigationController.currentIndex == 1 ? mainClr : grey,
                ),
                label: 'العروض',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  getIcon('plus'),
                  color:
                      navigationController.currentIndex == 0 ? mainClr : grey,
                ),
                label: 'المزيد',
              ),
            ].reversed.toList(),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor:
                /*navigationController.currentIndex == 2 ? green : */ mainClr,
            unselectedItemColor:
                /* navigationController.currentIndex == 2 ? green :*/ grey,
            selectedLabelStyle: const TextStyle(
              // color: mainClr,
              fontSize: 15.0,
              overflow: TextOverflow.visible,
            ),
            unselectedLabelStyle: const TextStyle(
              // color: grey,
              fontSize: 15.0,
              overflow: TextOverflow.visible,
            ),
            onTap: (index) {
              navigationController
                  .naviagte(navigationController.screens[index]);
            },
          ),*/
          body: SafeArea(
            child: Column(
              children: [
                Expanded(child: navigationController.currentScreen),
                SizedBox(
                  // height: 70.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigationController.naviagte(
                              navigationController.screens[0],
                            );
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                getIcon('plus'),
                                color: navigationController.currentIndex == 0
                                    ? mainClr
                                    : grey,
                                height: 18,
                                width: 18,
                                fit: BoxFit.fitHeight,
                              ),
                              Text(
                                'المزيد',
                                style: TextStyle(
                                  color: navigationController.currentIndex == 0
                                      ? mainClr
                                      : grey,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigationController.naviagte(
                              navigationController.screens[1],
                            );
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                getIcon('promotion'),
                                color: navigationController.currentIndex == 1
                                    ? mainClr
                                    : grey,
                                height: 18,
                                width: 18,
                                fit: BoxFit.fitHeight,
                              ),
                              Text(
                                'العروض',
                                style: TextStyle(
                                  color: navigationController.currentIndex == 1
                                      ? mainClr
                                      : grey,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigationController.naviagte(
                              navigationController.screens[2],
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/add.png',
                                // color: white,
                                height: 45,
                                width: 45,
                                fit: BoxFit.fitHeight,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // const Text(
                              //   'بيع سيارتك',
                              //   style: TextStyle(
                              //     color: green,
                              //     fontSize: 15.0,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigationController.naviagte(
                              navigationController.screens[3],
                            );
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                getIcon('search'),
                                color: navigationController.currentIndex == 3
                                    ? mainClr
                                    : grey,
                                height: 18,
                                width: 18,
                                fit: BoxFit.fitHeight,
                              ),
                              Text(
                                'البحث',
                                style: TextStyle(
                                  color: navigationController.currentIndex == 3
                                      ? mainClr
                                      : grey,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigationController.naviagte(
                              navigationController.screens[4],
                            );
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                getIcon('home'),
                                color: navigationController.currentIndex == 4
                                    ? mainClr
                                    : grey,
                                height: 18,
                                width: 18,
                                fit: BoxFit.fitHeight,
                              ),
                              Text(
                                'الرئيسية',
                                style: TextStyle(
                                  color: navigationController.currentIndex == 4
                                      ? mainClr
                                      : grey,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
