import 'package:flutter/material.dart';

Text CustomText(String text){
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Roboto",
      fontSize: 14,
      fontWeight: FontWeight.w600
    ),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}