import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData temaPrincipal() {
  TextTheme _temaTextoPrincipal(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 28.0,
          color: Color(0xFFFAFAFA),
          fontWeight: FontWeight.bold,
        ),
        headline2: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 20.0,
          color: Color(0xFFFAFAFA),
          fontWeight: FontWeight.bold,
        ),
        headline3: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 16.0,
          color: Color(0xFFFAFAFA),
          fontWeight: FontWeight.w900,
        ),
        headline4: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 14,
          color: Colors.black.withOpacity(.75),
          fontWeight: FontWeight.normal,
        ),
        headline5: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 14,
          color: Color(0xFFFAFAFA),
          fontWeight: FontWeight.bold,
        ),
        headline6: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 12.0,
          color: Color(0xF242526),
          fontWeight: FontWeight.normal,
        ),
        subtitle1: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 14.0,
          color: Color(0xFFFAFAFA),
        ),
        subtitle2: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 11.0,
          fontWeight: FontWeight.normal,
          color: Color(0xF242526).withOpacity(.7),
        ),
        bodyText1: base.bodyText1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 11.0,
          color: Color(0xF242526),
        ),
        bodyText2: base.bodyText2.copyWith(color: Color(0xff21649B)));
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: _temaTextoPrincipal(base.textTheme),
    backgroundColor: Color(0xFFFAFAFA),
    cardColor: Color(0xFFFAFAFA),
    primaryColor: Color(0xFF00A5FF),
    primaryColorLight: Color(0xFFE1EAF3),
    primaryColorDark: Color(0xFF0a1c29),
    shadowColor: Colors.black.withOpacity(.3),
  );
}
