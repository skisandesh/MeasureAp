import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const greyColor = Color(0XFF6C7278);
const black600Color = Color(0XFF1A1C1E);
const blue700Color = Color(0XFF003F70);
const orange700Color = Color(0XFFFD7702);

///
final mediumType12 = GoogleFonts.manrope(fontSize: 12, color: greyColor);
final mediumType12Orange =
    GoogleFonts.manrope(fontSize: 12, color: orange700Color);

///bold
final boldType12 = GoogleFonts.manrope(
    fontSize: 12, color: const Color(0XFF6C7278), fontWeight: FontWeight.w700);
final boldType14 = GoogleFonts.manrope(
    fontSize: 14, color: const Color(0XFF6C7278), fontWeight: FontWeight.w700);
final boldType16 = GoogleFonts.manrope(
    fontSize: 16, fontWeight: FontWeight.w700, color: black600Color);
final boldType18 = GoogleFonts.manrope(
    fontSize: 18, fontWeight: FontWeight.w700, color: black600Color);
final w600Type18 = GoogleFonts.manrope(
    fontSize: 18, fontWeight: FontWeight.w600, color: black600Color);

// colored text
final body14Extrabold = GoogleFonts.manrope(
    fontSize: 14, fontWeight: FontWeight.w800, color: blue700Color);
final body14Medium = GoogleFonts.manrope(fontSize: 14, color: blue700Color);


final body14ExtraboldOrange = GoogleFonts.manrope(
    fontSize: 14, fontWeight: FontWeight.w800, color: orange700Color);
final body14MediumOrange =
    GoogleFonts.manrope(fontSize: 14, color: orange700Color);
