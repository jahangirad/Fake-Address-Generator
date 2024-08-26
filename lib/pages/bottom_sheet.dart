import 'package:fake_info/utils/colors_code_and_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetPage {
  static Future<void> showBottomSheet() async {
    // Countries list
    List<String> countries = ['Select Country', 'Bangladesh', 'India', 'Pakistan', 'Nepal', 'Sri Lanka'];
    List<String> shortName = ['', 'BD', 'IN', 'PK', 'NE', 'SL'];

    // Gender list
    List<String> genders = ['Select Gender', 'Male', 'Female'];

    // Variables to store the selected country, short name, and gender
    String selectedCountry = countries[0]; // Default value is 'Select Country'
    String selectedShortName = ''; // Initially empty since 'Select Country' has no short name
    String selectedGender = genders[0]; // Default value is 'Select Gender'

    await Get.bottomSheet(
      Container(
        width: Get.width,
        height: Get.height * .8,
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
                SizedBox(height: 20),
                // Country Dropdown Button with full width and border
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: Icon(Icons.flag),
                    ),
                    value: selectedCountry == '' ? null : selectedCountry,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        int selectedIndex = countries.indexOf(newValue); // Get the index of the selected country
                        selectedCountry = newValue;
                        selectedShortName = shortName[selectedIndex]; // Set the corresponding short name

                        // Do something with the selected country and short name
                        print("Selected Country: $selectedCountry");
                        print("Selected Short Name: $selectedShortName");
                      }
                    },
                    items: countries.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                // Gender Dropdown Button with full width and border
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: Icon(Icons.person),
                    ),
                    value: selectedGender == '' ? null : selectedGender,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        selectedGender = newValue;

                        // Do something with the selected gender
                        print("Selected Gender: $selectedGender");
                      }
                    },
                    items: genders.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Close the bottom sheet
                    Get.back();
                  },
                  child: Text('Close'),
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
