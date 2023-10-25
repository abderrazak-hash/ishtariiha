import 'package:flutter/widgets.dart';
import 'package:ishtariha/models/ad.dart';

class AdsController extends ChangeNotifier {
  List<Ad> ads = [];

  AdsController() {
    ads = [
      Ad(
        mark: 'Land Rover',
        model: 'CJS TVW 1.25 8T',
        city: 'الرياض',
        phone: '04 68 59 46 53',
        photos: ['1', '1', '1', '1'],
        price: 125453,
        distance: 30000,
        isSpecial: true,
      ),
      Ad(
        mark: 'Mercedes',
        model: 'JAGORA C78',
        city: 'الدمام',
        phone: '07 85 63 19 24',
        photos: ['1', '', '1', '1'],
        price: 125453,
        distance: 30000,
      ),
      Ad(
        mark: 'Ferrari',
        model: 'F8 FERRARI',
        city: 'جدة',
        phone: '02 48 73 65 12',
        photos: ['1', '1', '1', '1'],
        price: 125453,
        distance: 30000,
      ),
      Ad(
        mark: 'BMW',
        model: 'BM98 T1.2 RS',
        city: 'الطائف',
        phone: '08 45 96 12 73',
        photos: ['1', '1', '1', '1'],
        price: 125453,
        distance: 30000,
        isSpecial: true,
      ),
      Ad(
        mark: 'RangeRover',
        model: 'RangeRover BDT CDTI 241',
        city: 'الرياض',
        phone: '06 32 78 15 49',
        photos: ['1', '1', '1', '1'],
        price: 125453,
        distance: 30000,
        isSpecial: true,
      ),
      Ad(
        mark: 'LamberGuini',
        model: 'LM 2.2',
        city: 'الدمام',
        phone: '05 32 41 62 81',
        photos: ['1', '1', '1', '1'],
        price: 125453,
        distance: 30000,
      ),
    ];
  }

  void publishAd(Ad ad) {
    ads.add(ad);
    notifyListeners();
  }

  // void favorizeAd(Ad ad) {
  //   // ad.isSpecial = true;
  //   notifyListeners();
  // }

  // void unfavorizeAd(Ad ad) {
  //   ad.isSpecial = false;
  //   notifyListeners();
  // }

  void removeAd(Ad ad) {
    ads.remove(ad);
    notifyListeners();
  }
}
