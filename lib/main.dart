import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/banner_ads_controller.dart';
import 'controller/open_ad_controller.dart';
import 'controller/rewarded_ads_controller.dart';
import 'pages/home_page.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppOpenAdController());
  Get.put(RewardedAdController());
  Get.put(BannerAdController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FakeInfo",
      initialRoute: "HomePage",
      routes: {
        "HomePage": (context) => HomePage(),
      },
    );
  }
}

