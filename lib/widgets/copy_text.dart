import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart'; // কপি করার জন্য এটি প্রয়োজন
import 'custom_text.dart';



Widget buildCopyableRow(String label, String value) {
  return GestureDetector(
    onTap: () {
      Clipboard.setData(ClipboardData(text: value));
      Get.snackbar("Copied", "$label copied to clipboard");
    },
    child: Row(
      children: [
        SizedBox(
          width: Get.width * .2,
          child: CustomText(label),
        ),
        SizedBox(
          width: Get.width * .01,
          child: Text(":"),
        ),
        SizedBox(
          width: Get.width * .6,
          child: CustomText(value),
        ),
      ],
    ),
  );
}