import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';



class RewardedAdController extends GetxController {
  RewardedAd? _rewardedAd;
  bool isAdLoaded = false;

  @override
  void onInit() {
    super.onInit();
    loadRewardedAd();
  }

  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-8384631143651720/6782175667',
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          isAdLoaded = true;
          print('Rewarded ad loaded.');
        },
        onAdFailedToLoad: (error) {
          print('Failed to load rewarded ad: $error');
          isAdLoaded = false;
          // অ্যাড লোড না হলে কিছুক্ষণ পরে আবার লোড করতে পারেন
          Future.delayed(Duration(seconds: 10), () => loadRewardedAd());
        },
      ),
    );
  }

  void showRewardedAd() {
    if (_rewardedAd != null && isAdLoaded) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          loadRewardedAd(); // নতুন অ্যাড লোড করা
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          print('Failed to show rewarded ad: $error');
          ad.dispose();
          loadRewardedAd(); // নতুন অ্যাড লোড করা
        },
      );

      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          // ইউজারকে রিওয়ার্ড দেওয়ার কোড
          print('User earned reward: ${reward.amount} ${reward.type}');
        },
      );
    } else {
      print('Rewarded ad is not loaded yet.');
      // অ্যাড লোড না হলে ইউজারকে নোটিফাই করতে পারেন
    }
  }

  @override
  void onClose() {
    _rewardedAd?.dispose();
    super.onClose();
  }
}


