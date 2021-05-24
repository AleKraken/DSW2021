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
          color: Color(0xFFFAFAFA),
          fontWeight: FontWeight.normal,
        ),
        headline5: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 13,
          color: Color(0xFFFAFAFA),
          fontWeight: FontWeight.normal,
        ),
        headline6: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 12.0,
          color: Color(0xF242526),
          fontWeight: FontWeight.normal,
        ),
        subtitle1: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 11.0,
          color: Color(0xF242526).withOpacity(.7),
        ),
        subtitle2: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 11.0,
          fontWeight: FontWeight.bold,
          color: Color(0xF242526).withOpacity(.7),
        ),
        bodyText1: base.bodyText1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 11.0,
          color: Color(0xF242526),
        ),
        bodyText2: base.bodyText2.copyWith(color: Color(0xff21649B)));
  }

  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    textTheme: _temaTextoPrincipal(base.textTheme),
    backgroundColor: Color(0xFFFAFAFA),
    cardColor: Color(0xFF384045),
    primaryColor: Color(0xFF00A5FF),
    primaryColorLight: Color(0xFF5BA5FF),
    primaryColorDark: Color(0xFF0a1c29),
    shadowColor: Colors.black.withOpacity(.9),
  );
}

//

ThemeData temaSecundario() {
  TextTheme _temaTextoPrincipal(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 15.0,
          color: Colors.black.withOpacity(.8),
          fontWeight: FontWeight.bold,
        ),
        headline2: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 17.0,
          color: Colors.black.withOpacity(.8),
          fontWeight: FontWeight.bold,
        ),
        headline3: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 22.0,
          color: Colors.black.withOpacity(.8),
          fontWeight: FontWeight.w900,
        ),
        subtitle1: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 11.0,
          color: Colors.black.withOpacity(.5),
        ),
        subtitle2: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 12.0,
          color: Colors.black.withOpacity(.5),
        ),
        headline4: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 15,
          color: Colors.black.withOpacity(.8),
          fontWeight: FontWeight.bold,
        ),
        headline5: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 12.0,
          color: Colors.black.withOpacity(.8),
        ),
        headline6: base.headline1.copyWith(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontSize: 16.0,
          color: Colors.black.withOpacity(.8),
          fontWeight: FontWeight.bold,
        ),
        bodyText2: base.bodyText2.copyWith(color: Colors.black),
        bodyText1: base.bodyText2.copyWith(color: Color(0xff21649B)));
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: _temaTextoPrincipal(base.textTheme),
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    primaryColor: Color(0xFF45AAB4),
    primaryColorLight: Color(0xFF5BA5FF),
    primaryColorDark: Color(0xFF1A51BA),
    iconTheme: IconThemeData(
      color: Colors.white.withOpacity(.5),
      size: 21,
    ),
    accentIconTheme: IconThemeData(
      color: Colors.white,
    ),
    buttonColor: Color(0xFF45AAB4),
    shadowColor: Colors.black.withOpacity(.5),
    indicatorColor: Color(0xFF45AAB4),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(headline1: base.textTheme.headline1),
      color: Color(0xFF45AAB4),
    ),
    accentColor: Color(0xFFF45151),
    bottomAppBarColor: Color(0xFF2E3336),
  );
}
