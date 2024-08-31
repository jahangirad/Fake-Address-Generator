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
        // Label section
        Expanded(
          flex: 2, // Adjust flex as needed
          child: CustomText(label),
        ),
        SizedBox(width: 8), // Space between label and value
        // Value section
        Expanded(
          flex: 4, // Adjust flex as needed
          child: CustomText(value),
        ),
      ],
    ),
  );
}

Widget buildCopyableRow2(String label, String value) {
  return GestureDetector(
    onTap: () {
      Clipboard.setData(ClipboardData(text: value));
      Get.snackbar("Copied", "$label copied to clipboard");
    },
    child: Row(
      children: [
        // Label section
        Expanded(
          flex: 2, // Adjust flex as needed
          child: CustomText(label),
        ),
        SizedBox(width: 8), // Space between label and value
        // Value section
        Expanded(
          flex: 6, // Adjust flex as needed
          child: CustomText(value),
        ),
      ],
    ),
  );
}
