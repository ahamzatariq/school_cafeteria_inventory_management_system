import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  // MenuListItems
  TextStyle headline1 = GoogleFonts.openSans(fontSize: 28);

  // ProfileText
  TextStyle headline2 = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  //TextFields
  TextStyle headline3 = GoogleFonts.mukta(
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );

  // SelectedMenuItem
  TextStyle headline4 = GoogleFonts.openSans(
    fontSize: 28,
    color: Colors.white,
  );
}
