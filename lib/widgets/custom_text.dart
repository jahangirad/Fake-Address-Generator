import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text CustomText(String text){
  return Text(
    text,
    style: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w600
    ),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}