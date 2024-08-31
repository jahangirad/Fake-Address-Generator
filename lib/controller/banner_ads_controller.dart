import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdController extends GetxController {
  BannerAd? _bannerAd;
  RxBool isAdLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();

    // ANDROID ID সংগ্রহ বন্ধ করা এবং শিশুদের জন্য উপযুক্ত বিজ্ঞাপন সেটিং করা
    RequestConfiguration requestConfiguration = RequestConfiguration(
      tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes,
      tagForUnderAgeOfConsent: TagForUnderAgeOfConsent.yes,
    );
    MobileAds.instance.updateRequestConfiguration(requestConfiguration);

    loadBannerAd();
  }

  void loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-8384631143651720/5729884220', // তোমার ব্যানার অ্যাড ইউনিট আইডি
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isAdLoaded.value = true;
          print('Banner ad loaded.');
        },
        onAdFailedToLoad: (ad, error) {
          print('Failed to load banner ad: $error');
          ad.dispose();
        },
      ),
    )..load();
  }

  BannerAd? get bannerAd => _bannerAd;

  @override
  void onClose() {
    _bannerAd?.dispose();
    super.onClose();
  }
}
