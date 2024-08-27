import 'package:fake_info/utils/colors_code_and_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/data_get_controller.dart';

class BottomSheetPage {

  final AllData allRandomData = Get.put(AllData()); // Get Data From Api

  Future<void> showBottomSheet() async {
    // Countries list
    List<String> countries = [
      'Select Country',
      'Australia',
      'Brazil',
      'Canada',
      'Switzerland',
      'Germany',
      'Denmark',
      'Spain',
      'Finland',
      'France',
      'United Kingdom',
      'Ireland',
      'India',
      'Iran',
      'Mexico',
      'Netherlands',
      'Norway',
      'New Zealand',
      'Serbia',
      'Turkey',
      'Ukraine',
      'United States'
    ];
    List<String> shortName = [
      '',
      'AU',
      'BR',
      'CA',
      'CH',
      'DE',
      'DK',
      'ES',
      'FI',
      'FR',
      'GB',
      'IE',
      'IN',
      'IR',
      'MX',
      'NL',
      'NO',
      'NZ',
      'RS',
      'TR',
      'UA',
      'US'
    ];

    // Gender list
    List<String> genders = ['Select Gender', 'Male', 'Female'];
    List<String> shortGenders = ['', 'male', 'female'];

    // Reactive variables
    var selectedCountry = 'Select Country'.obs;
    var selectedShortName = ''.obs;
    var selectedGender = 'Select Gender'.obs;
    var selectedShortGender = "".obs;

    await Get.bottomSheet(
      Container(
        width: Get.width,
        height: Get.height * .4,
        decoration: BoxDecoration(
          color: ColorsCodeAndIcon.bottomSheetColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Get.height * .02),
                // Country Dropdown Button with full width and border
                SizedBox(
                  width: double.infinity,
                  child: Obx(() => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: Icon(Icons.flag),
                    ),
                    value: selectedCountry.value,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        int selectedIndex = countries.indexOf(newValue);
                        selectedCountry.value = newValue;
                        selectedShortName.value = shortName[selectedIndex];
                      }
                    },
                    items: countries.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                ),
                SizedBox(height: Get.height * .02),
                // Gender Dropdown Button with full width and border
                SizedBox(
                  width: double.infinity,
                  child: Obx(() => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: Icon(Icons.person),
                    ),
                    value: selectedGender.value,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        int selectedIndex = genders.indexOf(newValue);
                        selectedGender.value = newValue;
                        selectedShortGender.value = shortGenders[selectedIndex];
                      }
                    },
                    items: genders.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                ),
                SizedBox(height: Get.height * .03),
                GestureDetector(
                  onTap: () async{
                    await allRandomData.getApiData(
                        selectedShortName.value, selectedShortGender.value);
                    Get.back();
                    print(allRandomData.randomData);
                  },
                  child: Container(
                    height: Get.height * .07,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: ColorsCodeAndIcon.appbarColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Text("Search", style: TextStyle(
                          color: ColorsCodeAndIcon.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }
}
