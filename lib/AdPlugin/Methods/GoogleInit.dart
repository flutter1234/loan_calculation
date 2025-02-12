import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';

class GoogleInit {
  onInit() async {
    await MobileAds.instance.initialize();
    Logger().d("Google initialized");
  }
}
