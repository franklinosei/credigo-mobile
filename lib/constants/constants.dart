import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const defaultPadding = 20.0;

const Color blueColor = Color(0xFF324CFE);
const whiteColor = Colors.white;
const skipColor = Color(0xFF72777A);
const blackColor = Colors.black;
const textLabelColor = Colors.black;
const borderColor = blueColor;
const redColor = Colors.red;
const grayColor = Colors.grey;
const blueLight = Color(0xFFF4F6FE);
const greenColor = Color(0xFF00992B);
const greenLight = Color(0xFFCEF7E5);

InputDecoration textInputDecoration = InputDecoration(
  hintStyle: GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: textLabelColor,
      fontSize: 20,
    ),
  ),
  contentPadding: const EdgeInsets.all(20),
  labelStyle: GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: textLabelColor,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: borderColor,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: borderColor,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: grayColor,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: redColor,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: borderColor,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
);
