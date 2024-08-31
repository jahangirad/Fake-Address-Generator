import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppOpenAdController extends GetxController {
  AppOpenAd? _appOpenAd;
  bool isAdLoaded = false;
  bool hasShownAd = false;

  @override
  void onInit() {
    super.onInit();

    // ANDROID ID সংগ্রহ বন্ধ করা এবং শিশুদের জন্য উপযুক্ত বিজ্ঞাপন সেটিং করা
    RequestConfiguration requestConfiguration = RequestConfiguration(
      tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes,
      tagForUnderAgeOfConsent: TagForUnderAgeOfConsent.yes,
    );
    MobileAds.instance.updateRequestConfiguration(requestConfiguration);

    loadAppOpenAd();
  }

  void loadAppOpenAd() {
    if (!hasShownAd) {
      AppOpenAd.load(
        adUnitId: 'ca-app-pub-8384631143651720/9201289591',
        request: AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            _appOpenAd = ad;
            isAdLoaded = true;
            print("App Open Ad Loaded");
            _showAdIfAvailable();
          },
          onAdFailedToLoad: (error) {
            print('Failed to load an app open ad: $error');
            isAdLoaded = false;
          },
        ),
      );
    }
  }

  void _showAdIfAvailable() {
    if (_appOpenAd != null && isAdLoaded && !hasShownAd) {
      _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          isAdLoaded = false;
          hasShownAd = true;
          print("App Open Ad Dismissed");
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          isAdLoaded = false;
          print("Failed to show App Open Ad: $error");
        },
      );
      _appOpenAd!.show();
    } else {
      print("Ad is not ready to be shown.");
    }
  }

  @override
  void onClose() {
    _appOpenAd?.dispose();
    super.onClose();
  }
}
