import 'package:fake_info/utils/colors_code_and_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../controller/banner_ads_controller.dart';
import '../controller/data_get_controller.dart';
import '../widgets/copy_text.dart';
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
            color: ColorsCodeAndIcon.textColor,
          ),
        ),
        backgroundColor: ColorsCodeAndIcon.appbarColor,
        actions: [
          GestureDetector(
            onTap: () {
              bottomSheetPage.showBottomSheet();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image(
                image: AssetImage(ColorsCodeAndIcon.searchIcon),
                width: Get.width * .10,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CircleAvatar(
                        backgroundColor: ColorsCodeAndIcon.textColor,
                        radius: 60.0,
                        backgroundImage: getRandomAllData.randomData.isNotEmpty
                            ? NetworkImage(getRandomAllData.randomData[0].picture.thumbnail)
                            : AssetImage(ColorsCodeAndIcon.profileImg) as ImageProvider,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildCopyableRow(
                            "Name",
                            getRandomAllData.randomData.isNotEmpty &&
                                getRandomAllData.randomData[0].name.first != null &&
                                getRandomAllData.randomData[0].name.last != null
                                ? " ${getRandomAllData.randomData[0].name.first} ${getRandomAllData.randomData[0].name.last}"
                                : " AD Jahangir",
                          ),
                          SizedBox(height: 8),
                          buildCopyableRow(
                            "Gender",
                            getRandomAllData.randomData.isNotEmpty &&
                                getRandomAllData.randomData[0].gender != null
                                ? " ${getRandomAllData.randomData[0].gender}"
                                : " Male",
                          ),
                          SizedBox(height: 8),
                          buildCopyableRow(
                            "Title",
                            getRandomAllData.randomData.isNotEmpty &&
                                getRandomAllData.randomData[0].name.title != null
                                ? " ${getRandomAllData.randomData[0].name.title}"
                                : " Mr",
                          ),
                          SizedBox(height: 8),
                          buildCopyableRow(
                            "DateOfBirth",
                            getRandomAllData.randomData.isNotEmpty &&
                                getRandomAllData.randomData[0].dob.date != null
                                ? " ${getRandomAllData.randomData[0].dob.date.toLocal().toString().split(' ')[0]}"
                                : " 15-05-2001",
                          ),
                          SizedBox(height: 8),
                          buildCopyableRow(
                            "SSN",
                            getRandomAllData.randomData.isNotEmpty &&
                                getRandomAllData.randomData[0].id.value != null
                                ? " ${getRandomAllData.randomData[0].id.value}"
                                : " 5565160073",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  "Address",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                buildCopyableRow2(
                  "Street",
                  getRandomAllData.randomData.isNotEmpty &&
                      getRandomAllData.randomData[0].location.street.number != null &&
                      getRandomAllData.randomData[0].location.street.name != null
                      ? " ${getRandomAllData.randomData[0].location.street.number} ${getRandomAllData.randomData[0].location.street.name}"
                      : " 5720 Rangpur",
                ),
                SizedBox(height: 8),
                buildCopyableRow2(
                  "City",
                  getRandomAllData.randomData.isNotEmpty &&
                      getRandomAllData.randomData[0].location.city != null
                      ? " ${getRandomAllData.randomData[0].location.city}"
                      : " Rangpur",
                ),
                SizedBox(height: 8),
                buildCopyableRow2(
                  "State",
                  getRandomAllData.randomData.isNotEmpty &&
                      getRandomAllData.randomData[0].location.state != null
                      ? " ${getRandomAllData.randomData[0].location.state}"
                      : " Rangpur",
                ),
                SizedBox(height: 8),
                buildCopyableRow2(
                  "Country",
                  getRandomAllData.randomData.isNotEmpty &&
                      getRandomAllData.randomData[0].location.country != null
                      ? " ${getRandomAllData.randomData[0].location.country}"
                      : " Bangladesh",
                ),
                SizedBox(height: 8),
                buildCopyableRow2(
                  "Zip Code",
                  getRandomAllData.randomData.isNotEmpty &&
                      getRandomAllData.randomData[0].location.postcode != null
                      ? " ${getRandomAllData.randomData[0].location.postcode}"
                      : " 5720",
                ),
                SizedBox(height: 8),
                buildCopyableRow2(
                  "Phone",
                  getRandomAllData.randomData.isNotEmpty &&
                      getRandomAllData.randomData[0].phone != null
                      ? " ${getRandomAllData.randomData[0].phone}"
                      : " 01796196500",
                ),
                SizedBox(height: 8),
                buildCopyableRow2(
                  "Cell Phone",
                  getRandomAllData.randomData.isNotEmpty &&
                      getRandomAllData.randomData[0].cell != null
                      ? " ${getRandomAllData.randomData[0].cell}"
                      : " 01796196500",
                ),
                SizedBox(height: 8),
                buildCopyableRow2(
                  "E-mail",
                  getRandomAllData.randomData.isNotEmpty &&
                      getRandomAllData.randomData[0].email != null
                      ? " ${getRandomAllData.randomData[0].email}"
                      : " jahangirad14@gmail.com",
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
