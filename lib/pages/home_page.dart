import 'package:fake_info/utils/colors_code_and_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../controller/banner_ads_controller.dart';
import '../controller/data_get_controller.dart';
import '../widgets/custom_text.dart';
import 'bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomSheetPage bottomSheetPage = BottomSheetPage();
    final AllData getRandomAllData = Get.put(AllData());
    final BannerAdController bannerAdController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FakeInfo",
          style: TextStyle(
            fontFamily: "GreatVibes",
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: ColorsCodeAndIcon.textColor
          ),
        ),
        backgroundColor: ColorsCodeAndIcon.appbarColor,
        actions: [
          GestureDetector(
            onTap: () async {
              await bottomSheetPage.showBottomSheet(); // Accessing the instance method
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image(
                image: AssetImage(ColorsCodeAndIcon.searchIcon),
                width: Get.width * .10,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(() {
            var userData = getRandomAllData.randomData.isNotEmpty
                ? getRandomAllData.randomData[0]
                : null;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorsCodeAndIcon.textColor,
                      radius: 60.0,
                      backgroundImage: userData != null
                          ? NetworkImage(userData.picture.thumbnail)
                          : AssetImage(ColorsCodeAndIcon.profileImg) as ImageProvider,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * .2,
                              child: CustomText("Name"),
                            ),
                            SizedBox(
                              width: Get.width * .01,
                              child: Text(":"),
                            ),
                            SizedBox(
                              width: Get.width * .35,
                              child: CustomText(userData != null && userData.name.first != null && userData.name.last != null
                                  ? " ${userData.name.first} ${userData.name.last}"
                                  : " AD Jahangir"),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * .2,
                              child: CustomText("Gender"),
                            ),
                            SizedBox(
                              width: Get.width * .01,
                              child: Text(":"),
                            ),
                            SizedBox(
                              width: Get.width * .35,
                              child: CustomText(userData != null && userData.gender != null
                                  ? " ${userData.gender}"
                                  : " Male"),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * .2,
                              child: CustomText("Title"),
                            ),
                            SizedBox(
                              width: Get.width * .01,
                              child: Text(":"),
                            ),
                            SizedBox(
                              width: Get.width * .35,
                              child: CustomText(userData != null && userData.name.title != null
                                  ? " ${userData.name.title}"
                                  : " Mr"),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * .2,
                              child: CustomText("DateOfBirth"),
                            ),
                            SizedBox(
                              width: Get.width * .01,
                              child: Text(":"),
                            ),
                            SizedBox(
                              width: Get.width * .35,
                              child: CustomText(userData != null && userData.dob.date != null
                                  ? " ${userData.dob.date.toLocal().toString().split(' ')[0]}" // Display only the date part
                                  : " 15-05-2001"),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * .2,
                              child: CustomText("SSN"),
                            ),
                            SizedBox(
                              width: Get.width * .01,
                              child: Text(":"),
                            ),
                            SizedBox(
                              width: Get.width * .35,
                              child: CustomText(userData != null && userData.id.value != null
                                  ? " ${userData.id.value}"
                                  : " 5565160073"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  "Address",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .25,
                      height: Get.height * .03,
                      child: CustomText("Street"),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                      height: Get.height * .03,
                      child: CustomText(":"),
                    ),
                    SizedBox(
                      width: Get.width * .66,
                      height: Get.height * .03,
                      child: CustomText(userData != null && userData.location.street.number != null && userData.location.street.name != null
                          ? " ${userData.location.street.number} ${userData.location.street.name}"
                          : " 5720 Rangpur"),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .25,
                      height: Get.height * .03,
                      child: CustomText("City"),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                      height: Get.height * .03,
                      child: CustomText(":"),
                    ),
                    SizedBox(
                      width: Get.width * .66,
                      height: Get.height * .03,
                      child: CustomText(userData != null && userData.location.city != null
                          ? " ${userData.location.city}"
                          : " Rangpur"),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .25,
                      height: Get.height * .03,
                      child: CustomText("State"),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                      height: Get.height * .03,
                      child: CustomText(":"),
                    ),
                    SizedBox(
                      width: Get.width * .66,
                      height: Get.height * .03,
                      child: CustomText(userData != null && userData.location.state != null
                          ? " ${userData.location.state}"
                          : " Rangpur"),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .25,
                      height: Get.height * .03,
                      child: CustomText("Country"),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                      height: Get.height * .03,
                      child: CustomText(":"),
                    ),
                    SizedBox(
                      width: Get.width * .66,
                      height: Get.height * .03,
                      child: CustomText(userData != null && userData.location.country != null
                          ? " ${userData.location.country}"
                          : " Bangladesh"),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .25,
                      height: Get.height * .03,
                      child: CustomText("Zip Code"),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                      height: Get.height * .03,
                      child: CustomText(":"),
                    ),
                    SizedBox(
                      width: Get.width * .66,
                      height: Get.height * .03,
                      child: CustomText(userData != null && userData.location.postcode != null
                          ? " ${userData.location.postcode}"
                          : " 5720"),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .25,
                      height: Get.height * .03,
                      child: CustomText("Phone"),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                      height: Get.height * .03,
                      child: CustomText(":"),
                    ),
                    SizedBox(
                      width: Get.width * .66,
                      height: Get.height * .03,
                      child: CustomText(userData != null && userData.phone != null
                          ? " ${userData.phone}"
                          : " 01796196500"),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .25,
                      height: Get.height * .03,
                      child: CustomText("Cell Phone"),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                      height: Get.height * .03,
                      child: CustomText(":"),
                    ),
                    SizedBox(
                      width: Get.width * .66,
                      height: Get.height * .03,
                      child: CustomText(userData != null && userData.cell != null
                          ? " ${userData.cell}"
                          : " 01796196500"),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .25,
                      height: Get.height * .03,
                      child: CustomText("E-mail"),
                    ),
                    SizedBox(
                      width: Get.width * .01,
                      height: Get.height * .03,
                      child: CustomText(":"),
                    ),
                    SizedBox(
                      width: Get.width * .66,
                      height: Get.height * .03,
                      child: CustomText(userData != null && userData.email != null
                          ? " ${userData.email}"
                          : " jahangirad14@gmail.com"),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Obx((){
                    var userData = getRandomAllData.randomData.isNotEmpty
                        ? getRandomAllData.randomData[0]
                        : null;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ... অন্যান্য UI অংশগুলো অপরিবর্তিত থাকুক
                        SizedBox(height: 20),
                        if (bannerAdController.isAdLoaded.value)
                          Container(
                            width: bannerAdController.bannerAd!.size.width.toDouble(),
                            height: bannerAdController.bannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: bannerAdController.bannerAd!),
                          ),
                      ],
                    );
                  }),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
