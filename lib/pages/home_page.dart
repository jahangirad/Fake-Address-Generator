import 'package:fake_info/utils/colors_code_and_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_sheet.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FakeInfo",
          style: GoogleFonts.greatVibes(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: ColorsCodeAndIcon.textColor,
          ),
        ),
        backgroundColor: ColorsCodeAndIcon.appbarColor,
        actions: [
          GestureDetector(
            onTap: () async {
              await BottomSheetPage.showBottomSheet(); // Correct usage with Future
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
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 100, // Example height to make the container visible
            ),
          ],
        ),
      ),
    );
  }
}
