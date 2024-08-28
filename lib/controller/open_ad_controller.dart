import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';



class AppOpenAdController extends GetxController {
  AppOpenAd? _appOpenAd;
  bool isAdLoaded = false;

  @override
  void onInit() {
    super.onInit();
    loadAppOpenAd();
  }

  void loadAppOpenAd() {
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

  void _showAdIfAvailable() {
    if (_appOpenAd != null && isAdLoaded) {
      _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          isAdLoaded = false;
          print("App Open Ad Dismissed");
          loadAppOpenAd(); // নতুন অ্যাড লোড করা
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          isAdLoaded = false;
          print("Failed to show App Open Ad: $error");
          loadAppOpenAd(); // নতুন অ্যাড লোড করা
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

