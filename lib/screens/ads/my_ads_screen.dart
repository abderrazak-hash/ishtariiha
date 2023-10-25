import 'package:flutter/material.dart';
import 'package:ishtariha/controllers/ads_controller.dart';
import 'package:ishtariha/controllers/navbar_controller.dart';
import 'package:ishtariha/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
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
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          'إعلاناتي',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: adsController.ads.length,
                        itemBuilder: (context, index) => AdCard(
                          ad: adsController.ads[index],
                          isMyAd: true,
                        ),
                      ),
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
